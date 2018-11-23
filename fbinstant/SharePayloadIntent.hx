package fbinstant;

enum abstract SharePayloadIntent(String) {
	var INVITE;
	var REQUEST;
	var CHALLENGE;
	var SHARE;
}
