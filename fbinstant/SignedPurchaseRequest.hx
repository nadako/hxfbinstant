package fbinstant;

/**
	Encoded signed purchase request provided by `Purchase.signedRequest`.

	The result of decoding this signature is `DecodedSignedPurchaseRequest`.
**/
typedef SignedPurchaseRequest = OAuth20Signature<DecodedSignedPurchaseRequest>;

typedef DecodedSignedPurchaseRequest = {
	var developer_payload:String;
	var is_consumed:Bool;
	var issued_at:Int;
	var payment_id:String;
	var product_id:String;
	var purchase_time:String;
	var purchase_token:String;
}
