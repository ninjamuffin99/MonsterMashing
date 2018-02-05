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
	static var min_x;
	static var max_x;
	static var min_y;
	static var max_y;

	private var _player:Player;

	private var _grpEntities:FlxTypedGroup<FlxObject>;
	private var _grpEnemies:FlxTypedSpriteGroup<Enemy>;
	private var _enemy:Enemy;

	private var _map:TiledLevel;

	override public function create():Void
	{
		//Set zoom on map
		FlxG.camera.zoom = 4;
		FlxG.camera.bgColor = 0xFFa5a5a5;
		FlxG.camera.follow(_player);

		//Who needs a mouse when you have Z
		//shows the mouse only in debug mode, don't know how useful it'll be tho idk ehehehe
		#if !debug
			FlxG.mouse.visible = false;
		#end

		_map = new TiledLevel(AssetPaths.mapTest__tmx, this);

		add(_map.backgroundLayer);
		/* misc adds pls ignore
		add (_map.imagesLayer);
		add(_map.foregroundTiles);
		add(_map.BGObjects);
		add(_map.foregroundObjects);
		*/

		_grpEntities = new FlxTypedGroup<FlxObject>();
		add(_grpEntities);

		_grpEnemies = new FlxTypedSpriteGroup<Enemy>();
		_grpEntities.add(_grpEnemies);

		_player = new Player(30, 30);
		_grpEntities.add(_player);

		_enemy = new Enemy(200, 200, 0);
		_grpEnemies.add(_enemy);

		//setup screen constraints
		min_x = -FlxG.stage.stageWidth / 2;
		max_x = FlxG.stage.stageWidth * 1.5;
		min_y = -FlxG.stage.stageHeight / 2;
		max_x = FlxG.stage.stageHeight * 1.5;

		super.create();
	}

	override public function update(elapsed:Float):Void
	{
		//Create if


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
