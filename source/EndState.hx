package;

import flixel.FlxState;
import flixel.text.FlxText;
import flixel.FlxG;

/**
 * ...
 * @author ...
 */
class EndState extends FlxState 
{
	private var end:FlxText;

	override public function create():Void
	{
		super.create();
		end = new FlxText();
		end.text = "GAME OVER";
		end.setPosition(FlxG.width / 2 - end.width / 2, FlxG.height / 2 - end.height / 2);
		add(end);
	}
	
}