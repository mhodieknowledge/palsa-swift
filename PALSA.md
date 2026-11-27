# Palsa client for swift

Published to Swift Package Manager.

## Status

**Built and tested.** Swift test on Linux, 9 webhook tests passing; the CryptoKit path Apple platforms take is covered by the macOS job in CI.

The webhook verification beside it is checked against `tests/fixtures/webhook-signature.json`, a signature the Palsa server itself produced, so this client cannot drift from the server without a test failing.

## Do not edit this directory by hand

Everything here is generated from `openapi/palsa.yaml` by `scripts/generate-sdks.sh`, with the generator
version pinned in `openapi/generators.json`. The directory is deleted and rewritten on every run, so a
hand edit survives until the next regeneration and then vanishes.

An API change is a change to the specification followed by a regeneration. `.github/workflows/sdk-regenerate.yml`
fails the build if what is committed here is not what the specification produces.

## What was written by hand, and why

Webhook signature verification, which lives in `sdk-extras/swift/` and is copied in after generation. No
generator produces it, because it is not an API call, and it is the part of a client most worth getting
right: wrong, it either trusts forged payloads or rejects genuine ones.

Its rules are the same in all nine languages and are stated once in `sdk-extras/README.md`. The ones worth
knowing as a caller: verify against the **raw** body, because parsing and re-serialising changes the bytes;
and a signature older than five minutes is refused, which is what stops an old delivery being replayed at
you later.

## Keys

`pk_live_…` sends real messages and is charged. `pk_test_…` is a sandbox key: a send is accepted, costs
nothing and reaches nobody, which is the one to develop against. Keep a live key on a server.
