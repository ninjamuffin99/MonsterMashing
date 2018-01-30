package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.math.FlxMath;

class PlayState extends FlxState
{

	private var _player:Player;
	
	override public function create():Void
	{
		
		_player = new Player(30, 30);
		add(_player);
		
		super.create();
	}

	override public function update(elapsed:Float):Void
	{
		
		if (FlxG.keys.justPressed.TWO)
			FlxG.switchState(new RhythmState());
		
		super.update(elapsed);
	}
}