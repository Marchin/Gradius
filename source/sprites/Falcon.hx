package sprites;

import flixel.system.FlxAssets.FlxGraphicAsset;

/**
 * ...
 * @author ...
 */
class Falcon extends Enemigo 
{
	private var counter:Int =-2;

	public function new(?X:Float=0, ?Y:Float=0, ?SimpleGraphic:FlxGraphicAsset) 
	{
		super(X, Y, SimpleGraphic);
		
		
		loadGraphic(AssetPaths.falcon__png, true, 32, 16);
		animation.add("fly", [0, 1], 3, true);
		animation.add("attack", [2], 1);
		animation.play("fly");
	}
	
	
	override public function update(elapsed:Float):Void 
	{
		super.update(elapsed);
		
		if (isOnScreen() && counter < -1)
		{
			counter = 60;
		}
		
		if (counter > 0)
		{
			counter--;
		}
		if (counter == 0 )
		{
			counter =-1;
			velocity.x =-200;
			animation.play("attack");
		}
		
		if (!isOnScreen() && counter == -1)
		{
			destroy();
		}
	}
	
	
	public function crashed():Void
	{
		explode();
		counter =-1;
	}
}