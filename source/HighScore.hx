package;
import flixel.FlxG;

/**
 * More or less the Reg.hx sorta file I guess, where im just gonna save all the persistent music
 * @author ninjaMuffin
 */
class HighScore 
{

	public static var score:Int = 0;
	public static var recentScore:Int = 0;
	public static var totalScore:Int = 0;
	
	public static var shiniesSeen:Array<Bool> = 
	[
		false,
		false,
		false,
		false,
		false,
		false,
		false
	];
	
	/**
	 * list of monsters in order of enemyType in mashstate
	 */
	public static var monsterList:Array<String> =
	[
		"mush",
		"vine",
		"bat",
		"slime",
		"minotaur",
		"echidna",
		"clam"
	];
	
	public static function save():Void
	{
		FlxG.save.data.score = score;
		FlxG.save.data.totalScore = totalScore;
		
		FlxG.save.data.masterVol = SettingSubstate.masterVol;
		FlxG.save.data.moanVol = SettingSubstate.moanVol;
		FlxG.save.data.musicVol = SettingSubstate.musicVol;
		FlxG.save.data.soundVol = SettingSubstate.soundVol;
		FlxG.save.data.mashHold = SettingSubstate.mashHold;
		FlxG.save.data.shiniesSeen = HighScore.shiniesSeen;
		
		FlxG.save.flush();
	}
	
	public static function load():Void
	{
		
		if (FlxG.save.data.totalScore != null)
		{
			score = FlxG.save.data.score;
			totalScore = FlxG.save.data.totalScore;
			
			SettingSubstate.masterVol = FlxG.save.data.masterVol;
			SettingSubstate.moanVol = FlxG.save.data.moanVol;
			SettingSubstate.musicVol = FlxG.save.data.musicVol;
			SettingSubstate.soundVol = FlxG.save.data.soundVol;
			
			// super specific code for older savefiles
			if (FlxG.save.data.shiniesSeen != null)
			{
				HighScore.shiniesSeen = FlxG.save.data.shiniesSeen;
			}
			
		}
	}
}