package fbinstant;

/**
	The configuration of a purchase request for a product registered to the game.
**/
typedef PurchaseConfig = {
	/**
		The identifier of the product to purchase
	**/
	var productID:String;

	/**
		An optional developer-specified payload, to be included in the returned purchase's signed request.
	**/
	@:optional var developerPayload:String;
}
