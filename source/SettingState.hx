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
 * Basically a shell to hold the SettingSubstate rather than a fully fleshed out state
 * @author ninjaMuffin
 */
class SettingState extends BaseMenuState
{
	override public function create():Void 
	{
		initTilemap(1);
		persistentDraw = true;
		persistentUpdate = true;
		
		openSubState(new SettingSubstate());
		
		super.create();
	}
	
	override public function closeSubState():Void 
	{
		FlxG.switchState(new MenuState());
		
		super.closeSubState();
	}
	
	override public function update(elapsed:Float):Void 
	{
		super.update(elapsed);
		controls();
	}
	
	override public function switchTo(nextState:FlxState):Bool 
	{
		HighScore.save();
		
		return super.switchTo(nextState);
	}
	
	private function controls():Void
	{
		
		if (FlxG.keys.anyJustPressed(["ESCAPE", Z]))
		{
			FlxG.switchState(new MenuState());
		}
		
		var gamepad = FlxG.gamepads.lastActive;
		if (gamepad != null)
		{
			if (gamepad.anyJustPressed(["BACK", "START", "B"]))
			{
				FlxG.switchState(new MenuState());
			}
			
			
		}
	}
}