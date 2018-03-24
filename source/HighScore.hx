package;
import flixel.FlxG;

/**
 * ...
 * @author ninjaMuffin
 */
class HighScore 
{

	public static var score:Int = 0;
	public static var recentScore:Int = 0;
	public static var totalScore:Int = 0;
	
	public static function save():Void
	{
		FlxG.save.data.score = score;
		FlxG.save.data.totalScore = totalScore;
		
		FlxG.save.data.masterVol = SettingState.masterVol;
		FlxG.save.data.moanVol = SettingState.moanVol;
		FlxG.save.data.musicVol = SettingState.musicVol;
		FlxG.save.data.soundVol = SettingState.soundVol;
		
		FlxG.save.flush();
	}
	
	public static function load():Void
	{
		if (FlxG.save.data.score != null)
		{
			score = FlxG.save.data.score;
			totalScore = FlxG.save.data.totalScore;
			
			SettingState.masterVol = FlxG.save.data.masterVol;
			SettingState.moanVol = FlxG.save.data.moanVol;
			SettingState.musicVol = FlxG.save.data.musicVol;
			SettingState.soundVol = FlxG.save.data.soundVol;
			
			
		}
	}
	
	
}