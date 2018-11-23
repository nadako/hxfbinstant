package fbinstant;

/**
	The answer field is true if the current context size is between the minSize and maxSize values that are specified in the object, and false otherwise.
**/
typedef ContextSizeResponse = {
	var answer:Bool;
	var minSize:Null<Int>;
	var maxSize:Null<Int>;
}
