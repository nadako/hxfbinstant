# Facebook Instant Games SDK (FBInstant) externs for Haxe

[![Build Status](https://travis-ci.org/nadako/hxfbinstant.svg?branch=master)](https://travis-ci.org/nadako/hxfbinstant)

Simple as this. Import `fbinstant.FBInstant` and use.

API version: **6.2**

## Documentation

 * Official docs: https://developers.facebook.com/docs/games/instant-games/sdk
 * Generated Haxe API docs: https://nadako.github.io/hxfbinstant/fbinstant/FBInstant.html

## Extra functionality for signed data

Signatures from `getSignedPlayerInfoAsync` and signed requests from the `Purchase` API are represented as instances
of the special `OAuth20Signature` abstract over string with a nice `decode` function that you can use on the server
to decode (duh) the data using your app secret.
