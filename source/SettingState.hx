package;
import flixel.FlxG;
import flixel.FlxState;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.group.FlxSpriteGroup;
import flixel.math.FlxMath;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import io.newgrounds.NG;

/**
 * ...
 * @author ninjaMuffin
 */
class SettingState extends BaseMenuState
{
	public static var masterVol:Float = 1;
	public static var musicVol:Float = 1;
	public static var soundVol:Float = 1;
	public static var moanVol:Float = 1;
	//public static var Mode:Bool = false
	//public static var gameSpeed:Float = 1;
	public static var aprilFools:Bool = false;
	//public static var picoDay:Float = 0;
	
	public static var mashHold:Bool = false;
	
	private var musicTxt:FlxText;
	private var speedTxt:FlxText;
	
	/**
	 * First array is is title
	 * second array is value
	 * third is lowest possible value
	 */
	private var settingsArray:Array<Dynamic> = 
	[
		["Master Volume", "Music Volume", "SFX Volume", "Moan Volume", "Hold to attack",/* "Pico Day"*/], 
		[masterVol, musicVol, soundVol, moanVol],
		[0, 0, 0, 0, false]
	];
	
	private var _selection:Int = 0;
	private var _selector:FlxSpriteGroup;
	private var _selLeft:FlxText;
	private var _selRight:FlxText;
	
	private var _grpValues:FlxTypedGroup<FlxText>;
	private var _grpText:FlxTypedGroup<FlxText>;
	
	private var exitTxt:FlxText;
	private var NGAPI:FlxText;
	private var deleteText:FlxText;
	
	override public function create():Void 
	{
		initTilemap(1);
		
		NGAPI = new FlxText(32, 350, FlxG.width - 32, "Press N to log into the Newgrounds API!", 28);
		#if !nutaku
		add(NGAPI);
		#end
		
		deleteText = new FlxText(32, 420, FlxG.width - 32, "\nPress P to delete all data!", 28);
		add(deleteText);
		
		_selector = new FlxSpriteGroup();
		add(_selector);
		
		_grpValues = new FlxTypedGroup<FlxText>();
		add(_grpValues);
		
		_grpText = new FlxTypedGroup<FlxText>();
		add(_grpText);
		
		_selLeft = new FlxText(0, 0, 0, "<", 32);
		_selector.add(_selLeft);
		
		_selRight = new FlxText(100, 0, 0, ">", 32);
		_selector.add(_selRight);
		
		for (i in 0...settingsArray[0].length)
		{
			var yPos:Float = (34 * i) + 100;
			
			var settingText:FlxText = new FlxText(32, yPos, 0, settingsArray[0][i], 32);
			_grpText.add(settingText);
			
			var settingValue:FlxText = new FlxText(FlxG.width - 96, yPos, 0, Std.string(Std.int(settingsArray[1][i])), 32);
			_grpValues.add(settingValue);
			
			
		}
		
		exitTxt = new FlxText(16, FlxG.height - 64, 0, "Z to return to Menu", 32);
		add(exitTxt);
		
		if (FlxG.onMobile)
		{
			exitTxt.text = "Tap here to exit";
		}
		
		_selector.x = FlxG.width - 130;
		changePos();
		
		super.create();
	}
	
	override public function update(elapsed:Float):Void 
	{
		super.update(elapsed);
		
		NGAPItextUpdate();
		
		//speedTxt.text = "Game Speed: " + gameSpeed;
		
		controls();
		
		if (_selection > settingsArray[0].length - 1)
			_selection = 0;
		if (_selection < 0)
			_selection = Std.int(settingsArray[0].length - 1);
		
		if (FlxG.keys.justPressed.ANY)
			changePos();
		
		
		if (FlxG.keys.anyJustPressed(["Z", "ENTER", "SPACE"]))
		{
			FlxG.switchState(new MenuState());
		}
		
		for (t in 0..._grpValues.members.length)
		{
			_grpValues.members[t].text = Std.string(settingsArray[1][t]); 
		}
		
		if (FlxG.keys.justPressed.P)
		{
			HighScore.score = 0;
			HighScore.totalScore = 0;
			FlxG.save.data.sessionId = null;
			HighScore.save();
			deleteText.text = "Data deleted";
		}
		
		if (FlxG.keys.justPressed.N && !NGio.isLoggedIn)
		{
			var newgrounds:NGio = new NGio(APIStuff.APIID, APIStuff.EncKey);
		}
		else if (FlxG.keys.justPressed.N && NGio.isLoggedIn)
			NG.core.logOut(function()
			{
				NGio.isLoggedIn = false;
				FlxG.save.data.sessionId = null;
				FlxG.save.flush();
				
			});
	}
	
	override public function switchTo(nextState:FlxState):Bool 
	{
		HighScore.save();
		
		return super.switchTo(nextState);
	}
	
	private function controls():Void
	{
		
		if (FlxG.keys.anyJustPressed(["W", "UP", "I"]))
		{
			_selection -= 1;
			changePos();
		}
		else if (FlxG.keys.anyJustPressed(["S", "DOWN", "K"]))
		{
			_selection += 1;
			changePos();
		}
		
		if (FlxG.keys.anyJustPressed(["A", "LEFT", "J"]))
		{
			changeValue(-0.1);
		}
		if (FlxG.keys.anyJustPressed(["D", "RIGHT", "L"]))
		{
			changeValue(0.1);
		}
		
		
		if (FlxG.onMobile)
		{
			for (touch in FlxG.touches.list)
			{
				if (touch.overlaps(_grpText.members[0]) || touch.overlaps(_grpValues.members[0]))
				{
					_selection = 0;
				}
				
				if (touch.overlaps(_grpText.members[1]) || touch.overlaps(_grpValues.members[1]))
				{
					_selection = 1;
				}
				
				if (touch.overlaps(_grpText.members[2]) || touch.overlaps(_grpValues.members[2]))
				{
					_selection = 2;
				}
				
				if (touch.overlaps(_grpText.members[3]) || touch.overlaps(_grpValues.members[3]))
				{
					_selection = 3;
				}
				
				if (touch.justPressed)
				{
					if (touch.overlaps(NGAPI) && !NGio.isLoggedIn)
					{
						var newgrounds:NGio = new NGio(APIStuff.APIID, APIStuff.EncKey);
						NGAPI.text = "sike, this doesnt do anything";
					}
					
					if (touch.overlaps(_selLeft))
					{
						changeValue( -0.1);
					}
					else if (touch.overlaps(_selRight))
					{
						changeValue(0.1);
					}
					
					if (touch.overlaps(exitTxt))
					{
						FlxG.switchState(new MenuState());
					}
					
					changePos();
				}
			}
		}		
	}
	
	private function changeValue(diff:Float):Void
	{
		// This only works for float values, for bool (april fools toggle for an example) the other commented junk might work better i think
		// I'd still ahve to clean it up
		
		
		if (Type.typeof(settingsArray[0][_selection]) == TBool)
		{
			settingsArray[1][_selection] = !settingsArray[1][_selection];
		}
		else
		{
			settingsArray[1][_selection] += diff;
			
			
			if (settingsArray[1][_selection] < settingsArray[2][_selection])
				settingsArray[1][_selection] = settingsArray[2][_selection];
			
			settingsArray[1][_selection] = FlxMath.roundDecimal(settingsArray[1][_selection], 1);
			
		}
		/*
		if (settingsArray[1][_selection] || !settingsArray[1][_selection])
		{
			settingsArray[1][_selection] = !settingsArray[1][_selection];
		}
		else
		{
			settingsArray[1][_selection] += diff;
		}
		*/
		
		if (_selection < 4)
		{
			#if flash
			FlxG.sound.play("assets/sounds/smack1.mp3", 1 * settingsArray[1][_selection] * masterVol);
			#else
				FlxG.sound.play("assets/sounds/smack1.ogg", 1 * settingsArray[1][_selection] * masterVol);
			#end
		}
		
		
		masterVol = settingsArray[1][0];
		musicVol = settingsArray[1][1];
		soundVol = settingsArray[1][2];
		moanVol = settingsArray[1][3];
		//gameSpeed = settingsArray[1][4];
		mashHold = settingsArray[1][4];//MAKE SURE THIS IS CHANGED ONCE WE USE GAME SPEED MODIFIERS
		//picoDay = settingsArray[1][0];
	}
	
	private function NGAPItextUpdate():Void
	{
		if (FlxG.onMobile)
		{
			NGAPI.text = "Tap here to sign into the Newgrounds API!";
		}
		
		
		if (NGio.isLoggedIn)
		{
			//NGAPI.text = "Logged into the Newgrounds API as " + NG.core.user.name;
			NGAPI.text = "Logged into the Newgrounds API as " + NG.core.user.name;
			
			if (NGio.scoreboardsLoaded)
			{
				NGAPI.text += "\nScoreboard data loaded";
			}
			else
			{
				NGAPI.text += "\nLoading scoreboards... Please wait";
			}
			
		}
	}

	private function changePos():Void
	{
		_selector.y = (_selection * 34) + 34 * 3;
	}
	
}