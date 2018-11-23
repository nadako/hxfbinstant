package fbinstant;

/**
	A score entry for an Instant Game leaderboard
**/
extern class LeaderboardEntry {
	/**
		Gets the score associated with the entry.
	**/
	function getScore():Float;

	/**
		Gets the score associated with the entry, formatted with the score format associated with the leaderboard.
	**/
	function getFormattedScore():String;

	/**
		Gets the timestamp of when the leaderboard entry was last updated.
	**/
	function getTimestamp():Float;

	/**
		Gets the rank of the player's score in the leaderboard.
	**/
	function getRank():Float;

	/**
		Gets the developer-specified payload associated with the score, or null if one was not set.
	**/
	function getExtraData():Null<String>;

	/**
		Gets information about the player associated with the entry.
	**/
	function getPlayer():LeaderboardPlayer;
}
