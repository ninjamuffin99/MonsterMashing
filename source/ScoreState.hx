package;

import flixel.FlxG;
import flixel.FlxSubState;
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
	
	public function new(BGColor:FlxColor=FlxColor.TRANSPARENT) 
	{
		super(BGColor);
		
	}
	
	override public function create():Void 
	{
		hallOfShame = new FlxText(0, 8, 0, "HALL OF SHAME", 32);
		hallOfShame.screenCenter(X);
		add(hallOfShame);
		
		FlxG.log.redirectTraces = true;
		
		for (score in NG.core.scoreBoards.get(8061).scores)
		{
			var name:FlxText = new FlxText(20, 20, FlxG.width - 20, Std.string(score.user.name + ":" + score.formatted_value), 16);
			add(name);
			
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