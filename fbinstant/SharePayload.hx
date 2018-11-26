package fbinstant;

/**
	Represents content to be shared by the user.
**/
typedef SharePayload = {
	/**
		Indicates the intent of the share.
	**/
	var intent:SharePayloadIntent;

	/**
		A base64 encoded image to be shared.
	**/
	var image:String;

	/**
		A text message to be shared.
	**/
	var text:String;

	/**
		A blob of data to attach to the share.
		All game sessions launched from the share will be able to access this blob through `FBInstant.getEntryPointData()`.
	**/
	@:optional var data:{};
}
