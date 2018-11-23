package fbinstant;

/**
	Represents information about a player who is in the context that the current player is playing in.
**/
extern class ContextPlayer {
	/**
		Get the id of the context player.
	**/
	function getID():String;

	/**
		Get the player's localized display name.
	**/
	function getName():String;

	/**
		Get the player's public profile photo.
	**/
	function getPhoto():String;
}
