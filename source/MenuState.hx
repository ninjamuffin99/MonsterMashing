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
	private var mScore:FlxText;
	private var hScore = 0;
	
	override public function create():Void
	{
		mTxt = new FlxText(0, 0, 0, "Press Z Play", 32);
		mTxt.screenCenter();
		add(mTxt);
		mScore = new FlxText(0, FlxG.height / 2 + 48, 0, "Score: " + hScore, 32);
		mScore.screenCenter(X);
		add(mScore);
		

		//add(hScore);
		
		super.create();
	}

	override public function update(elapsed:Float):Void
	{
		if (FlxG.keys.justPressed.Z)
		{
			FlxG.switchState(new PlayState());
		}
		
		super.update(elapsed);
	}
}