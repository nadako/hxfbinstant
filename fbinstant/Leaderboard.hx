package fbinstant;

/**
	An Instant Game leaderboard
**/
extern class Leaderboard {
	/**
		The name of the leaderboard.
	**/
	function getName():String;

	/**
		The ID of the context that the leaderboard is associated with, or null if the leaderboard is not tied to a particular context.
	**/
	function getContextID():Null<String>;

	/**
		Fetches the total number of player entries in the leaderboard.
	**/
	function getEntryCountAsync():Promise<Int>;

	/**
		Updates the player's score. If the player has an existing score, the old score will only be replaced if the new score is better than it.
		NOTE: If the leaderboard is associated with a specific context, the game must be in that context to set a score for the player.

		@param score The new score for the player. Must be a 64-bit integer number.
		@param extraData Metadata to associate with the stored score. Must be less than 2KB in size.
	**/
	function setScoreAsync(score:Float, ?extraData:String):Promise<LeaderboardEntry>;

	/**
		Retrieves the leaderboard's entry for the current player, or null if the player has not set one yet.
	**/
	function getPlayerEntryAsync():Promise<Null<LeaderboardEntry>>;

	/**
		Retrieves a set of leaderboard entries, ordered by score ranking in the leaderboard.

		@param count The number of entries to attempt to fetch from the leaderboard. Defaults to 10 if not specified.
		             Currently, up to a maximum of 100 entries may be fetched per query.
		@param offset The offset from the top of the leaderboard that entries will be fetched from.
	**/
	function getEntriesAsync(?count:Int, ?offset:Int):Promise<Array<LeaderboardEntry>>;

	/**
		Retrieves the leaderboard score entries of the current player's connected players (including the current player), ordered by local rank within the set of connected players.

		@param count The number of entries to attempt to fetch from the leaderboard. Defaults to 10 if not specified.
		             Currently, up to a maximum of 100 entries may be fetched per query.
		@param offset The offset from the top of the leaderboard that entries will be fetched from.
	**/
	function getConnectedPlayerEntriesAsync(?count:Int, ?offset:Int):Promise<Array<LeaderboardEntry>>;
}
