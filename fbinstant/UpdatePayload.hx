package fbinstant;

/**
	A payload that describes the update.
**/
typedef UpdatePayload<T:UpdatePayload<T>> = {
	var action:UpdateAction<T>;
}
