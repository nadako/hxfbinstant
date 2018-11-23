package fbinstant;

import haxe.DynamicAccess;

/**
	Top level namespace for the Instant Games SDK.
**/
@:native("FBInstant")
extern class FBInstant {
	/**
		Contains functions and properties related to the current player.
	**/
	static final player:Player;

	/**
		Contains functions and properties related to the current game context.
	**/
	static final context:Context;

	/**
		Contains functions and properties related to payments and purchases of game products.
	**/
	static final payments:Payments;

	/**
		The current locale. See https://origincache.facebook.com/developers/resources/?id=FacebookLocales.xml for a complete list of supported locale values.
		Use this to determine what languages the current game should be localized with.
		The value will not be accurate until `FBInstant.startGameAsync()` resolves.
	**/
	static function getLocale():String;

	/**
		The platform on which the game is currently running.
		The value will always be null until `FBInstant.initializeAsync()` resolves.
	**/
	static function getPlatform():String;

	/**
		The string representation of this SDK version.
	**/
	static function getSDKVersion():String;

	/**
		Initializes the SDK library. This should be called before any other SDK functions.
	**/
	static function initializeAsync():Promise<Void>;

	/**
		Report the game's initial loading progress.

		@param percentage A number between 0 and 100.
	**/
	static function setLoadingProgress(percentage:Int):Void;

	/**
		Provides a list of API functions that are supported by the client.
	**/
	static function getSupportedAPIs():Array<String>;

	/**
		Returns any data object associated with the entry point that the game was launched from.

		The contents of the object are developer-defined, and can occur from entry points on different platforms.
		This will return null for older mobile clients, as well as when there is no data associated with the particular entry point.

		This function should be called after `FBInstant.startGameAsync()` resolves.
	**/
	static function getEntryPointData():Any;

	/**
		Returns the entry point that the game was launched from.

		This function should not be called until `FBInstant.startGameAsync` has resolved.

		@return The name of the entry point from which the user started the game
	**/
	static function getEntryPointAsync():Promise<String>;

	/**
		Sets the data associated with the individual gameplay session for the current context.

		This function should be called whenever the game would like to update the current session data.
		This session data may be used to populate a variety of payloads, such as game play webhooks.

		@param sessionData An arbitrary data object, which must be less than or equal to 1000 characters when stringified.
	**/
	static function setSessionData(sessionData:{}):Void;

	/**
		This indicates that the game has finished initial loading and is ready to start.
		Context information will be up-to-date when the returned promise resolves.
	**/
	static function startGameAsync():Promise<Void>;

	/**
		This invokes a dialog to let the user share specified content, either as a message in Messenger or as a post on the user's timeline.
		A blob of data can be attached to the share which every game session launched from the share will be able to access from `FBInstant.getEntryPointData()`.
		This data must be less than or equal to 1000 characters when stringified.
		The user may choose to cancel the share action and close the dialog, and the returned promise will resolve when the dialog is closed regardless if the user actually
		shared the content or not.
	**/
	static function shareAsync(payload:SharePayload):Promise<Void>;

	/**
		Informs Facebook of an update that occurred in the game.
		This will temporarily yield control to Facebook and Facebook will decide what to do based on what the update is.
		The returned promise will resolve/reject when Facebook returns control to the game.
	**/
	static function updateAsync<T:UpdatePayload<T>>(payload:T):Promise<Void>;

	/**
		Request that the client switch to a different Instant Game. The API will reject if the switch fails - else, the client will load the new game.

		@param appID The Application ID of the Instant Game to switch to. The application must be an Instant Game,
		             and must belong to the same business as the current game. To associate different games with the same business,
		             you can use Business Manager: https://developers.facebook.com/docs/apps/business-manager#update-business.
		@param data An optional data payload. This will be set as the entrypoint data for the game being switched to.
		            Must be less than or equal to 1000 characters when stringified.
	**/
	static function switchGameAsync(appID:String, ?data:{}):Promise<Void>;

	/**
		Returns whether or not the user is eligible to have shortcut creation requested.

		Will return false if createShortcutAsync was already called this session or the user is ineligible for shortcut creation.
	**/
	static function canCreateShortcutAsync():Promise<Bool>;

	/**
		Prompts the user to create a shortcut to the game if they are eligible to
		Can only be called once per session. (see canCreateShortcutAsync)
	**/
	static function createShortcutAsync():Promise<Void>;

	/**
		Quits the game.
	**/
	static function quit():Void;

	/**
		Log an app event with FB Analytics. See https://developers.facebook.com/docs/javascript/reference/v2.8#app_events for more details about FB Analytics.

		@param eventName Name of the event. Must be 2 to 40 characters, and can only contain '_', '-', ' ', and alphanumeric characters.
		@param valueToSum An optional numeric value that FB Analytics can calculate a sum with.
		@param Object An optional object that can contain up to 25 key-value pairs to be logged with the event.
		              Keys must be 2 to 40 characters, and can only contain '_', '-', ' ', and alphanumeric characters. Values must be less than 100 characters in length.
	**/
	static function logEvent(eventName:String, valueToSum:Float, parameters:{}):Null<APIError>;

	/**
		Set a callback to be fired when a pause event is triggered.
	**/
	static function onPause(func:()->Void):Void;

	/**
		Attempt to create an instance of interstitial ad. This instance can then be preloaded and presented.

		@param placementID The placement ID that's been setup in your Audience Network settings.
	**/
	static function getInterstitialAdAsync(placementID:String):Promise<AdInstance>;

	/**
		Attempt to create an instance of rewarded video. This instance can then be preloaded and presented.

		@param placementID The placement ID that's been setup in your Audience Network settings.
	**/
	static function getRewardedVideoAsync(placementID:String):Promise<AdInstance>;

	/**
		Attempts to match the current player with other users looking for people to play with.
		If successful, a new Messenger group thread will be created containing the matched players and the player will be context switched to that thread.
		The default minimum and maximum number of players in one matched thread are 2 and 20 respectively,
		depending on how many players are trying to get matched around the same time. The values can be changed in fbapp-config.json.
		See the Bundle Config documentation for documentation about fbapp-config.json.

		@param matchTag Optional extra information about the player used to group them with similar players.
		                Players will only be grouped with other players with exactly the same tag.
		                The tag must only include letters, numbers, and underscores and be 100 characters or less in length.
		@param switchContextWhenMatched Optional extra parameter that specifies whether the player should be immediately switched to the new context when a match is found.
		                                By default this will be false which will mean the player needs explicitly press play after being matched to switch to the new context.
	**/
	static function matchPlayerAsync(?matchTag:String, ?switchContextWhenMatched:Bool):Promise<Void>;

	/**
		Checks if the current player is eligible for the matchPlayerAsync API.
	**/
	static function checkCanPlayerMatchAsync():Promise<Bool>;

	/**
		Fetch a specific leaderboard belonging to this Instant Game.

		@param name The name of the leaderboard. Each leaderboard for an Instant Game must have its own distinct name.
	**/
	static function getLeaderboardAsync(name:String):Promise<Leaderboard>;
}

/**
	Contains functions and properties related to the current player.
**/
private extern class Player {
	/**
		A unique identifier for the player. A Facebook user's player ID will remain constant, and is scoped to a specific game.
		This means that different games will have different player IDs for the same user.
		This function should not be called until `FBInstant.initializeAsync()` has resolved.
	**/
	function getID():String;

	/**
		Fetch the player's unique identifier along with a signature that verifies that the identifier indeed comes from Facebook without being tampered with.
		This function should not be called until `FBInstant.initializeAsync()` has resolved.

		@param requestPayload A developer-specified payload to include in the signed response.
	**/
	function getSignedPlayerInfoAsync(?requestPayload:String):Promise<SignedPlayerInfo>;

	/**
		Returns a promise that resolves with whether the player can subscribe to the game bot or not.
	**/
	function canSubscribeBotAsync():Promise<Bool>;

	/**
		Request that the player subscribe the bot associated to the game.
		The API will reject if the subscription fails - else, the player will subscribe the game bot.
	**/
	function subscribeBotAsync():Promise<Void>;

	/**
		The player's localized display name.
		This function should not be called until `FBInstant.startGameAsync()` has resolved.
	**/
	function getName():String;

	/**
		A url to the player's public profile photo. The photo will always be a square, and with dimensions of at least 200x200.
		When rendering it in the game, the exact dimensions should never be assumed to be constant.
		It's recommended to always scale the image to a desired size before rendering.
		The value will always be null until `FBInstant.startGameAsync()` resolves.

		WARNING: Due to CORS, using these photos in the game canvas can cause it to be tainted,
		which will prevent the canvas data from being extracted. To prevent this, set the cross-origin attribute of the images you use to 'anonymous'.
	**/
	function getPhoto():Null<String>;

	/**
		Retrieve data from the designated cloud storage of the current player.
	**/
	function getDataAsync(keys:Array<String>):Promise<DynamicAccess<Dynamic>>;

	/**
		Retrieve data from the designated cloud storage of the current player.
	**/
	function setDataAsync(data:DynamicAccess<Dynamic>):Promise<Void>;

	/**
		Immediately flushes any changes to the player data to the designated cloud storage.
		This function is expensive, and should primarily be used for critical changes where persistence needs to be immediate and known by the game.
		Non-critical changes should rely on the platform to persist them in the background.
		NOTE: Calls to `player.setDataAsync` will be rejected while this function's result is pending.
	**/
	function flushDataAsync():Promise<Void>;

	/**
		Retrieve stats from the designated cloud storage of the current player.

		@param keys An optional array of unique keys to retrieve stats for. If the function is called without it, it will fetch all stats.
	**/
	function getStatsAsync(?keys:Array<String>):Promise<DynamicAccess<Dynamic>>;

	/**
		Set stats to be saved to the designated cloud storage of the current player.

		@param stats An object containing a set of key-value pairs that should be persisted to cloud storage as stats,
		             which can be surfaced or used in a variety of ways to benefit player engagement.
		             The object must contain only numerical values - any non-numerical values will cause the entire modification to be rejected.
	**/
	function setStatsAsync(data:DynamicAccess<Dynamic>):Promise<Void>;

	/**
		Increment stats saved in the designated cloud storage of the current player.

		@param increments An object containing a set of key-value pairs indicating how much to increment each stat in cloud storage.
		                  The object must contain only numerical values - any non-numerical values will cause the entire modification to be rejected.
	**/
	function incrementStatsAsync(increments:DynamicAccess<Dynamic>):Promise<Void>;

	/**
		Fetches an array of ConnectedPlayer objects containing information about active players (people who played the game in the last 90 days)
		that are connected to the current player.
	**/
	function getConnectedPlayersAsync():Promise<Array<ConnectedPlayer>>;
}

/**
	Contains functions and properties related to the current game context.
**/
private extern class Context {
	/**
		A unique identifier for the current game context.
		This represents a specific context that the game is being played in (for example, a particular messenger conversation or facebook post).
		The identifier will be null if game is being played in a solo context.
		This function should not be called until `FBInstant.startGameAsync` has resolved.
	**/
	function getID():Null<String>;

	/**
		The type of the current game context.
		POST - A facebook post. THREAD - A messenger thread. GROUP - A facebook group. SOLO - Default context, where the player is the only participant.

		This function should not be called until `FBInstant.startGameAsync` has resolved.
	**/
	function getType():ContextType;

	/**
		This function determines whether the number of participants in the current game context is between a given minimum and maximum, inclusive.
		If one of the bounds is null only the other bound will be checked against.
		It will always return the original result for the first call made in a context in a given game play session.
		Subsequent calls, regardless of arguments, will return the answer to the original query until a context change occurs and the query result is reset.
		This function should not be called until `FBInstant.startGameAsync` has resolved.
	**/
	function isSizeBetween(minSize:Null<Int>, maxSize:Null<Int>):ContextSizeResponse;

	/**
		Request a switch into a specific context.
		If the player does not have permission to enter that context, or if the player does not provide permission for the game to enter that context,
		this will reject. Otherwise, the promise will resolve when the game has switched into the specified context.
	**/
	function switchAsync(id:String):Promise<Void>;

	/**
		Opens a context selection dialog for the player.
		If the player selects an available context, the client will attempt to switch into that context, and resolve if successful.
		Otherwise, if the player exits the menu or the client fails to switch into the new context, this function will reject.
	**/
	function chooseAsync(?options:ContextChooseAsyncOptions):Promise<Void>;

	/**
		Attempts to create or switch into a context between a specified player and the current player.
		The returned promise will reject if the player listed is not a Connected Player of the current player
		or if the player does not provide permission to enter the new context. Otherwise, the promise will resolve
		when the game has switched into the new context.
	**/
	function createAsync(playerID:String):Promise<Void>;

	/**
		Gets an array of #contextplayer objects containing information about active players in the current context (people who played the game in the current context in the last 90 days).
		This may include the current player.
	**/
	function getPlayersAsync():Promise<Array<ContextPlayer>>;
}

typedef ContextChooseAsyncOptions = {
	/**
		The set of filters to apply to the context suggestions.
	**/
	var ?filters:Array<ContextFilter>;

	/**
		The maximum number of participants that a suggested context should ideally have.
	**/
	var ?maxSize:Int;

	/**
		The minimum number of participants that a suggested context should ideally have.
	**/
	var ?minSize:Int;
}

/**
	Contains functions and properties related to payments and purchases of game products.
**/
private extern class Payments {
	/**
		Fetches the game's product catalog.
	**/
	function getCatalogAsync():Promise<Array<Product>>;

	/**
		Begins the purchase flow for a specific product.
		Will immediately reject if called before `FBInstant.startGameAsync()` has resolved.
	**/
	function purchaseAsync(purchaseConfig:PurchaseConfig):Promise<Purchase>;

	/**
		Fetches all of the player's unconsumed purchases.
		The game must fetch the current player's purchases as soon as the client indicates that it is ready to perform payments-related operations, i.e. at game start.
		The game can then process and consume any purchases that are waiting to be consumed.
	**/
	function getPurchasesAsync():Promise<Array<Purchase>>;

	/**
		Consumes a specific purchase belonging to the current player.
		Before provisioning a product's effects to the player, the game should request the consumption of the purchased product.
		Once the purchase is successfully consumed, the game should immediately provide the player with the effects of their purchase.
	**/
	function consumePurchaseAsync(purchaseToken:String):Promise<Void>;

	/**
		Sets a callback to be triggered when `Payments` operations are available.
	**/
	function onReady(callback:()->Void):Void;
}
