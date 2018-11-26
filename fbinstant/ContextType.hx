package fbinstant;

/**
	The type of the current game context.
**/
@:enum abstract ContextType(String) {
	/**
		A facebook post.
	**/
	var POST = "POST";

	/**
		A messenger thread.
	**/
	var THREAD = "THREAD";

	/**
		A facebook group.
	**/
	var GROUP = "GROUP";

	/**
		Default context, where the player is the only participant.
	**/
	var SOLO = "SOLO";
}
