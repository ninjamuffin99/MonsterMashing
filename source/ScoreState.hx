package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxSubState;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.group.FlxSpriteGroup;
import flixel.text.FlxText;
import flixel.util.FlxColor;
import io.newgrounds.NG;

/**
 * ...
 * @author ninjaMuffin
 */
class ScoreState extends FlxSubState 
{
	private var hallOfShame:FlxText;
	private var bountyTxt:FlxText;
	private var _grpText:FlxSpriteGroup;
	
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
		
		#if flash
			NG.core.scoreBoards.get(8004).requestScores(20);
			
			var leaderBoardPlacement:Int = 1;
			
			
			for (score in NG.core.scoreBoards.get(8004).scores)
			{
				var dev:Bool = false;
				var isPlayer:Bool = false;
				var userName:String = score.user.name;
				
				if (NG.core.user.name == score.user.name)
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
				
				trace('score loaded user:${score.user.name}, score:${score.formatted_value}');
			}
			
			bountyTxt = new FlxText(0, FlxG.height - 112, 0, "\nBOUNTIES\nThe third player to pass 100k\non the leaderboard\nwill receive one year supporter status.", 16);
			bountyTxt.screenCenter(X);
			bountyTxt.alignment = FlxTextAlign.CENTER;
			add(bountyTxt);
			bountyTxt.color = FlxColor.YELLOW;
		#else
			hallOfShame.text += "\n\nScoreboards not yet \nimplemented\n on HTML5 \n\nComing soon!";
			hallOfShame.screenCenter(X);
			hallOfShame.alignment = FlxTextAlign.CENTER;
		#end
		
		super.create();
	}
	
	override public function update(elapsed:Float):Void 
	{
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