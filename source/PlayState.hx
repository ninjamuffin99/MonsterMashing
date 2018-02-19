package;

import flixel.FlxBasic;
import flixel.FlxCamera.FlxCameraFollowStyle;
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
import flixel.util.FlxColor;
import flixel.util.FlxSort;
import openfl.display.BlendMode;
using flixel.util.FlxSpriteUtil;

class PlayState extends FlxState
{
	private var _player:Player;
	public var _enemy:Enemy;
	
	private var _grpEntities:FlxTypedGroup<FlxObject>;
	private var _grpEnemies:FlxTypedSpriteGroup<Enemy>;
	private var _grpDoors:FlxTypedGroup<Door>;
	
	//private var _roomNum;
	//private var _roomShow;
	//private var _roomBuffer;
	
	//MAP SHIT
	/**
	 * The map data, loaded from Ogmo
	 */
	private var _map:FlxOgmoLoader;
	/**
	 * the actual tilemap that'll be displayed ingame
	 */
	private var _mWalls:FlxTilemap;
	private var _mFloors:FlxTilemap;
	private var _camTarget:FlxTilemap;

	override public function create():Void
	{
		//Set zoom on map
		FlxG.camera.zoom = 2.5;
		FlxG.camera.bgColor = 0xFFa5a5a5;
		
		//Who needs a mouse when you have Z
		FlxG.mouse.visible = false;
		
		_map = new FlxOgmoLoader("assets/data/map.oel");
		
		_mFloors = _map.loadTilemap("assets/data/tile_temple.png", 16, 16, "Floor");
		add(_mFloors);
		
		_mWalls = _map.loadTilemap("assets/data/tile_temple.png", 16, 16, "Walls");
		add(_mWalls);
		
		_grpDoors = new FlxTypedGroup<Door>();
		add(_grpDoors);
		
		
		_grpEntities = new FlxTypedGroup<FlxObject>();
		add(_grpEntities);
		
		_grpEnemies = new FlxTypedSpriteGroup<Enemy>();
		_grpEntities.add(_grpEnemies);
		
		_player = new Player();
		_grpEntities.add(_player);
		
		//Camera
		FlxG.camera.follow(_player, FlxCameraFollowStyle.LOCKON, 0.1);
		
		_map.loadEntities(placeEntities, "Entities");
		
		FlxG.log.add("Added Enemy");
		
		#if flash
			FlxG.sound.playMusic(AssetPaths.eigi_in_a_well__mp3);
		#else
			FlxG.sound.playMusic(AssetPaths.eigi_in_a_well__ogg);
        #end
		
		
		super.create();
	}
	
	private function placeEntities(entityName:String, entityData:Xml):Void
	{
		var x:Int = Std.parseInt(entityData.get("x"));
		var y:Int = Std.parseInt(entityData.get("y"));
		
		if (entityName == "player")
		{
			_player.x = x;
			_player.y = y;
		}
		else if (entityName == "enemy")
		{
			_grpEnemies.add(new Enemy(x, y, 0));
		}
		else if (entityName == "doorTrigger")
		{
			_grpDoors.add(new Door(x, y, Std.parseInt(entityData.get("door"))));
		}
	}

	override public function update(elapsed:Float):Void
	{
		//processShadows();
		
		super.update(elapsed);
		
			
		if (FlxG.keys.justPressed.TWO)
			FlxG.switchState(new RhythmState());
		
		if (FlxG.overlap(_player, _grpEnemies))
		{
			FlxG.switchState(new MashState());
			
			/*
			if (MashState.outcome == VICTORY)
			{
				if (FlxG.overlap(_player, _enemy))
				{
					destroy();
				}
			}
			*/
		}
		
		_grpDoors.forEach(checkOverlap);
		
		//_map.collideWithLevel(_player);
		
		//Collision
		_grpEntities.sort(FlxSort.byY, FlxSort.ASCENDING);
		FlxG.collide(_player, _mWalls);
		
		//ROOM CODE
		//This is gonna be a shitton of logic, hang on to your butts
		/*if (_roomNum = 0){
			
		}else if(){
			
		}*/
	}

	private function checkOverlap(d:Door):Void
	{
		if (FlxG.overlap(_player, d))
		{
			//Change this or something so that its not -48 and rather something that can be more dynamic
			_player.y = getDoor(d).y - 48;
		}
	}
	
	private function getDoor(d:Door):Door
	{
		var door:Door = d;
		for (i in 0..._grpDoors.length)
		{
			if (d.doorID == _grpDoors.members[i].doorID && d != _grpDoors.members[i])
			{
				door = _grpDoors.members[i];
			}
		}
		
		return door;
	}
}
