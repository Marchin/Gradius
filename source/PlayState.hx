package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.addons.editors.ogmo.FlxOgmoLoader;
import flixel.tile.FlxTilemap;
import flixel.FlxObject;
import sprites.Nave;
import sprites.Disparo;

class PlayState extends FlxState
{
	private var player:Nave;
	private var tilemap:FlxTilemap;
	
	override public function create():Void
	{
		super.create();
		
		
		var loader:FlxOgmoLoader = new FlxOgmoLoader(AssetPaths.test__oel);
		tilemap = loader.loadTilemap(AssetPaths.tiles__png, 16, 16, "tiles");
		FlxG.worldBounds.set(0, 0, tilemap.width, tilemap.height);
		
		tilemap.setTileProperties(0, FlxObject.NONE);
		tilemap.setTileProperties(1, FlxObject.NONE);
		tilemap.setTileProperties(2, FlxObject.ANY);
		
		loader.loadEntities(placeEntities, "objects");
		
		
		FlxG.camera.setScrollBounds(0, tilemap.width, 0, tilemap.height);
		FlxG.camera.follow(player);
		
		add(tilemap);
		add(player);
	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
		
		FlxG.collide(tilemap, player);
		
		
		player.checkPlayerPos(tilemap.width, tilemap.height);
	}
	
	private function placeEntities(entityName:String, entityData:Xml):Void
	{
		if (entityName == "Player")
		{
			player = new Nave(Std.parseInt(entityData.get("x")),Std.parseInt(entityData.get("y")));
			player.velocity.x = 64;
		}
	}
	
}
