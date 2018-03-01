package;
import flixel.FlxG;
import com.newgrounds.*;
import com.newgrounds.components.*;

/**
 * ...
 * @author ninjaMuffin
 */
class Score 
{

	public static var score:Int = 0;
	
	public static function save():Void
	{
		FlxG.save.data.score = score;
		FlxG.save.flush();
	}
	
	public static function load():Void
	{
		if (FlxG.save.data.score != null)
		{
			score = FlxG.save.data.score;
		}
	}
	
	
}