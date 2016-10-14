package sprites;

import flixel.system.FlxAssets.FlxGraphicAsset;

/**
 * ...
 * @author ...
 */
class Piranha extends Enemigo 
{
	private var velEn:Bool = false;

	public function new(?X:Float=0, ?Y:Float=0, ?SimpleGraphic:FlxGraphicAsset) 
	{
		super(X, Y, SimpleGraphic);
		
		
		loadGraphic(AssetPaths.piranha__png, true, 16,16);
		animation.add("fish", [0, 1], 3, true);
		animation.play("fish");
		
	}
	
	
	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
		
		if (isOnScreen() && velEn == false)
		{
			velocity.y = -180;
			acceleration.y = 120;
			velEn = true;
		}
	}
}