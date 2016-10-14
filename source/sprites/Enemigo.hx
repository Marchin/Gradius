package sprites;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.system.FlxAssets.FlxGraphicAsset;
import flixel.system.FlxSound;
import sprites.Upgrade;

/**
 * ...
 * @author ...
 */
class Enemigo extends FlxSprite 
{
	private var explosionLenght:Int = -1;
	private var sndExpl:FlxSound;
	private var probUpg:Int;
	private var newUpg:Upgrade;
	private var exploded:Bool = false;

	public function new(?X:Float=0, ?Y:Float=0, ?SimpleGraphic:FlxGraphicAsset) 
	{
		super(X, Y, SimpleGraphic);
		
		sndExpl = FlxG.sound.load(AssetPaths.explosion3__wav);
		
		probUpg =  Std.random(2);
		
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
			kill();
		}
	}
	
	public function explode():Void
	{
		loadGraphic(AssetPaths.explosion__png, true, 16, 16);
		
		exploded = true;
		
		sndExpl.play();
		
		animation.add("explosion", [0, 1 , 2 , 1], 3, true);
		animation.play("explosion");
		
		velocity.x = 0;
		velocity.y = 0;
		
		explosionLenght = 6;
		
	}
	
	public function getProb():Int
	{
		return probUpg;
	}
	
}