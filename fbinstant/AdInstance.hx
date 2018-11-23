package fbinstant;

/**
	Represents an instance of an ad.
**/
extern class AdInstance {
	/**
		Return the Audience Network placement ID of this ad instance.
	**/
	function getPlacementID():String;

	/**
		Preload the ad. The returned promise resolves when the preload completes, and rejects if it failed.
	**/
	function loadAsync():Promise<Void>;

	/**
		Present the ad. The returned promise resolves when user finished watching the ad, and rejects if it failed to present or was closed during the ad.
	**/
	function showAsync():Promise<Void>;
}
