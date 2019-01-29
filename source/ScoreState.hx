package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxSubState;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.group.FlxSpriteGroup;
import flixel.text.FlxText;
import flixel.util.FlxColor;
import io.newgrounds.NG;
import io.newgrounds.objects.Score;
#if steam
import steamwrap.api.Steam;
#end
/**
 * ...
 * @author ninjaMuffin
 */
class ScoreState extends FlxSubState 
{
	private var hallOfShame:FlxText;
	private var bountyTxt:FlxText;
	private var _grpText:FlxSpriteGroup;
	
	private var scoreboardInitialized:Bool = false;
	
	public function new(BGColor:FlxColor=FlxColor.TRANSPARENT) 
	{
		persistentUpdate = true;
		
		super(BGColor);
	}
	
	override public function create():Void 
	{
		#if html5
			//the normal transparent BG don't work right on HTML5 so makin my own
			var goodBg:FlxSprite = new FlxSprite().makeGraphic(FlxG.width, FlxG.height, 0xCC000000);
			add(goodBg);
		#end
		
		_grpText = new FlxSpriteGroup();
		add(_grpText);
		
		hallOfShame = new FlxText(0, 8, 0, "HALL OF SHAME", 32);
		hallOfShame.screenCenter(X);
		_grpText.add(hallOfShame);
		
		FlxG.log.redirectTraces = true;
		
		checkScores();
		
		
		super.create();
	}
	
	private function checkScores():Void
	{
		if (NGio.isLoggedIn && NGio.scoreboardsLoaded)
		{
			
			NG.core.scoreBoards.get(8004).requestScores(20);
			
			if (NGio.scoreboardArray.length > 2)
				namesPlacement(NGio.scoreboardArray)
			else
			{
				namesPlacement(NG.core.scoreBoards.get(8004).scores);
				NGio.scoreboardArray = NG.core.scoreBoards.get(8004).scores;
			}
			
			
			bountyTxt = new FlxText(0, FlxG.height - 112, 0, "\nBOUNTIES\nn/a", 16);
			bountyTxt.screenCenter(X);
			bountyTxt.alignment = FlxTextAlign.CENTER;
			// add(bountyTxt);
			bountyTxt.color = FlxColor.YELLOW;
			
			scoreboardInitialized = true;
		}
		else
		{
			#if steam
				
			#else
				hallOfShame.text += "\n\nYou are not \nlogged into the NG API\n Head to settings!\n\n";
				hallOfShame.screenCenter(X);
				hallOfShame.alignment = FlxTextAlign.CENTER;
			#end
			
			
		}
	}
	
	private function namesPlacement(scoreArray:Array<Score>):Void
	{
		var leaderBoardPlacement:Int = 1;
		
		for (score in scoreArray)
		{
			var dev:Bool = false;
			var isPlayer:Bool = false;
			var userName:String = score.user.name;
			
			if (NG.core.user.name == userName)
			{
				isPlayer = true;
				
				var shameMedal = NG.core.medals.get(54477);
				if (!shameMedal.unlocked)
					shameMedal.sendUnlock();
				
			}
			
			if (userName == "ninjamuffin99" || userName == "BrandyBuizel" || userName == "DIGIMIN")
			{
				dev = true;
				userName += " (dev)";
			}
			
			var text:String = Std.string(leaderBoardPlacement + ". " + userName + " - " + score.formatted_value);
			
			var name:FlxText = new FlxText(20, 32 + (34 * _grpText.members.length), FlxG.width - 20, text, 24);
			_grpText.add(name);
			
			if (dev)
			{
				name.color = FlxColor.YELLOW;
			}
			
			if (isPlayer)
			{
				name.color = FlxColor.RED;
			}
			
			
			leaderBoardPlacement += 1;
		}
		
	}
	
	override public function update(elapsed:Float):Void 
	{
		
		
		if (!scoreboardInitialized && NGio.scoreboardsLoaded)
		{
			checkScores();
		}
		
		if (!NGio.scoreboardsLoaded && NGio.isLoggedIn)
		{
			hallOfShame.text = "HALL OF SHAME\n\nScoreboards loading...\n\n";
		}
		
		if (NGio.scoreboardsLoaded && NGio.isLoggedIn)
		{
			if (FlxG.keys.justPressed.R)
			{
				_grpText.forEach(function(s:FlxSprite){_grpText.remove(s, true); });
				namesPlacement(NG.core.scoreBoards.get(8004).scores);
			}
		}
		
		if (FlxG.keys.justPressed.ANY)
		{
			close();
		}
		
		if (FlxG.onMobile)
		{
			for (touch in FlxG.touches.list)
			{
				if (touch.justPressed)
				{
					close();
				}
			}
		}
		
		super.update(elapsed);
	}
}