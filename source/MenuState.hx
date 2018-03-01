package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;
import flixel.ui.FlxButton;
import flixel.math.FlxMath;
import flixel.util.FlxColor;
import com.newgrounds.*;
import com.newgrounds.components.*;

class MenuState extends FlxState
{
	private var mTxt:FlxText;
	private var mScore:FlxText;
	
	override public function create():Void
	{
		FlxG.save.bind("File");
		HighScore.load();
		
		mTxt = new FlxText(0, 0, 0, "MONSTER MASHING\nWIP TITLE SCREEN LMAOO\nPress Z Play", 32);
		mTxt.screenCenter();
		add(mTxt);
		mScore = new FlxText(0, FlxG.height / 2 + 70, 0, "High Score: " + HighScore.score, 32);
		mScore.screenCenter(X);
		add(mScore);
		
		FlxTween.tween(mTxt, {y: mTxt.y + 40}, 0.9, {type:FlxTween.PINGPONG, ease:FlxEase.quadInOut});
		FlxTween.tween(mScore, {y: mScore.y + 40}, 0.9, {type:FlxTween.PINGPONG, ease:FlxEase.quadInOut});
		
		#if flash
			if (API.isNewgrounds)
			{
				/*
				var scoreBrowser:ScoreBrowser = new ScoreBrowser();
				scoreBrowser.scoreBoardName = "Distance";
				scoreBrowser.x += 50;
				scoreBrowser.period = ScoreBoard.ALL_TIME;
				scoreBrowser.loadScores();
				FlxG.stage.addChild(scoreBrowser);
				*/
				
				API.unlockMedal("MedalTest");
			}
		#end
		
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