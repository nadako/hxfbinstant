package fbinstant;

/**
	Represents a string with localizations and a default value to fall back on.
**/
typedef LocalizableContent = {
	/**
		he default value of the string to use if the viewer's locale is not a key in the localizations object.
	**/
	// var default:String; // meh haxe

	/**
		Specifies what string to use for viewers in each locale. See https://origincache.facebook.com/developers/resources/?id=FacebookLocales.xml for a complete list of supported locale values.
	**/
	var localizations:LocalizationsDict;
}
