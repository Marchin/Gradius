package lime;


import lime.utils.Assets;


class AssetData {

	private static var initialized:Bool = false;
	
	public static var library = new #if haxe3 Map <String, #else Hash <#end LibraryType> ();
	public static var path = new #if haxe3 Map <String, #else Hash <#end String> ();
	public static var type = new #if haxe3 Map <String, #else Hash <#end AssetType> ();	
	
	public static function initialize():Void {
		
		if (!initialized) {
			
			path.set ("assets/images/babybird.png", "assets/images/babybird.png");
			type.set ("assets/images/babybird.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/duck.png", "assets/images/duck.png");
			type.set ("assets/images/duck.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/egg.png", "assets/images/egg.png");
			type.set ("assets/images/egg.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/explosion.png", "assets/images/explosion.png");
			type.set ("assets/images/explosion.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/falcon.png", "assets/images/falcon.png");
			type.set ("assets/images/falcon.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/hunter.png", "assets/images/hunter.png");
			type.set ("assets/images/hunter.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/piranha.png", "assets/images/piranha.png");
			type.set ("assets/images/piranha.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/shield.png", "assets/images/shield.png");
			type.set ("assets/images/shield.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/upgrade.png", "assets/images/upgrade.png");
			type.set ("assets/images/upgrade.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/upgrades.png", "assets/images/upgrades.png");
			type.set ("assets/images/upgrades.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/level/level.oel", "assets/level/level.oel");
			type.set ("assets/level/level.oel", Reflect.field (AssetType, "text".toUpperCase ()));
			path.set ("assets/level/level.oep", "assets/level/level.oep");
			type.set ("assets/level/level.oep", Reflect.field (AssetType, "text".toUpperCase ()));
			path.set ("assets/level/Tiles.png", "assets/level/Tiles.png");
			type.set ("assets/level/Tiles.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/level/tiles_.png", "assets/level/tiles_.png");
			type.set ("assets/level/tiles_.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/music/gradius.wav", "assets/music/gradius.wav");
			type.set ("assets/music/gradius.wav", Reflect.field (AssetType, "sound".toUpperCase ()));
			path.set ("assets/ogmo/OSMO1.oep", "assets/ogmo/OSMO1.oep");
			type.set ("assets/ogmo/OSMO1.oep", Reflect.field (AssetType, "text".toUpperCase ()));
			path.set ("assets/ogmo/test.oel", "assets/ogmo/test.oel");
			type.set ("assets/ogmo/test.oel", Reflect.field (AssetType, "text".toUpperCase ()));
			path.set ("assets/ogmo/tiles.png", "assets/ogmo/tiles.png");
			type.set ("assets/ogmo/tiles.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/sounds/explosion3.wav", "assets/sounds/explosion3.wav");
			type.set ("assets/sounds/explosion3.wav", Reflect.field (AssetType, "sound".toUpperCase ()));
			path.set ("assets/sounds/hitDuck.wav", "assets/sounds/hitDuck.wav");
			type.set ("assets/sounds/hitDuck.wav", Reflect.field (AssetType, "sound".toUpperCase ()));
			path.set ("assets/sounds/laser_Shoot.wav", "assets/sounds/laser_Shoot.wav");
			type.set ("assets/sounds/laser_Shoot.wav", Reflect.field (AssetType, "sound".toUpperCase ()));
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
