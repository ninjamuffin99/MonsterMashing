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
		/*
		initNG();
		*/
		
		FlxTween.tween(mTxt, {y: mTxt.y + 40}, 0.9, {type:FlxTween.PINGPONG, ease:FlxEase.quadInOut});
		FlxTween.tween(mScore, {y: mScore.y + 40}, 0.905, {type:FlxTween.PINGPONG, ease:FlxEase.quadInOut});
		
		/*
		FlxG.log.add("Before medals");
		
		var medal = NG.core.medals.get(54303);
		trace("${medal.name} is worth ${medal.value}");
		FlxG.log.add("init medals");
		
		if (!medal.unlocked)
		{
			//medal.onUnlock.add(function():Void{ trace('${medal.name} unlocked:${medal.unlocked}'); });
			FlxG.log.add("on unlock");
			medal.sendUnlock();
			FlxG.log.add("after unlock");
		}
		
		FlxG.log.add("After medals");
		*/
		
		//add(hScore);
		
		super.create();
	}

    public function initNG():Void
    {
        NG.createAndCheckSession(FlxG.stage, APIStuff.APIID);
        // Set the encryption cipher/format to RC4/Base64. AES128 and Hex are not implemented yet
        NG.core.initEncryption(APIStuff.EncKey);// Found in you NG project view
        
        if (NG.core.attemptingLogin)
        {
            /* a session_id was found in the loadervars, this means the user is playing on newgrounds.com
             * and we should login shortly. lets wait for that to happen
             */
            NG.core.onLogin.add(onNGLogin);
        }
        else
        {
            /* They are NOT playing on newgrounds.com, no session id was found. We must start one manually, if we want to.
             * Note: This will cause a new browser window to pop up where they can log in to newgrounds
             */
            NG.core.requestLogin(onNGLogin);
        }
    }
	
    function onNGLogin():Void
    {
        trace ('logged in! user:${NG.core.user.name}');
		
        // Load medals then call onNGMedalFetch()
        NG.core.requestMedals(onNGMedalFetch);
		
        // Load Scoreboards hten call onNGBoardsFetch()
        NG.core.requestScoreBoards(onNGBoardsFetch);
    }

	
    // --- MEDALS
    function onNGMedalFetch():Void
    {
        // Reading medal info
        for (id in NG.core.medals.keys())
        {
            var medal:Medal = NG.core.medals.get(id);
            trace('loaded medal id:$id, name:${medal.name}, description:${medal.description}');
        }
		
        // Unlocking medals
        var unlockingMedal = NG.core.medals.get(54303);// medal ids are listed in your NG project viewer 
        if (!unlockingMedal.unlocked)
            unlockingMedal.sendUnlock();
    }

    // --- SCOREBOARDS
    function onNGBoardsFetch():Void
    {
        // Reading medal info
        for (id in NG.core.scoreBoards.keys())
        {
            var board:ScoreBoard = NG.core.scoreBoards.get(id);
            trace('loaded scoreboard id:$id, name:${board.name}');
        }
        
        var board:ScoreBoard = NG.core.scoreBoards.get(7971);// ID found in NG project view
        
        // Posting a score thats OVER 9000!
        board.postScore(9001);
        // --- To view the scores you first need to select the range of scores you want to see --- 
        
        // add an update listener so we know when we get the new scores
        board.onUpdate.add(onNGScoresFetch);
        board.requestScores(10);// get the best 10 scores ever logged
        // more info on scores --- http://www.newgrounds.io/help/components/#scoreboard-getscores
    }
    
    function onNGScoresFetch():Void
    {
        for (score in NG.core.scoreBoards.get(7971).scores)
        {
            trace('score loaded user:${score.user.name}, score:${score.formatted_value}');
        }
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