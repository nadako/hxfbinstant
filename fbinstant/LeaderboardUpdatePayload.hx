package fbinstant;

/**
	Represents a leaderboard update for FBInstant.updateAsync.
**/
typedef LeaderboardUpdatePayload =
#if (haxe_ver >= 4)
UpdatePayload<LeaderboardUpdatePayload> & {
#else
{>UpdatePayload<LeaderboardUpdatePayload>,
#end
	/** The name of the leaderboard to feature in the update. **/
	var name:String;

	/** Optional text message. If not specified, a localized fallback message will be provided instead. **/
	@:optional var text:String;
}
