package sprites;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.system.FlxAssets.FlxGraphicAsset;
import sprites.Disparo;
import sprites.Bomb;

/**
 * ...
 * @author ...
 */
class Nave extends FlxSprite
{
	public var disp:Disparo;
	var bomb:Bomb;
	var count:UInt = 0;
	var dispEnable:Bool = true;
	var vidas:UInt = 3;
	
	public function new(?X:Float=0, ?Y:Float=0, ?SimpleGraphic:FlxGraphicAsset) 
	{
		super(X, Y, SimpleGraphic);
		disp = new Disparo();
		disp.kill();
		loadGraphic(AssetPaths.duck__png, true, 32, 32);
		
		animation.add("fly", [0, 1], 3, true);
		animation.play("fly");
	}
	
	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
		
		if (count == 0)
		{
			dispEnable = true;
		}
		
		if (FlxG.keys.pressed.LEFT && !(x<FlxG.camera.scroll.x))
			x -= 2;
		if (FlxG.keys.pressed.RIGHT && !( x> FlxG.camera.scroll.x + FlxG.width - width))
			x += 2;
		
		if (FlxG.keys.pressed.UP && !(y<0))
			y -= 2;
		if (FlxG.keys.pressed.DOWN && !( y> FlxG.camera.scroll.y + FlxG.height - height))
			y += 2;
			
		if (FlxG.keys.justPressed.SPACE && dispEnable==true)
		{
			disp = new Disparo(x + width , y +  height / 2);
			dispEnable = false;
			count = 0;
			FlxG.state.add(disp);
		}
			
		if (FlxG.keys.justPressed.X)
		{
			bomb = new Bomb(x + width/2 , y +  height);
			FlxG.state.add(bomb);
		}	

		count++;
		count %= 30;
		
		
		velocity.x = 64;
	}

	public function getShot():Disparo	
	{
		return disp;
		
		
	}
	
	public function removeLive()
	{
		vidas--;
	}
}