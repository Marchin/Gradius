package sprites;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.system.FlxAssets.FlxGraphicAsset;

/**
 * ...
 * @author ...
 */
class Disparo extends FlxSprite
{

	public function new(?X:Float=0, ?Y:Float=0, ?SimpleGraphic:FlxGraphicAsset) 
	{
		super(X, Y, SimpleGraphic);
		
		makeGraphic(6, 2, 0xFFB3CDE0);
		
		velocity.x = 100;
	}
	
	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
		
		
		if (x > FlxG.camera.scroll.x + FlxG.width)
		{
			destroy();
		}
		
	}
	
}