package fbinstant;

/**
	Represents the type of the update action to perform.
**/
@:enum abstract UpdateAction<T:UpdatePayload<T>>(String) {
	/**
		A custom update, with all content specified by the game.
	**/
	var CUSTOM:UpdateAction<CustomUpdatePayload> = "CUSTOM";

	/**
		An update associated with an Instant Game leaderboard.
	**/
	var LEADERBOARD:UpdateAction<LeaderboardUpdatePayload> = "LEADERBOARD";
}
