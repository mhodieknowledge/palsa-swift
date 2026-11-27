import Foundation
// CryptoKit ships with Apple's platforms and nowhere else. swift-crypto is the same API, and the
// package links it only off Apple, so a server-side Swift consumer on Linux gets a client that
// verifies webhooks instead of one that will not compile.
#if canImport(CryptoKit)
import CryptoKit
#else
import Crypto
#endif

/// Webhook signature verification.
///
/// Hand-written: it is not an API call, so no generator produces it, and it is the part of a client most
/// worth getting right. Wrong, it either trusts forged payloads or rejects genuine ones. It is tested
/// against a signature the Palsa server itself produced.
public enum Webhook {

    /// How old a signature may be. This is what stops an old delivery being replayed at you later.
    public static let defaultTolerance: TimeInterval = 300

    public struct InvalidSignature: Error, CustomStringConvertible {
        public let description = "That webhook signature did not verify."
    }

    /// Whether a webhook really came from Palsa.
    ///
    /// Pass the raw body. Parsing and re-serialising it changes the bytes and the signature will not
    /// match. The header looks like `t=<milliseconds>,v1=<hex>` and the signature covers `<t>.<body>`, so
    /// the timestamp cannot be changed without breaking it.
    public static func verify(
        body: Data,
        signature: String?,
        secret: String,
        now: Date = Date(),
        tolerance: TimeInterval = defaultTolerance
    ) -> Bool {
        guard let signature, !signature.isEmpty, !secret.isEmpty else { return false }

        var timestamp: String?
        var provided: String?
        for part in signature.split(separator: ",") {
            let pair = part.split(separator: "=", maxSplits: 1).map {
                $0.trimmingCharacters(in: .whitespaces)
            }
            guard pair.count == 2 else { continue }
            if pair[0] == "t" { timestamp = pair[1] }
            if pair[0] == "v1" { provided = pair[1] }
        }
        guard let timestamp, let provided, let signedAtMs = Double(timestamp) else { return false }

        // Too old, or too far ahead: a clock far in front is as suspect as one far behind.
        guard abs(now.timeIntervalSince1970 - signedAtMs / 1000) <= tolerance else { return false }

        var signed = Data("\(timestamp).".utf8)
        signed.append(body)
        let mac = HMAC<SHA256>.authenticationCode(
            for: signed,
            using: SymmetricKey(data: Data(secret.utf8))
        )
        let expected = mac.map { String(format: "%02x", $0) }.joined()

        // Constant time, so a wrong signature cannot be guessed a character at a time.
        return constantTimeEquals(expected, provided)
    }

    /// Verify and decode, throwing rather than returning nil: a payload that fails this check is either
    /// not from Palsa or has been tampered with, and neither should be handled as though it were an event.
    public static func parse(
        body: Data,
        signature: String?,
        secret: String,
        now: Date = Date(),
        tolerance: TimeInterval = defaultTolerance
    ) throws -> [String: Any] {
        guard verify(body: body, signature: signature, secret: secret, now: now, tolerance: tolerance)
        else { throw InvalidSignature() }
        guard let event = try JSONSerialization.jsonObject(with: body) as? [String: Any] else {
            throw InvalidSignature()
        }
        return event
    }

    private static func constantTimeEquals(_ a: String, _ b: String) -> Bool {
        let left = Array(a.utf8)
        let right = Array(b.utf8)
        guard left.count == right.count else { return false }
        var difference: UInt8 = 0
        for index in left.indices { difference |= left[index] ^ right[index] }
        return difference == 0
    }
}
