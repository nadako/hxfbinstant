package fbinstant;

/**
	Represents an individual purchase of a game product.
**/
typedef Purchase = {
	/**
		A developer-specified string, provided during the purchase of the product
	**/
	@:optional var developerPayload(default,never):String;
	/**
		The identifier for the purchase transaction
	**/
	var paymentID(default,never):String;

	/**
		The product's game-specified identifier
	**/
	var productID(default,never):String;

	/**
		Unix timestamp of when the purchase occurred
	**/
	var purchaseTime(default,never):String;

	/**
		A token representing the purchase that may be used to consume the purchase
	**/
	var purchaseToken(default,never):String;

	/**
		Server-signed encoding of the purchase request
	**/
	var signedRequest(default,never):SignedPurchaseRequest;
}
