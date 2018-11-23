package fbinstant;

/**
	Encoded signature returned by `SignedPlayerInfo.getSignature`.
**/
typedef Signature = OAuth20Signature<DecodedSignature>;

typedef DecodedSignature = {
	/**
		a unix timestamp of when this response was issued.
	**/
	var issued_at:Int;

	/**
		unique identifier of the player.
	**/
	var player_id:String;

	/**
		the requestPayload string you specified when calling `FBInstant.player.getSignedPlayerInfoAsync`.
	**/
	var request_payload:String;
}
