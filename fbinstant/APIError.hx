package fbinstant;

/**
	An API Error returned by the Instant Games SDK
**/
extern class APIError extends js.Error {
	/**
		The relevant error code
	**/
	var code:ErrorCodeType;
}