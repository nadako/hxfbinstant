package fbinstant;

@:enum abstract SharePayloadIntent(String) {
	var INVITE = "INVITE";
	var REQUEST = "REQUEST";
	var CHALLENGE = "CHALLENGE";
	var SHARE = "SHARE";
}
