package fbinstant;

/**
	Represents a game's product information.
**/
typedef Product = {
	/**
		The title of the product
	**/
	var title(default,never):String;

	/**
		The product's game-specified identifier
	**/
	var productID(default,never):String;

	/**
		The product descriptio
	**/
	@:optional var description(default,never):String;

	/**
		A link to the product's associated image
	**/
	@:optional var imageURI(default,never):String;

	/**
		The price of the product
	**/
	var price(default,never):String;

	/**
		The currency code for the product
	**/
	var priceCurrencyCode(default,never):String;
}
