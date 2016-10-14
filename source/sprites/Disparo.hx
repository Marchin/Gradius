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

	public function new(?X:Float = 0, ?Y:Float = 0, ?SimpleGraphic:FlxGraphicAsset, ?vx:Float=0, ?vy:Float=0 ) 
	{
		super(X, Y, SimpleGraphic);
		
		makeGraphic(4,3, 0xFFFFB70B);
		
		velocity.x = vx;
		velocity.y = vy;
	}
	
	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
		
		
		if (!isOnScreen())
		{
			destroy();
		}
		
	}
	
}