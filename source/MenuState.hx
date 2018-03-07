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
import flixel.util.FlxTimer;
import io.newgrounds.NG;
import io.newgrounds.objects.Medal;
import io.newgrounds.objects.ScoreBoard;

class MenuState extends FlxState
{
	private var mTxt:FlxText;
	private var mScore:FlxText;
	
	private var credsTxt:FlxText;
	
	private var bg:FlxSprite;
	
	private var debugInfo:FlxText;
	private var currentVersion:String = "v1.1.0";
	
	
	
	override public function create():Void
	{
		FlxG.save.bind("File");
		HighScore.load();
		
		FlxG.camera.fade(FlxColor.BLACK, 0.8, true);
		
		bg = new FlxSprite().loadGraphic(AssetPaths.starting__PNG, false, 545, 201);
		bg.setGraphicSize(Std.int(bg.width * 2));
		bg.updateHitbox();
		bg.screenCenter(X);
		add(bg);
		
		mTxt = new FlxText(0, 0, 0, "MONSTER MASHING\nPress Z Play", 32);
		mTxt.screenCenter();
		mTxt.y += 40;
		add(mTxt);
		
		mScore = new FlxText(0, FlxG.height / 2 + 110, 0, "High Score: " + HighScore.score, 32);
		mScore.screenCenter(X);
		add(mScore);
		
		if (HighScore.recentScore > 0)
		{
			mScore.text += "\nRecent Score: " + HighScore.recentScore;
		}
		
		credsTxt = new FlxText(8, FlxG.height - 62, 0, "Programming: BrandyBuizel & ninja_muffin99\nArt:Digimin & BrandyBuizel\nPress C for more creds", 16);
		add(credsTxt);
		
		debugInfo = new FlxText(8, credsTxt.y - 18, 0, currentVersion, 16);
		add(debugInfo);
		
		#if flash
			debugInfo.text += " Flash Version";
		#elseif html5
			debugInfo.text += " HTML5 Version ";
			debugInfo.text += "(" + Std.string(FlxG.html5.platform) + " " +  Std.string(FlxG.html5.browser) + ")";
			
			if (FlxG.html5.onMobile)
			{
				debugInfo.text += "mobile";
			}
			
		#end
		
		FlxTween.tween(mTxt, {y: mTxt.y + 40}, 0.9, {type:FlxTween.PINGPONG, ease:FlxEase.quadInOut});
		FlxTween.tween(mScore, {y: mScore.y + 40}, 0.905, {type:FlxTween.PINGPONG, ease:FlxEase.quadInOut});
		
		//add(hScore);
		
		super.create();
		
		new FlxTimer().start(1, finTim);
		
	}
	
	private function finTim(t:FlxTimer):Void
	{
		var Ng:NGio = new NGio();
		Ng.initNG(FlxG.stage);
	}
	
	override public function update(elapsed:Float):Void
	{
		
		
		if (FlxG.keys.justPressed.Z)
		{
			FlxG.camera.flash();
			FlxG.sound.play(AssetPaths.flash__wav);
			FlxG.switchState(new PlayState());
		}
		
		if (FlxG.keys.justPressed.C)
		{
			FlxG.switchState(new CredState());
		}
		
		#if html5
			
			if (FlxG.html5.onMobile)
			{
				mTxt.text = "MONSTER MASHING\nTouch to play";
				credsTxt.text = "Programming: ninja_muffin99 & BrandyBuizel\nArt:Digimin & BrandyBuizel\nTap here for more creds";
				
				for (touch in FlxG.touches.list)
				{
					if (touch.justPressed) 
					{
						if (touch.y < credsTxt.y)
						{
							FlxG.switchState(new PlayState());
						}
						else
						{
							FlxG.switchState(new CredState());
						}
					}
					
				}
			}
			
		#end
		
		super.update(elapsed);
	}
}