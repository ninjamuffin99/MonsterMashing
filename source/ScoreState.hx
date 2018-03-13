package;

import flixel.FlxG;
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
	private var _grpText:FlxSpriteGroup;
	
	public function new(BGColor:FlxColor=FlxColor.TRANSPARENT) 
	{
		persistentUpdate = true;
		
		super(BGColor);
	}
	
	override public function create():Void 
	{
		_grpText = new FlxSpriteGroup();
		add(_grpText);
		
		hallOfShame = new FlxText(0, 8, 0, "HALL OF SHAME", 32);
		hallOfShame.screenCenter(X);
		_grpText.add(hallOfShame);
		
		FlxG.log.redirectTraces = true;
		
		var leaderBoardPlacement:Int = 1;
		
		for (score in NG.core.scoreBoards.get(8004).scores)
		{
			var text:String = Std.string(leaderBoardPlacement + ". " + score.user.name + " - " + score.formatted_value);
			
			var name:FlxText = new FlxText(20, 32 + (34 * _grpText.members.length), FlxG.width - 20, text, 32);
			_grpText.add(name);
			
			leaderBoardPlacement += 1;
			
			trace('score loaded user:${score.user.name}, score:${score.formatted_value}');
		}
		
		super.create();
	}
	
	override public function update(elapsed:Float):Void 
	{
		if (FlxG.keys.justPressed.Q)
		{
			close();
		}
		
		super.update(elapsed);
	}
}