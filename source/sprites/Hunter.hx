package sprites;

import flixel.FlxG;
import flixel.system.FlxAssets.FlxGraphicAsset;

/**
 * ...
 * @author ...
 */
class Hunter extends Enemigo 
{
	private var disp:Disparo;

	public function new(?X:Float=0, ?Y:Float=0, ?SimpleGraphic:FlxGraphicAsset) 
	{
		super(X, Y, SimpleGraphic);
		
		loadGraphic(AssetPaths.hunter__png, true, 32, 32);
		animation.add("left_out", [0, 1, 2], 3, true);
		animation.add("right_out", [0, 1, 3], 3, true);
		
		disp = new Disparo() ;
		disp.kill();
	}
	
	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
		
		if (isOnScreen() && exploded==false)
		{
			if ((x >= FlxG.camera.scroll.x + FlxG.width / 2)&& !disp.exists)
			{
				animation.play("left_out");
				disp = new Disparo(x, y-20, null, -60, -160);
				FlxG.state.add(disp);
			}
			if ((x < FlxG.camera.scroll.x + FlxG.width / 2) && !disp.exists)
			{
				animation.play("right_out");
				disp = new Disparo(x+32, y-20, null, 160, -160);
				FlxG.state.add(disp);
			}
		}
	}
	
	public function getShot():Disparo
	{
		return disp;
	}
}