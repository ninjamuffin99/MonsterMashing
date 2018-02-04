package;

import flixel.FlxBasic;
import flixel.FlxG;
import flixel.FlxObject;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.group.FlxGroup;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.group.FlxSpriteGroup.FlxTypedSpriteGroup;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.math.FlxMath;
import flixel.util.FlxSort;

class PlayState extends FlxState
{
	private var _player:Player;
	
	private var _grpEntities:FlxTypedGroup<FlxObject>;
	private var _grpEnemies:FlxTypedSpriteGroup<Enemy>;
	private var _enemy:Enemy;
	
	override public function create():Void
	{
		//Set zoom on map
		FlxG.camera.zoom = 2;
		FlxG.camera.bgColor = 0xFFa5a5a5;
		
		_grpEntities = new FlxTypedGroup<FlxObject>();
		add(_grpEntities);
		
		_grpEnemies = new FlxTypedSpriteGroup<Enemy>();
		_grpEntities.add(_grpEnemies);
		
		_player = new Player(30, 30);
		_grpEntities.add(_player);
		
		_enemy = new Enemy(200, 200, 0);
		_grpEnemies.add(_enemy);
		
		super.create();
	}

	override public function update(elapsed:Float):Void
	{
		//Create if
		FlxG.camera.follow(_player);
		
		if (FlxG.keys.justPressed.TWO)
			FlxG.switchState(new RhythmState());
		
		if (FlxG.overlap(_player, _grpEnemies))
		{
			FlxG.switchState(new BattleState());
		}
		
		super.update(elapsed);
		
		_grpEntities.sort(FlxSort.byY, FlxSort.ASCENDING);
	}
}