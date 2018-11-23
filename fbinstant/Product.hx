package fbinstant;

/**
	Represents a game's product information.
**/
typedef Product = {
	/**
		The title of the product
	**/
	final title:String;

	/**
		The product's game-specified identifier
	**/
	final productID:String;

	/**
		The product descriptio
	**/
	final ?description:String;

	/**
		A link to the product's associated image
	**/
	final ?imageURI:String;

	/**
		The price of the product
	**/
	final price:String;

	/**
		The currency code for the product
	**/
	final priceCurrencyCode:String;
}
