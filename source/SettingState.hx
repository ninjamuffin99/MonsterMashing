package;
import flixel.FlxG;
import flixel.FlxState;
import flixel.group.FlxSpriteGroup;
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
	
	private var settingsArray:Array<Dynamic> = [["Music Volume", "Sound Effect Volume", "Moan Volume", "Game Speed"], [musicVol, soundVol, moanVol, gameSpeed]];
	
	private var _selector:FlxSpriteGroup;
	private var _selLeft:FlxText;
	private var _selRight:FlxText;
	
	override public function create():Void 
	{
		_selector = new FlxSpriteGroup();
		add(_selector);
		
		_selLeft = new FlxText(0, 0, 0, "<", 32);
		_selector.add(_selLeft);
		
		_selRight = new FlxText(100, 0, 0, ">", 32);
		_selector.add(_selRight);
		
		for (i in 0...settingsArray[0].length)
		{
			var settingText:FlxText = new FlxText(32, (34 * i) + 100, 0, settingsArray[0][i], 32);
			add(settingText);
		}
		
		super.create();
	}
	
	override public function update(elapsed:Float):Void 
	{
		super.update(elapsed);
		
		speedTxt.text = "Game Speed: " + gameSpeed;
		
		if (FlxG.keys.justPressed.W)
		{
			_selector.y -= 64;
		}
		else if (FlxG.keys.justPressed.S)
		{
			_selector.y += 64;
		}
		
		if (FlxG.keys.justPressed.ENTER)
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