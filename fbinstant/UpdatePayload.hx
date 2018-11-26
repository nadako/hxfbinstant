package fbinstant;

/**
	A payload that describes the update.

	Can be either `CustomUpdatePayload` or `LeaderboardUpdatePayload`.
**/
typedef UpdatePayload<T:UpdatePayload<T>> = {
	var action:UpdateAction<T>;
}
