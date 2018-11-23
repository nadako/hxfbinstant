package fbinstant;

/**
	The type of the current game context.
**/
enum abstract ContextType(String) {
	/**
		A facebook post.
	**/
	var POST;

	/**
		A messenger thread.
	**/
	var THREAD;

	/**
		A facebook group.
	**/
	var GROUP;

	/**
		Default context, where the player is the only participant.
	**/
	var SOLO;
}
