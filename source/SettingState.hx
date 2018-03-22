package;
import flixel.FlxG;
import flixel.FlxState;
import flixel.text.FlxText;

/**
 * ...
 * @author ninjaMuffin
 */
class SettingState extends FlxState
{
	public static var musicVol:Float = 1;
	public static var soundVol:Float = 1;
	public static var moanVol:Float = 1;
	//public static var Mode:Bool = false
	public static var gameSpeed:Float = 1;
	
	private var musicTxt:FlxText;
	private var speedTxt:FlxText;
	
	override public function create():Void 
	{
		musicTxt = new FlxText(0, 60, 0, "Music Volume", 32);
		musicTxt.screenCenter(X);
		add(musicTxt);
		
		speedTxt = new FlxText(100, 100, 0, "game speed: ", 32);
		add(speedTxt);
		
		super.create();
	}
	
	override public function update(elapsed:Float):Void 
	{
		super.update(elapsed);
		
		speedTxt.text = "Game Speed: " + gameSpeed;
		
		if (FlxG.keys.justPressed.W)
		{
			FlxG.switchState(new MenuState());
		}
		
		//accessability shit
		if (gameSpeed > 0.2)
		{
			if (FlxG.keys.justPressed.E)
			{
				gameSpeed += 0.1;
			}
			if (FlxG.keys.justPressed.Q)
			{
				gameSpeed -= 0.1;
			}
		}
		
	}
	
}