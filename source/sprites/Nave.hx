package sprites;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.group.FlxSpriteGroup.FlxTypedSpriteGroup;
import flixel.system.FlxAssets.FlxGraphicAsset;
import flixel.system.FlxSound;
import sprites.Disparo;
import sprites.Bomb;

/**
 * ...
 * @author ...
 */
class Nave extends FlxSprite
{
	var disp:Disparo;
	var disp2:Disparo;
	var totalDisp:FlxTypedSpriteGroup<Disparo>;
	var bomb:Bomb;
	var count:UInt = 0;
	var dispEnable:Bool = true;
	var lives:UInt = 5;
	var doubleEnable:UInt = 0;
	var hitLenght:Int = -1;
	var hitDuck:FlxSound;
	var shotSound:FlxSound;
	
	public function new(?X:Float=0, ?Y:Float=0, ?SimpleGraphic:FlxGraphicAsset) 
	{
		super(X, Y, SimpleGraphic);
		bomb = new Bomb();
		disp = new Disparo();
		disp2 = new Disparo();
		disp.kill();
		disp2.kill();
		bomb.kill();

		velocity.x = 64;
		
		hitDuck = FlxG.sound.load(AssetPaths.hitDuck__wav);
		shotSound = FlxG.sound.load(AssetPaths.laser_Shoot__wav);
		
		loadGraphic(AssetPaths.duck__png, true, 32, 16);
		animation.add("fly", [0, 1], 3, true);
		animation.add("hitted", [2], 1);
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
			

		count++;
		count %= 60;
		
		
		if (hitLenght > 0)
		{
			hitLenght--;
		}
		if (hitLenght == 0)
		{
			animation.play("fly");
			x = camera.scroll.x + 16;
			y = 120;
			velocity.x = 64;
			hitLenght=-1;
		}
		
	}
	
	public function shoot(upg:UInt):Void
	{
		if (upg >= 3)
		{
			doubleEnable = 1;
		}
		else
		{
			doubleEnable = 0;
		}
		if (upg >= 2)
		{
			shootBomb();
		}
		if ( upg >= 1)
		{
			velocity.x = 96;
		}
	
		if (doubleEnable  == 1)
		{
			disp = new Disparo(x + width , y +  height,null,300,0);
			disp2 = new Disparo(x + width , y ,null,300,0 );
			FlxG.state.add(disp);
			FlxG.state.add(disp2);
		}
		else
		{
			disp = new Disparo(x + width , y +  height / 2,null,300,0);
			FlxG.state.add(disp);
		}
		shotSound.play();
		dispEnable = false;
		count = 0;
		
		if (bomb.exists && !bomb.isOnScreen())
		{
			bomb.destroy();
		}
	}
	
	public function shootBomb():Void
	{
		if (!bomb.exists)
		{
			bomb = new Bomb(x + width/2 , y +  height/2);
			FlxG.state.add(bomb);	
		}
	}

	public function getShot():Disparo	
	{
		return disp;
	}
	
	
	public function getShot2():Disparo	
	{
		return disp2;
	}
	
	public function getBomb():Bomb	
	{
		return bomb;
	}

	
	public function removeLive():Void
	{
		animation.play("hitted");
		hitDuck.play();
		velocity.x = 0;
		hitLenght = 48;
		lives--;
	}
	
	public function getLives():UInt
	{
		return lives;
	}
}