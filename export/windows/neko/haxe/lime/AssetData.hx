package lime;


import lime.utils.Assets;


class AssetData {

	private static var initialized:Bool = false;
	
	public static var library = new #if haxe3 Map <String, #else Hash <#end LibraryType> ();
	public static var path = new #if haxe3 Map <String, #else Hash <#end String> ();
	public static var type = new #if haxe3 Map <String, #else Hash <#end AssetType> ();	
	
	public static function initialize():Void {
		
		if (!initialized) {
			
			path.set ("assets/images/Duck-20161003-210123.piskel", "assets/images/Duck-20161003-210123.piskel");
			type.set ("assets/images/Duck-20161003-210123.piskel", Reflect.field (AssetType, "text".toUpperCase ()));
			path.set ("assets/Osmo/OSMO1.oep", "assets/Osmo/OSMO1.oep");
			type.set ("assets/Osmo/OSMO1.oep", Reflect.field (AssetType, "text".toUpperCase ()));
			path.set ("assets/Osmo/test.oel", "assets/Osmo/test.oel");
			type.set ("assets/Osmo/test.oel", Reflect.field (AssetType, "text".toUpperCase ()));
			path.set ("assets/Osmo/tiles.png", "assets/Osmo/tiles.png");
			type.set ("assets/Osmo/tiles.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("flixel/sounds/beep.ogg", "flixel/sounds/beep.ogg");
			type.set ("flixel/sounds/beep.ogg", Reflect.field (AssetType, "sound".toUpperCase ()));
			path.set ("flixel/sounds/flixel.ogg", "flixel/sounds/flixel.ogg");
			type.set ("flixel/sounds/flixel.ogg", Reflect.field (AssetType, "sound".toUpperCase ()));
			path.set ("flixel/fonts/nokiafc22.ttf", "flixel/fonts/nokiafc22.ttf");
			type.set ("flixel/fonts/nokiafc22.ttf", Reflect.field (AssetType, "font".toUpperCase ()));
			path.set ("flixel/fonts/monsterrat.ttf", "flixel/fonts/monsterrat.ttf");
			type.set ("flixel/fonts/monsterrat.ttf", Reflect.field (AssetType, "font".toUpperCase ()));
			path.set ("flixel/images/ui/button.png", "flixel/images/ui/button.png");
			type.set ("flixel/images/ui/button.png", Reflect.field (AssetType, "image".toUpperCase ()));
			
			
			initialized = true;
			
		} //!initialized
		
	} //initialize
	
	
} //AssetData
