package fbinstant;

/**
	Represents a leaderboard update for FBInstant.updateAsync.
**/
typedef LeaderboardUpdatePayload = UpdatePayload<LeaderboardUpdatePayload> & {
	/** The name of the leaderboard to feature in the update. **/
	var name:String;

	/** Optional text message. If not specified, a localized fallback message will be provided instead. **/
	var ?text:String;
}
