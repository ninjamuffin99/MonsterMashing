package;

import flixel.FlxBasic;
import flixel.FlxG;
import flixel.FlxObject;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.addons.editors.ogmo.FlxOgmoLoader;
import flixel.group.FlxGroup;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.group.FlxSpriteGroup.FlxTypedSpriteGroup;
import flixel.text.FlxText;
import flixel.tile.FlxTilemap;
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
	//private var _camTarget;

	private var _grpEntities:FlxTypedGroup<FlxObject>;
	private var _grpEnemies:FlxTypedSpriteGroup<Enemy>;
	private var _enemy:Enemy;

	//old map variable
	//private var _map:TiledLevel;
	
	//private var _roomNum;
	//private var _roomShow;
	//private var _roomBuffer;
	
	//MAP SHIT
	/**
	 * The map data, laoded from Ogmo
	 */
	private var _map:FlxOgmoLoader;
	/**
	 * the actual tilemap that'll be displayed ingame
	 */
	private var _mWalls:FlxTilemap;
	private var _mFloors:FlxTilemap;

	override public function create():Void
	{
		//Set zoom on map
		FlxG.camera.zoom = 2.5;
		FlxG.camera.bgColor = 0xFFa5a5a5;
		
		//Who needs a mouse when you have Z
		//shows the mouse only in debug mode, don't know how useful it'll be tho idk ehehehe
		#if !debug
			FlxG.mouse.visible = false;
		#end
		
		
		
		_map = new FlxOgmoLoader("assets/data/Level.oel");
		
		_mFloors = _map.loadTilemap("assets/data/tile temple.png", 16, 16, "Floor");
		add(_mFloors);
		
		_mWalls = _map.loadTilemap("assets/data/tile temple.png", 16, 16, "Walls");
		add(_mWalls);
		
		
		/* OLD SHIT BABY
		_map = new TiledLevel(AssetPaths.mapTest__tmx, this);

		add(_map.backgroundLayer);
		add(_map.foregroundTiles);
		//add(_map.);
		//add(_map.black);
		 misc adds pls ignore
		add (_map.imagesLayer);
		add(_map.BGObjects);
		add(_map.foregroundObjects);
		*/

		_grpEntities = new FlxTypedGroup<FlxObject>();
		add(_grpEntities);

		_grpEnemies = new FlxTypedSpriteGroup<Enemy>();
		_grpEntities.add(_grpEnemies);

		_player = new Player(200, 575);
		_grpEntities.add(_player);

		_enemy = new Enemy(200, 500, 0);
		_grpEnemies.add(_enemy);
		
		FlxG.log.add("Added Enemy");
		
		/*
		//setup screen constraints
		min_x = -FlxG.stage.stageWidth / 2;
		max_x = FlxG.stage.stageWidth * 1.5;
		min_y = -FlxG.stage.stageHeight / 2;
		max_x = FlxG.stage.stageHeight * 1.5;
		*/
		/*
		// Loop music, Flash only
		FlxG.sound.playMusic(AssetPaths.newgrounds_lhm__e__mp3);
		// Loop music, non-Flash only
		FlxG.sound.playMusic(AssetPaths.newgrounds_lhm__e__ogg);
		*/
		super.create();
	}

	override public function update(elapsed:Float):Void
	{
		//Cam
		FlxG.camera.follow(_player);
		
		//Shitty Collision
		//FlxG.collide(_player, _map.foregroundObjects);

		if (FlxG.keys.justPressed.TWO)
			FlxG.switchState(new RhythmState());

		if (FlxG.overlap(_player, _grpEnemies))
		{
			FlxG.switchState(new BattleState());
		}
		
		//_map.collideWithLevel(_player);

		super.update(elapsed);

		_grpEntities.sort(FlxSort.byY, FlxSort.ASCENDING);
		
		//ROOM CODE
		//This is gonna be a shitton of logic, hang on to your butts
		/*if (_roomNum = 0){
			
		}else if(){
			
		}*/
	}
}
