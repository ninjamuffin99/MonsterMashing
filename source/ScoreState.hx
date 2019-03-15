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
using flixel.util.FlxStringUtil;

#if steam
import steamwrap.api.Steam;
import steamwrap.api.Steam.LeaderboardScore;
#end
/**
 * ...
 * @author ninjaMuffin
 */
class ScoreState extends FlxSubState 
{
	private var hallOfShame:FlxText;
	private var txtCurrentScoreboard:FlxText;
	private var bountyTxt:FlxText;
	private var _grpText:FlxSpriteGroup;
	private var _grpScoresNewgrounds:FlxSpriteGroup;
	private var _grpScoresSteam:FlxSpriteGroup;
	
	private var scoreboardInitialized:Bool = false;
	private var scoreboardTypes:Array<String> = ["Newgrounds", "Steam"];
	private var currentScoreboard:Int = 0;
	
	#if steam
	public static var steamScores:Array<LeaderboardScore> = [];
	#end
	
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
		/*
		#if !steam
			scoreboardTypes.pop();
		#end
		*/
		_grpText = new FlxSpriteGroup();
		add(_grpText);
		
		_grpScoresSteam = new FlxSpriteGroup();
		add(_grpScoresSteam);
		
		_grpScoresNewgrounds = new FlxSpriteGroup();
		add(_grpScoresNewgrounds);
		
		hallOfShame = new FlxText(0, 8, 0, "HALL OF SHAME", 32);
		hallOfShame.alignment = CENTER;
		hallOfShame.screenCenter(X);
		_grpText.add(hallOfShame);
		
		txtCurrentScoreboard = new FlxText(0, 40, 0, "< " + scoreboardTypes[currentScoreboard] + " >", 32);
		txtCurrentScoreboard.alignment = CENTER;
		txtCurrentScoreboard.screenCenter(X);
		add(txtCurrentScoreboard);
		
		
		FlxG.log.redirectTraces = true;
		
		checkScores();
		
		trace(steamScores);
		
		super.create();
	}
	
	private function checkScores():Void
	{
		if (currentScoreboard == 0)
		{
			if (NGio.isLoggedIn && NGio.scoreboardsLoaded)
			{
				checkNGScores();
			}
			else
			{
				hallOfShame.text += "\n\nYou are not \nlogged into the NG API\n Head to settings!\n\n";
				hallOfShame.screenCenter(X);
				hallOfShame.alignment = FlxTextAlign.CENTER;
			}
		}
		
		#if steam
			namesSteam(steamScores);
		#end
		
		
	}
	
	private function checkNGScores():Void
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
				#if steam
					if (Steam.active && Steam.getAchievement("Shame_and_Fame"))
					{
						Steam.setAchievement("Shame_and_Fame");
					}
				#end 
				
				var shameMedal = NG.core.medals.get(54477);
				if (!shameMedal.unlocked)
					shameMedal.sendUnlock();
				
			}
			
			#if !steam
			if (userName == "ninjamuffin99" || userName == "BrandyBuizel" || userName == "DIGIMIN")
			{
				dev = true;
				userName += " (dev)";
			}
			#end
			
			#if steam
			if (userID == "ninjamuffin99" || userID == "STEAM_1:0:33731368" || userID == "DIGIMIN")
			{
				dev = true;
				userName += " (dev)";
			}
			#end
			
			var dispScore:String = "";
			
			switch (currentScoreboard)
			{
				case 0:
					dispScore = score.formatted_value;
				case 1:
					
				default:
					
			}
			
			var text:String = Std.string(leaderBoardPlacement + ". " + userName + " - " + dispScore);
			
			var name:FlxText = new FlxText(20, 60 + (34 * leaderBoardPlacement), FlxG.width - 20, text, 24);
			_grpScoresNewgrounds.add(name);
			
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
	
	private function namesSteam(scoreArray:Array<LeaderboardScore>):Void
	{
		var leaderBoardPlacement:Int = 1;
		
		for (score in scoreArray)
		{
			var dev:Bool = false;
			var isPlayer:Bool = false;
			var userName:String = score.name;
			
			
			if (Steam.getPersonaName() == userName)
			{
				isPlayer = true;
				#if steam
					if (Steam.active && Steam.getAchievement("Shame_and_Fame"))
					{
						Steam.setAchievement("Shame_and_Fame");
					}
				#end 
				
				if (NGio.isLoggedIn)
				{
					var shameMedal = NG.core.medals.get(54477);
					if (!shameMedal.unlocked)
						shameMedal.sendUnlock();
				}
			}
			
			if (userName == "Ninja_Muffin2.4" || userName == "BrandyBuizel" || userName == "DIGIMIN")
			{
				dev = true;
				userName += " (dev)";
			}
			
			var dispScore:Int = score.score;
			var text:String = Std.string(leaderBoardPlacement + ". " + userName + " - " + dispScore);
			
			var name:FlxText = new FlxText(20, 60 + (34 * leaderBoardPlacement), FlxG.width - 20, text, 24);
			_grpScoresSteam.add(name);
			
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
		#if steam
		Steam.onEnterFrame();
		#end

		
		txtCurrentScoreboard.text = "< " + scoreboardTypes[currentScoreboard] + " >";
		txtCurrentScoreboard.screenCenter(X);
		
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
		
		if (FlxG.keys.justPressed.ANY && !FlxG.keys.anyJustPressed(["LEFT", "RIGHT", "A", "D", "J", "L"]))
		{
			close();
		}
		
		if (FlxG.keys.anyJustPressed(["LEFT", "RIGHT", "A", "D", "J", "L"]))
		{
			currentScoreboard += 1;
		}
	
		
		
		
		if (currentScoreboard >= scoreboardTypes.length)
		{
			currentScoreboard = 0;
		}
		
		
		if (currentScoreboard == 0)
		{
			_grpScoresSteam.visible = false;
			_grpScoresNewgrounds.visible = true;
		}
		
		if (currentScoreboard == 1)
		{
			_grpScoresSteam.visible = true;
			_grpScoresNewgrounds.visible = false;
			hallOfShame.text = "HALL OF SHAME";
			hallOfShame.screenCenter(X);
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