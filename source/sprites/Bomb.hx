package sprites;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.system.FlxAssets.FlxGraphicAsset;
import flixel.system.FlxSound;

/**
 * ...
 * @author ...
 */
class Bomb extends FlxSprite 
{
	var explosionLenght:Int = -1;
	private var sndExpl:FlxSound;

	public function new(?X:Float=0, ?Y:Float=0, ?SimpleGraphic:FlxGraphicAsset) 
	{
		super(X, Y, SimpleGraphic);
		
		loadGraphic(AssetPaths.egg__png);
		velocity.x = 128;
		velocity.y = 128;
		
		sndExpl = FlxG.sound.load(AssetPaths.explosion3__wav);
		
	}
	
	
	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
		
		if (explosionLenght > 0)
		{
			explosionLenght--;
		}
		if (explosionLenght == 0)
		{
			explosionLenght--;
			destroy();
		}
	
	
	}
	
	public function explode():Void
	{
		
		loadGraphic(AssetPaths.explosion__png, true, 16, 16);
		
		sndExpl.play();
		
		animation.add("explosion", [0, 1 , 2 , 1], 3, true);
		animation.play("explosion");
		
		velocity.x = 0;
		velocity.y = 0;
		
		explosionLenght = 6;
	}
	
	
}