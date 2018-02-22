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
	
	private var _mWalls:FlxTilemap;
	private var _mFloors:FlxTilemap;
	//The second group of tilemaps
	private var _mWalls2:FlxTilemap;
	private var _mFloors2:FlxTilemap;
	
	private var _grpTilemaps:FlxTypedGroup<FlxTilemap>;
	private var _grpWalls:FlxTypedGroup<FlxTilemap>;
	
	
	private var _camTarget:FlxSprite;

	override public function create():Void
	{
		//Set zoom on map
		FlxG.camera.zoom = 5;
		FlxG.camera.bgColor = 0xFFa5a5a5;
		
		//Who needs a mouse when you have Z
		FlxG.mouse.visible = false;
		
		_grpTilemaps = new FlxTypedGroup<FlxTilemap>();
		add(_grpTilemaps);
		
		_grpWalls = new FlxTypedGroup<FlxTilemap>();
		add(_grpWalls);
		
		_grpDoors = new FlxTypedGroup<Door>();
		add(_grpDoors);
		
		
		_grpEntities = new FlxTypedGroup<FlxObject>();
		add(_grpEntities);
		
		_grpEnemies = new FlxTypedSpriteGroup<Enemy>();
		_grpEntities.add(_grpEnemies);
		
		_player = new Player();
		_grpEntities.add(_player);
		
		initTilemap();
		
		FlxG.log.add("Added Entities");
		
		
		//Camera
		_camTarget = new FlxSprite(_player.x, _player.y);
		_camTarget.makeGraphic(16, 16, FlxColor.TRANSPARENT);
		add(_camTarget);
		FlxG.camera.follow(_camTarget, FlxCameraFollowStyle.LOCKON);
		//sets the camTarget to be always 4.5 tiles ahead of the player
		_camTarget.y = _player.y - (16 * 4);
		
		FlxG.log.add("Init Camera");
		
		#if flash
			FlxG.sound.playMusic(AssetPaths.eigi_in_a_well__mp3);
		#else
			FlxG.sound.playMusic(AssetPaths.eigi_in_a_well__ogg);
        #end
		
		
		super.create();
	}
	
	private function initTilemap():Void
	{
		_map = new FlxOgmoLoader("assets/data/start.oel");
		_map.loadEntities(placeEntities, "Entities");
		
		
		_mFloors = _map.loadTilemap("assets/data/tile_temple.png", 16, 16, "Floor");
		_grpTilemaps.add(_mFloors);
		
		_mWalls = _map.loadTilemap("assets/data/tile_temple.png", 16, 16, "Walls");
		_grpWalls.add(_mWalls);
		
		_map = new FlxOgmoLoader("assets/data/1.oel");
		
		
		_mFloors2 = _map.loadTilemap("assets/data/tile_temple.png", 16, 16, "Floor");
		_mFloors2.y -= _mFloors2.height;
		_grpTilemaps.add(_mFloors2);
		
		_mWalls2 = _map.loadTilemap("assets/data/tile_temple.png", 16, 16, "Walls");
		_mWalls2.y -= _mWalls2.height;
		_grpWalls.add(_mWalls2);
		
		
		FlxG.watch.add(_mFloors, "y");
		FlxG.watch.add(_mFloors2, "y");
		FlxG.log.add(FlxG.height);
		
	}
	
	private function generateTilemap(t:FlxTilemap, type:String):Void
	{	
		if (type == "Walls")
			_grpWalls.remove(t);
		if (type == "Floor")
			_grpTilemaps.remove(t);
		
		_map = new FlxOgmoLoader("assets/data/" + FlxG.random.int(1, 3) + ".oel");
		
		t = _map.loadTilemap("assets/data/tile_temple.png", 16, 16, type);
		t.y = 0 - t.height;
		
		if (type == "Walls")
			_grpWalls.add(t);
		if (type == "Floor")
			_grpTilemaps.add(t);
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
		super.update(elapsed);
		
		
		
		//Runs every frame to move each tilemaps position, and also moves it up when appropriate.
		_grpTilemaps.forEach(checkTilemapPos);
		_grpWalls.forEach(checkWallPos);
		
		
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
		FlxG.collide(_player, _grpWalls);
		
		//ROOM CODE
		//This is gonna be a shitton of logic, hang on to your butts
		/*if (_roomNum = 0){
			
		}else if(){
			
		}*/
	}
	
	private function checkTilemapPos(t:FlxTilemap):Void
	{
		updatePos(t, "Floor");
	}
	
	private function checkWallPos(w:FlxTilemap):Void
	{
		updatePos(w, "Walls");
	}
	
	private function updatePos(t:FlxTilemap, type:String)
	{
		var speed:Float = 2;
		t.y += speed;
		
		// if the tilemap's y pos, is greater than the height(864) divided by 5(because of the zoom), 
		//then it moves it 2 tilemap's up
		if (t.y > FlxG.height / 5)
		{
			FlxG.log.add("Move tilemaps");
			
			generateTilemap(t, type);
		}
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
