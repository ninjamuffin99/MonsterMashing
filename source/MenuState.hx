package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.math.FlxMath;
import flixel.util.FlxColor;

class MenuState extends FlxState
{
	private var mTxt:FlxText;
	
	override public function create():Void
	{
		mTxt = new FlxText("Press Z Play");
		mTxt.color = FlxColor.BLACK;
		FlxG.camera.bgColor =  0xFFa5a5a5;
		
		super.create();
	}

	override public function update(elapsed:Float):Void
	{
		if (FlxG.keys.justPressed.Z){
			FlxG.switchState(new PlayState());
		}
		
		super.update(elapsed);
	}
}