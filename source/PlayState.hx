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
import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;
import flixel.ui.FlxButton;
import flixel.math.FlxMath;
import flixel.util.FlxColor;
import flixel.util.FlxSort;
import flixel.util.FlxTimer;
import io.newgrounds.NG;
import openfl.display.BlendMode;
using flixel.util.FlxSpriteUtil;

import com.newgrounds.*;
import com.newgrounds.components.*;

class PlayState extends FlxState
{
	private var speed:Float = 3;
	private var maxSpeed:Float = 9;
	
	private var _player:Player;
	private var playerYPosInit:Float = 0;
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
	
	private var _mWalls3:FlxTilemap;
	private var _mFloors3:FlxTilemap;
	
	private var _grpTilemaps:FlxTypedGroup<FlxTilemap>;
	private var _grpWalls:FlxTypedGroup<FlxTilemap>;
	
	private var _txtScore:FlxText;
	private var _txtHighScore:FlxText;
	private var score:Float;
	
	private var _camTarget:FlxSprite;

	override public function create():Void
	{
		FlxG.timeScale = SettingState.gameSpeed;
		
		//Set zoom on map
		FlxG.camera.zoom = 3;
		FlxG.camera.fade(FlxColor.WHITE, 0.24, true);
		
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
		
		//Camera
		_camTarget = new FlxSprite(_player.x, _player.y);
		_camTarget.makeGraphic(16, 16, FlxColor.TRANSPARENT);
		add(_camTarget);
		FlxG.camera.follow(_camTarget, FlxCameraFollowStyle.LOCKON);
		//sets the camTarget to be always 8 tiles ahead of the player
		_camTarget.y = _player.y - (16 * 4);
		//and 1.5 tiles to the right, so that the gameplay is offset to the left
		//_camTarget.x += 16 * 1.5;d
		initHUD();
		
		FlxG.worldBounds.set(0, -300, FlxG.width, FlxG.height * 2);
		
		#if flash
			FlxG.sound.playMusic(AssetPaths.Silverline__mp3, 0.7 * SettingState.musicVol);
		#else
			FlxG.sound.playMusic(AssetPaths.Silverline__ogg, 0.7 * SettingState.musicVol);
        #end
		
		super.create();
	}
	
	private var timesClickedOffScreen:Int = 0;
	
	override public function onFocusLost():Void 
	{
		timesClickedOffScreen += 1;
		
		if (timesClickedOffScreen >= 15)
		{
			trace("cheater!");
		}
		
		super.onFocusLost();
	}
	
	private function initTilemap():Void
	{
		//loads a new oel for the _map variable
		_map = new FlxOgmoLoader("assets/data/start.oel");
		_map.loadEntities(placeEntities, "Entities");
		
		_mFloors = _map.loadTilemap("assets/data/tile_temple_0.png", 16, 16, "Floor");
		_grpTilemaps.add(_mFloors);
		
		_mWalls = _map.loadTilemap("assets/data/tile_temple_0.png", 16, 16, "Walls");
		_grpWalls.add(_mWalls);
		
		//loads a new oel to use, this time one with seamless tops and bottoms
		_map = new FlxOgmoLoader("assets/data/1.oel");
		
		_mFloors2 = _map.loadTilemap("assets/data/tile_temple_0.png", 16, 16, "Floor");
		_mFloors2.y -= 16 * 12;
		_grpTilemaps.add(_mFloors2);
		
		_mWalls2 = _map.loadTilemap("assets/data/tile_temple_0.png", 16, 16, "Walls");
		_mWalls2.y -= 16 * 12;
		_grpWalls.add(_mWalls2);
		
		_mFloors3 = _map.loadTilemap("assets/data/tile_temple_0.png", 16, 16, "Floor");
		_mFloors3.y -= 16 * 12 * 2;
		_grpTilemaps.add(_mFloors3);
		
		_mWalls3 = _map.loadTilemap("assets/data/tile_temple_0.png", 16, 16, "Walls");
		_mWalls3.y -= 16 * 12 * 2;
		_grpWalls.add(_mWalls3);
		
	}
	
	private function initHUD():Void
	{
		score = 0;
		
		_txtScore = new FlxText(-18, 25, 0, "", 8);
		_txtScore.y = _player.y + 16 * 4;
		add(_txtScore);
		
		_txtHighScore = new FlxText(-18, 25, 0, "Current High Score: " + HighScore.score, 8);
		_txtHighScore.y = _player.y + 16 * 4.5;
		add(_txtHighScore);
	}
	
	private function placeEntities(entityName:String, entityData:Xml):Void
	{
		var x:Int = Std.parseInt(entityData.get("x"));
		var y:Int = Std.parseInt(entityData.get("y"));
		
		if (entityName == "player")
		{
			_player.x = x;
			_player.y = y;
			
			playerYPosInit = _player.y;
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

	private var speedAccel:Float = 1;
	private var startingTimer:Float = 4;
	
	private var godReached:Bool = false;
	
	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
		
		//FlxG.watch.add(_grpTilemaps, "members");
		//FlxG.watch.add(_player, "y");
		FlxG.watch.add(this, "speed");
		
		//if speed is greater than maxSpeed(15 as of writing), it lowers it to maxSpeed
		if (speed > maxSpeed)
		{
			speed = maxSpeed;
			#if (flash)
				var hornyMedal = NG.core.medals.get(54299);
				if (!hornyMedal.unlocked)
					hornyMedal.sendUnlock();
			#end
		}
		
		if (score >= 10000)
		{
			#if (flash)
				var hornyGodMedal = NG.core.medals.get(54300);
				if (!hornyGodMedal.unlocked)
					hornyGodMedal.sendUnlock();
			#end
		}
		
		//gives the player a few seconds before it starts to decrease the speed
		if (startingTimer > 0)
		{
			startingTimer -= FlxG.elapsed;
		}
		else
		{
			speed -= 0.5 / 60;
		}
		
		//if the players speed gets too low, it returns to MenuState
		//eventually this will be replaced with a small little sequence
		//of stuff rather than just jump straight to a game over style screen
		if (speed < 0.2 || _player.y > 247)
		{
			
			#if (flash)
				var board = NG.core.scoreBoards.get(8004);// ID found in NG project view
				
				// Posting a score thats OVER 9000!
				board.postScore(Std.int(score));
				
				
			#end
			
			if (score > HighScore.score)
			{
				HighScore.score = Std.int(score);
				HighScore.save();
			}
			
			HighScore.recentScore = Std.int(score);
			
			//Add score here
			//MenuState.hScore = score;
			FlxG.switchState(new MenuState());
		}
		
		if (_player.y > playerYPosInit)
		{
			_player.y -= 75 * FlxG.elapsed;
		}
		
		score += speed;
		_txtScore.text = "Distance: " + Std.int(score);
		
		//Runs every frame to move each tilemaps position, and also moves it up when appropriate.
		_grpTilemaps.forEach(checkTilemapPos);
		_grpWalls.forEach(checkWallPos);
		_grpEnemies.forEach(updateEnemyPos);
		//_grpDoors.forEach(checkOverlap);
		
		
		//Collision
		FlxG.collide(_player, _grpWalls);
	}
	
	private function updateEnemyPos(e:Enemy):Void
	{
		//also check if overlapping player in this func uh oh lol
		
		if (FlxG.collide(e, _grpWalls) || FlxG.collide(e, _grpEnemies))
		{
			e.kill();
		}
		
		if (e.ID == 1)
		{
			boost(e);
		}
		
		if (FlxG.overlap(_player, e))
		{
			//if the MashState's outcome is VICTORY(from a battle)
			//it kills the enemy, and increases your speed
			//and changes the outcome to NONE so that its not constantly increasing the speed
			if (MashState.outcome != MashState.Outcome.NONE)
			{
				boost(e);
			}
			else
			{
				//if the state isnt VICTORY, then it opens a new battle
				e.ID = 1;
				openSubState(new MashState(0x77000000, e.etype));
			}
		}
		
		//ok heres the real shit
		e.y += speed;
		
		//if an enemy is below the camera's lower bounds, then it fuccin dies
		if (e.y > FlxG.height / FlxG.camera.zoom)
		{
			_grpEnemies.remove(e, true);
		}
	}
	
	private function boost(e:Enemy):Void
	{
		//Varies speed consistency based on victory
		if (MashState.outcome == MashState.Outcome.VICTORY)
		{
			speed += FlxG.random.float(0.8, 1.2);
			//}else if (MashState.outcome == MashState.Outcome.DEFEAT){
			//speed += FlxG.random.float(0.8, 1.3);
		}
		else if (MashState.outcome != MashState.Outcome.VICTORY)
		{
			speed -= FlxG.random.float(2.4, 3.2);
		}
		//speed += MashState.horniness;
		
		e.ID = 0;
		e.kill();
		MashState.outcome = MashState.Outcome.NONE;
		//MashState.horniness = 0;
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
	 * 
	 * @param	t A FlxTilemap that'll get moved down the screen, and checked if it should be re-generated or shit
	 * @param	type A string, with what the layer name is called in the oel/oep, mostly used
	 * in the generateTilemap() function to keep _grpWalls and _grpTilemaps seperated. It should only be either "Walls" or "Floor"
	 */
	private function updatePos(t:FlxTilemap, type:String)
	{
		t.y += speed;
		
		// if the tilemap's y pos, is greater than the height(864) divided by 5(because of the zoom), 
		//then it moves it 2 tilemap's up
		if (t.y >= t.height + 16 * 4)
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
		
		_map = new FlxOgmoLoader("assets/data/" + FlxG.random.int(1, 9) + ".oel");

		
		//loads the _map data to the current tilemap(t) up to 40k
		if (score > 49750)
			t = _map.loadTilemap("assets/data/tile_temple_0.png", 16, 16, type);
		else if (score > 44750)
			t = _map.loadTilemap("assets/data/tile_temple_4.png", 16, 16, type);
		else if (score > 39750)
			t = _map.loadTilemap("assets/data/tile_temple_3.png", 16, 16, type);
		else if (score > 34750)
			t = _map.loadTilemap("assets/data/tile_temple_2.png", 16, 16, type);
		else if (score > 29750)
			t = _map.loadTilemap("assets/data/tile_temple_1.png", 16, 16, type);
		else if (score > 24750)
			t = _map.loadTilemap("assets/data/tile_temple_0.png", 16, 16, type);
		else if (score > 19750)
			t = _map.loadTilemap("assets/data/tile_temple_4.png", 16, 16, type);
		else if (score > 14750)
			t = _map.loadTilemap("assets/data/tile_temple_3.png", 16, 16, type);
		else if (score > 9750)
			t = _map.loadTilemap("assets/data/tile_temple_2.png", 16, 16, type);
		else if (score > 4750)
			t = _map.loadTilemap("assets/data/tile_temple_1.png", 16, 16, type);
		else
			t = _map.loadTilemap("assets/data/tile_temple_0.png", 16, 16, type);
		
		
		
		//if the type is "Walls", it simply adds the tilemap back in
		//if it's "Floor", then it also spawns some enemies, more info below
		if (type == "Walls")
		{
			t.y = _grpWalls.members[0].y - t.height * 2;
			_grpWalls.add(t);
		}
		if (type == "Floor")
		{
			t.y = _grpTilemaps.members[0].y - t.height * 2;
			_grpTilemaps.add(t);
			
			//also spawns enemy
			//picks a random amount of enemies from 0-3
			var enemyAmount:Int = FlxG.random.int(1, 3);
			var enemyType:Int = FlxG.random.int(1, 2);
			//loops 
			while (enemyAmount > 0)
			{
				_grpEnemies.add(new Enemy(t.x + (16 * FlxG.random.int(2, 6)), t.y + (16 * FlxG.random.int(-12, 12)), FlxG.random.int(0, 2)));
				
				enemyAmount -= 1;
			}
			
		}
	}
	
	
/*
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
	}*/
}