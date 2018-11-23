package fbinstant;

/**
	Represents information about a player who is connected to the current player.
**/
extern class ConnectedPlayer {
	/**
		Get the id of the connected player.
	**/
	function getID():String;

	/**
		Get the player's full name.
	**/
	function getName():Null<String>;

	/**
		Get the player's public profile photo.
	**/
	function getPhoto():Null<String>;
}
