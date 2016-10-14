package sprites;

import flixel.system.FlxAssets.FlxGraphicAsset;
import flixel.FlxG;

/**
 * ...
 * @author ...
 */
class Options extends Nave 
{

	public function new(?X:Float=0, ?Y:Float=0, ?SimpleGraphic:FlxGraphicAsset) 
	{
		super(X, Y, SimpleGraphic);
		
		loadGraphic(AssetPaths.babybird__png);
		velocity.x = 64;
		bomb = new Bomb();
		disp = new Disparo();
		disp2 = new Disparo();
		disp.kill();
		disp2.kill();
		bomb.kill();
	}
	
	
	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
	
		
	}
}