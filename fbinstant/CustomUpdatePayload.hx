package fbinstant;

typedef CustomUpdatePayload = UpdatePayload<CustomUpdatePayload> & {
	/**
		ID of the template this custom update is using.
		Templates should be predefined in `fbapp-config.json`.
		See the Bundle Config documentation for documentation about `fbapp-config.json`.
	**/
	var template:String;

	/**
		Optional call-to-action button text.
		By default we will use a localized 'Play' as the button text.
		To provide localized versions of your own call to action,
		pass an object with the default cta as the value of 'default'
		and another object mapping locale keys to translations as the value of 'localizations'.
	**/
	var ?cta:StringOrLocalizableContent;

	/**
		Data URL of a base64 encoded image.
	**/
	var image:String;

	/**
		A text message, or an object with the default text as the value of 'default'
		and another object mapping locale keys to translations as the value of 'localizations'.
	**/
	var text:StringOrLocalizableContent;

	/**
		A blob of data to attach to the update.
		All game sessions launched from the update will be able to access this blob through `FBInstant.getEntryPointData()`.
		Must be less than or equal to 1000 characters when stringified.
	**/
	var ?data:{};

	/**
		Specifies how the update should be delivered. If no strategy is specified, we default to 'IMMEDIATE'.
	**/
	var ?strategy:CustomUpdatePayloadStrategy;

	/**
		Specifies notification setting for the custom update. Defaults to 'NO_PUSH'.

		Use push notification only for updates that are high-signal and immediately actionable for the recipients.
		Also note that push notification is not always guaranteed, depending on user setting and platform policies.
	**/
	var ?notification:CustomUpdatePayloadNotification;
}

enum abstract CustomUpdatePayloadStrategy(String) {
	/**
		The update should be posted immediately.
	**/
	var IMMEDIATE;

	/**
		The update should be posted when the game session ends. The most recent update sent using the 'LAST' strategy will be the one sent.
	**/
	var LAST;

	/**
		The update is posted immediately, and clears any other pending updates (such as those sent with the 'LAST' strategy).
	**/
	var IMMEDIATE_CLEAR;
}

enum abstract CustomUpdatePayloadNotification(String) {
	var NO_PUSH;
	var PUSH;
}
