package fbinstant;

import haxe.crypto.Base64;
import haxe.crypto.Hmac;
import haxe.io.Bytes;
import haxe.Json;
using StringTools;

abstract OAuth20Signature<T:{}>(String) {
	static var hmac(default,never) = new Hmac(SHA256);

	public function asString() return this;

	public function decode(appSecret:Bytes):Null<T> {
		var parts = this.split(".");
		var signature = Base64.decode(parts[0].replace("-", '+').replace("_", "/"));
		var encodedPayload = parts[1];
		var hash = hmac.make(appSecret, Bytes.ofString(encodedPayload));
		if (hash.compare(signature) == 0) {
			return Json.parse(Base64.decode(encodedPayload).toString());
		} else {
			return null;
		}
	}
}
