package fbinstant;

/**
	Represents a mapping from locales to translations of a given string.
	Each property is an optional five-character Facebook locale code of the form xx_XX.
	See https://origincache.facebook.com/developers/resources/?id=FacebookLocales.xml for a complete list of supported locale codes.
**/
typedef LocalizationsDict = haxe.DynamicAccess<String>;
