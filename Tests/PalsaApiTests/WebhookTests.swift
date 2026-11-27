import XCTest
import Foundation
@testable import PalsaApi

/// Webhook verification, against the fixture the Palsa server itself signed.
///
/// A test comparing Swift's HMAC with Swift's own HMAC would prove nothing. This proves the client agrees
/// with the server, and a test on the TypeScript side asserts the same fixture still matches what the
/// server signs today, so neither can drift without a failure.
///
/// The fixture is found by walking up from this source file rather than by counting directories, which
/// is how the first run failed: every one of these nine tests threw "The file doesn't exist" in setUp
/// before checking a single signature.
final class WebhookTests: XCTestCase {

    private var secret = ""
    private var body = Data()
    private var signature = ""
    private var signedAt = Date()
    private let tenMinutes: TimeInterval = 600

    override func setUpWithError() throws {
        let raw = try Data(contentsOf: Self.fixtureURL())
        let fixture = try JSONSerialization.jsonObject(with: raw) as! [String: Any]
        secret = fixture["secret"] as! String
        body = Data((fixture["body"] as! String).utf8)
        signature = fixture["signature"] as! String
        signedAt = Date(timeIntervalSince1970: (fixture["timestampMs"] as! Double) / 1000)
    }

    /// The shared fixture, found by walking up from this file to the repository root. Counting `..`
    /// hard-codes how deep the package sits, and the package moves when it is published on its own.
    private static func fixtureURL() -> URL {
        var directory = URL(fileURLWithPath: #filePath).deletingLastPathComponent()
        while true {
            let candidate = directory
                .appendingPathComponent("tests/fixtures/webhook-signature.json")
                .standardized
            if FileManager.default.fileExists(atPath: candidate.path) { return candidate }
            let parent = directory.deletingLastPathComponent().standardized
            if parent.path == directory.path { break }
            directory = parent
        }
        // Returned rather than thrown so the failure names the file that is missing.
        return URL(fileURLWithPath: "tests/fixtures/webhook-signature.json")
    }

    func testAcceptsASignatureTheServerProduced() {
        XCTAssertTrue(Webhook.verify(body: body, signature: signature, secret: secret, now: signedAt))
    }

    func testParseReturnsTheEvent() throws {
        let event = try Webhook.parse(body: body, signature: signature, secret: secret, now: signedAt)
        XCTAssertEqual(event["type"] as? String, "notification.delivered")
    }

    func testRefusesAChangedBody() {
        let tampered = Data(String(decoding: body, as: UTF8.self).replacingOccurrences(
            of: "dlv_1", with: "dlv_2").utf8)
        XCTAssertFalse(Webhook.verify(body: tampered, signature: signature, secret: secret, now: signedAt))
    }

    func testRefusesTheWrongSecret() {
        XCTAssertFalse(
            Webhook.verify(body: body, signature: signature, secret: "whsec_other", now: signedAt))
    }

    func testRefusesAMalformedOrMissingSignature() {
        for bad in [nil, "", "v1=deadbeef", "t=notanumber,v1=deadbeef", "nonsense"] as [String?] {
            XCTAssertFalse(
                Webhook.verify(body: body, signature: bad, secret: secret, now: signedAt),
                "accepted a malformed signature: \(String(describing: bad))")
        }
    }

    func testRefusesAMovedTimestamp() {
        // The timestamp is covered by the signature, so moving it breaks the check.
        let moved = signature.replacingOccurrences(of: "t=", with: "t=1")
        XCTAssertFalse(Webhook.verify(body: body, signature: moved, secret: secret, now: signedAt))
    }

    func testRefusesOneTooOldToBeFresh() {
        // This is what stops an old delivery being replayed later.
        XCTAssertFalse(Webhook.verify(
            body: body, signature: signature, secret: secret,
            now: signedAt.addingTimeInterval(tenMinutes)))
        XCTAssertTrue(Webhook.verify(
            body: body, signature: signature, secret: secret,
            now: signedAt.addingTimeInterval(60)))
        // A wider window accepts it, for a consumer that wants one.
        XCTAssertTrue(Webhook.verify(
            body: body, signature: signature, secret: secret,
            now: signedAt.addingTimeInterval(tenMinutes), tolerance: 1200))
    }

    func testRefusesOneFromTooFarAhead() {
        // A clock far in front is as suspect as one far behind.
        XCTAssertFalse(Webhook.verify(
            body: body, signature: signature, secret: secret,
            now: signedAt.addingTimeInterval(-tenMinutes)))
    }

    func testParseThrowsRatherThanReturningNothing() {
        XCTAssertThrowsError(
            try Webhook.parse(body: body, signature: "v1=nope", secret: secret, now: signedAt))
    }
}
