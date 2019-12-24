package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.addons.editors.ogmo.FlxOgmoLoader;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.tile.FlxTilemap;
import flixel.util.FlxColor;

/**
 * ...
 * @author ...
 */
class BaseMenuState extends FlxState 
{	
	//MAP SHIT
	//The map data, loaded from Ogmo
	private var _map:FlxOgmoLoader;
	
	private var _mWalls:FlxTilemap;
	private var _mFloors:FlxTilemap;
	//The second group of tilemaps
	private var _mWalls2:FlxTilemap;
	private var _mFloors2:FlxTilemap;
	//Third group
	private var _mWalls3:FlxTilemap;
	private var _mFloors3:FlxTilemap;
	
	private var _grpTilemaps:FlxTypedGroup<FlxTilemap>;
	private var _grpWalls:FlxTypedGroup<FlxTilemap>;
	private var speed:Float = 3;
	
	private var mapZoom:Float = 5;
	private var mapOffsetX:Float = -86;
	
	private var curTilemap:Int = 0;
	
	override public function create():Void 
	{
		super.create();
	}
	
	override public function update(elapsed:Float):Void 
	{
		_grpTilemaps.forEach(checkTilemapPos);
		_grpWalls.forEach(checkWallPos);
		
		
		super.update(elapsed);
	}
	
	
	private function initTilemap(tilemapVersion:Int = 0):Void
	{
		curTilemap = tilemapVersion;
		
		_grpTilemaps = new FlxTypedGroup<FlxTilemap>();
		add(_grpTilemaps);
		
		_grpWalls = new FlxTypedGroup<FlxTilemap>();
		add(_grpWalls);
		
		var scaleFixin:Float = 12 * mapZoom;
		
		//loads a new oel for the _map variable
		
		_map = new FlxOgmoLoader("assets/data/start.oel");
		
		_mFloors = _map.loadTilemap("assets/data/tile_temple_" + curTilemap + ".png", 16, 16, "Floor");
		_mFloors.scrollFactor.set();
		_mFloors.screenCenter(X);
		_grpTilemaps.add(_mFloors);
		
		_mWalls = _map.loadTilemap("assets/data/tile_temple_" + curTilemap + ".png", 16, 16, "Walls");
		_mWalls.scrollFactor.set();
		_mWalls.screenCenter(X);
		_grpWalls.add(_mWalls);
		
		//loads a new oel for the _map variable
		_map = new FlxOgmoLoader("assets/data/chunk7.oel");
		
		_mFloors2 = _map.loadTilemap("assets/data/tile_temple_" + curTilemap + ".png", 16, 16, "Floor");
		_mFloors2.y -= 16 * scaleFixin;
		_mFloors2.scrollFactor.set();
		_mFloors.screenCenter(X);
		_grpTilemaps.add(_mFloors2);
		
		_mWalls2 = _map.loadTilemap("assets/data/tile_temple_" + curTilemap + ".png", 16, 16, "Walls");
		_mWalls2.y -= 16 * scaleFixin;
		_mWalls2.screenCenter(X);
		_mWalls2.scrollFactor.set();
		_grpWalls.add(_mWalls2);
		
		_mFloors3 = _map.loadTilemap("assets/data/tile_temple_" + curTilemap + ".png", 16, 16, "Floor");
		_mFloors3.y -= 16 * scaleFixin * 2;
		_mFloors3.scrollFactor.set();
		_mFloors3.screenCenter(X);
		_grpTilemaps.add(_mFloors3);
		
		_mWalls3 = _map.loadTilemap("assets/data/tile_temple_" + curTilemap + ".png", 16, 16, "Walls");
		_mWalls3.y -= 16 * scaleFixin * 2;
		_mWalls3.scrollFactor.set();
		_mWalls3.screenCenter(X);
		_grpWalls.add(_mWalls3);
		
		_grpTilemaps.forEach(scaleUp);
		_grpWalls.forEach(scaleUp);
		
		var bg = new FlxSprite().makeGraphic(FlxG.width, FlxG.height, FlxColor.BLACK);
		bg.alpha = 0.5;
		bg.scrollFactor.set();
		add(bg);
		
	}
	
	private function scaleUp(t:FlxTilemap):Void
	{
		t.scrollFactor.set();
		t.scale.set(mapZoom, mapZoom);
		t.x = mapOffsetX;
	}
	
	private function checkTilemapPos(t:FlxTilemap):Void
	{
		updatePos(t, "Floor");
	}
	
	private function checkWallPos(w:FlxTilemap):Void
	{
		updatePos(w, "Walls");
	}
	
	/**
	 * @param	t A FlxTilemap that'll get moved down the screen, and checked if it should be re-generated or shit
	 * @param	type A string, with what the layer name is called in the oel/oep, mostly used
	 * in the generateTilemap() function to keep _grpWalls and _grpTilemaps seperated. It should only be either "Walls" or "Floor"
	 */
	private function updatePos(t:FlxTilemap, type:String)
	{
		t.y += speed;
		
		// if the tilemap's y pos, is greater than the height(864) divided by 5(because of the zoom), 
		//then it moves it 2 tilemap's up
		if (t.y >= FlxG.height)
		{
			generateTilemap(t, type);
		}
	}
	
	private function generateTilemap(t:FlxTilemap, type:String):Void
	{	
		//basically, the tilemap actually needs to be removed entirely to be updated with a new _map/.oel file
		//to keep the _grpWalls/_grpTilemaps simple, it also has splice set to true
		//which also helps with the positioning shit i guess
		if (type == "Walls")
		{
			_grpWalls.remove(t, true);
		}
		if (type == "Floor")
		{
			_grpTilemaps.remove(t, true);
		}
		
		_map = new FlxOgmoLoader("assets/data/chunk" + FlxG.random.int(2, 9) + ".oel");
		t = _map.loadTilemap("assets/data/tile_temple_" + curTilemap + ".png", 16, 16, type);
		
		scaleUp(t);
		
		//if the type is "Walls", it simply adds the tilemap back in
		//if it's "Floor", then it also spawns some enemies, more info below
		var tilesOffset:Float = 2;
		if (type == "Walls")
		{
			t.y = _grpWalls.members[0].y - (t.height * tilesOffset);
			_grpWalls.add(t);
		}
		if (type == "Floor")
		{
			t.y = _grpTilemaps.members[0].y - (t.height * tilesOffset);
			_grpTilemaps.add(t);
		}
	}
}