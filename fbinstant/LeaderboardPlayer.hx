package fbinstant;

/**
	Details about the player associated with a score entry.
**/
extern class LeaderboardPlayer {
	/**
		Gets the player's localized display name.
	**/
	function getName():String;

	/**
		Returns a url to the player's public profile photo.
	**/
	function getPhoto():Null<String>;

	/**
		Gets the game's unique identifier for the player.
	**/
	function getID():Null<String>;
}
