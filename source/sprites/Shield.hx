package sprites;

import flixel.FlxSprite;
import flixel.system.FlxAssets.FlxGraphicAsset;

/**
 * ...
 * @author ...
 */
class Shield extends FlxSprite 
{
	private var aux:Float = 0.1;
	
	public function new(?X:Float=0, ?Y:Float=0, ?SimpleGraphic:FlxGraphicAsset) 
	{
		super(X, Y, SimpleGraphic);
		loadGraphic(AssetPaths.shield__png);
		alpha = 0.5;
	}
	
	
	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
	
		if (alpha == 1 || alpha == 0)
		{
			aux =-aux;
		}
		
		alpha += aux;
	}
	
	
	
}