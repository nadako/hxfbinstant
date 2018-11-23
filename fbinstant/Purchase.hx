package fbinstant;

/**
	Represents an individual purchase of a game product.
**/
typedef Purchase = {
	/**
		A developer-specified string, provided during the purchase of the product
	**/
	final ?developerPayload:String;
	/**
		The identifier for the purchase transaction
	**/
	final paymentID:String;

	/**
		The product's game-specified identifier
	**/
	final productID:String;

	/**
		Unix timestamp of when the purchase occurred
	**/
	final purchaseTime:String;

	/**
		A token representing the purchase that may be used to consume the purchase
	**/
	final purchaseToken:String;

	/**
		Server-signed encoding of the purchase request
	**/
	final signedRequest:SignedPurchaseRequest;
}
