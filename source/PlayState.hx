package;

import flixel.FlxBasic;
import flixel.FlxCamera.FlxCameraFollowStyle;
import flixel.FlxG;
import flixel.FlxObject;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.addons.editors.ogmo.FlxOgmoLoader;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.group.FlxSpriteGroup.FlxTypedSpriteGroup;
import flixel.text.FlxText;
import flixel.tile.FlxTilemap;
import flixel.util.FlxColor;
import io.newgrounds.NG;
#if steam
import steamwrap.api.Steam;
#end
using flixel.util.FlxSpriteUtil;

class PlayState extends FlxState
{
	/**
	 * The speed variable, which controls how fast or slow things are when 
	 * they come down the screen
	 */
	private var speed:Float = 3;
	
	 */
	
	// where he starts on the screen, gets set when the tilemap data is loaded so this 0 means nothin
	private var playerYPosInit:Float = 0;
	// dunno if this enemy does anything but i dont wanna delete it just incase lol
	public var _enemy:Enemy;
	
	// the main entities group, just holds the player and the enemies
	private var _grpEntities:FlxTypedGroup<FlxObject>;
	private var _grpEnemies:FlxTypedSpriteGroup<Enemy>;
	
	//MAP SHIT
	/**
	 * The map data, loaded from Ogmo
	 */
	private var _map:FlxOgmoLoader;
	
	// There are 3 tilemaps that get looped around and regenerated to create an infinite runner effect.
	// Instead of creating new tilemaps everytime you need one 
	
	private var _mWalls:FlxTilemap;
	private var _mFloors:FlxTilemap;
	//The second group of tilemaps
	private var _mWalls2:FlxTilemap;
	private var _mFloors2:FlxTilemap;
	
	private var _mWalls3:FlxTilemap;
	private var _mFloors3:FlxTilemap;
	
	private var _grpTilemaps:FlxTypedGroup<FlxTilemap>;
	private var _grpWalls:FlxTypedGroup<FlxTilemap>;
	
	// some HUD elements
	private var _txtScore:FlxText;
	private var _txtHighScore:FlxText;
	private var score:Float;
	
	private var _camTarget:FlxSprite;
	
	// Black overlay, isnt actually used as of writing lol
	public var bg:FlxSprite;
	
	// dunno if this speedAccel does anything lol
	private var speedAccel:Float = 1;
	// how long until the player's speed starts slowing down
	private var startingTimer:Float = 4;
	
	
	override public function create():Void
	{
		//FlxG.timeScale = SettingSubstate.gameSpeed;
		FlxG.log.redirectTraces = true;
		
		//Set zoom on map, 3x relative to whatever the zoom set in Main.hx was
		FlxG.camera.zoom = 3 * FlxG.initialZoom;
		// Does a fade isntead if a flash so that it's a hard white immediately, rather than fading to white then fading out quickly
		FlxG.camera.fade(FlxColor.WHITE, 0.24, true);
		
		//Who needs a mouse when you have Z
		#if !mobile
			FlxG.mouse.visible = false;
		#end
			
		//Init BG Transparency
		// This was a semi transparent black bg when you were wackin the monster girls, but brandy thought it looked stinky
		// or it was just flat out busted
		bg = new FlxSprite().makeGraphic(FlxG.width, FlxG.height, FlxColor.BLACK);
		bg.alpha = 0.4;
		
		// The tilemap group for the floors, set so you don't have any collisions with them
		_grpTilemaps = new FlxTypedGroup<FlxTilemap>();
		add(_grpTilemaps);
		
		// The tilemap group for the walls and maybe rocks? You can collide with these
		_grpWalls = new FlxTypedGroup<FlxTilemap>();
		add(_grpWalls);
		
		// The object group for entities. Would probably be more useful if this was an RPG like planned, or if we had different objects
		// Includes the Enemies and the player
		_grpEntities = new FlxTypedGroup<FlxObject>();
		add(_grpEntities);
		
		// Enemy group so that we know specifics about Enemy type and thats basically it lol.
		_grpEnemies = new FlxTypedSpriteGroup<Enemy>();
		_grpEntities.add(_grpEnemies);
		
		_player = new Player();
		_grpEntities.add(_player);
		
		initTilemap();
		
		//Camera stuff
		// first makes a camera target that centers on the player's initial position. 
		// Again this would be more useful if it was more than a simple infinite runner lol
		_camTarget = new FlxSprite(_player.x, _player.y);
		_camTarget.makeGraphic(16, 16, FlxColor.TRANSPARENT);
		add(_camTarget);
		FlxG.camera.follow(_camTarget, FlxCameraFollowStyle.LOCKON);
		//sets the camTarget to be always 8 tiles ahead of the player
		_camTarget.y = _player.y - (16 * 4);
		//and 1.5 tiles to the right, so that the gameplay is offset to the left
		// (maybe we thought this was a good idea if we were to add items that showed up on the right, but we didnt so its commented out lol)
		//_camTarget.x += 16 * 1.5;
		
		initHUD();
		
		FlxG.worldBounds.set(0, -300, FlxG.width, FlxG.height * 2);
		
		// Some shit that runs if you're playing on the flash target, if not, it plays the OGG version of the song

		FlxG.sound.playMusic("assets/music/Silverline." + MenuState.soundEXT, 0.7 * SettingSubstate.musicVol * SettingSubstate.masterVol);

		
		// makesit so that every item in this FlxState's little display list thing, only shows on the main gameplay camera, not the mashstate camera
		forEach(function(b:FlxBasic){b.cameras = [FlxG.camera]; });
		
		super.create();
	}
	
	private var timesClickedOffScreen:Int = 0;
	
	override public function onFocusLost():Void 
	{
		// This function runs everytime focus is lost on the game, causing a pause.
		// This shit tracks how many times it's happened and if it's over 15, it logs "cheater!" in the console
		// because it's like pause buffering or whatever. Has no game effect however.
		
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
		
		// loads the "Floor" and "Walls" layers from the Ogmo tilemap as seperate things (_mFloors and _mWalls)
		// I think that was to do collisions a bit easier
		_mFloors = _map.loadTilemap("assets/data/tile_temple_0.png", 16, 16, "Floor");
		_grpTilemaps.add(_mFloors);
		
		_mWalls = _map.loadTilemap("assets/data/tile_temple_0.png", 16, 16, "Walls");
		_grpWalls.add(_mWalls);
		
		//loads a new oel to use, this time one with seamless tops and bottoms
		_map = new FlxOgmoLoader("assets/data/chunk1.oel");
		
		// this bit below loads 2 more tilemap chunks, each being moved up 12 tiles further than the last
		
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
	
	/**
	 * initHud
	 * Initializes the score variable i think
	 * and inits and sets up hud elements and positions
	 */
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
	
	/**
	 *	This function is called when the OGMO map is setup, and the data is all parsed in or whatever.
	 * It's used to place the entities, duh. Pretty much just used for the player position though.
	 * Also pretty much stolen from the TurnBasedRPG demo on the HaxeFlixel site LOLOLOL
	 * 
	 * @param	entityName	the name lol
	 * @param	entityData	the xml data
	 */
	private function placeEntities(entityName:String, entityData:Xml):Void
	{
		// gets the position data from the xml shit
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
	}


	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
		
		#if steam
			Steam.onEnterFrame();
		#end
		
		if (FlxG.keys.anyJustPressed(["ENTER", "ESCAPE"]))
			openSubState(new PauseSubstate());
		
		
		var gamepad = FlxG.gamepads.lastActive;
		if (gamepad != null)
		{
			if (gamepad.justPressed.START)
			{
				openSubState(new PauseSubstate());
			}
		}
		
		//if speed is greater than maxSpeed(15 as of writing), it lowers it to maxSpeed
		if (speed > maxSpeed)
		{
			speed = maxSpeed;
			#if steam
				if (Steam.active && Steam.getAchievement("HORNY_AF"))
				{
					Steam.setAchievement("HORNY_AF");
				}
			#end 
			// if logged into the Newgrounds API, it unlocks the Peak horny medal
			if (NGio.isLoggedIn)
			{
				var hornyMedal = NG.core.medals.get(54299);
				if (!hornyMedal.unlocked)
					hornyMedal.sendUnlock();
			}
		}
		
		#if debug
		if (FlxG.keys.justPressed.UP && FlxG.keys.pressed.B)
		{
			score += 2500;
		}
		#end
		if (score >= 10000)
		{
			#if steam
				if (Steam.active && !Steam.getAchievement("Horny_God"))
				{
					Steam.setAchievement("Horny_God");
				}
			#end 
			if (NGio.isLoggedIn)
			{
				var hornyGodMedal = NG.core.medals.get(54300);
				if (!hornyGodMedal.unlocked)
					hornyGodMedal.sendUnlock();
			}
		}
		
		//gives the player a few seconds at the start of the game before it starts to decrease the speed
		if (startingTimer > 0)
		{
			startingTimer -= FlxG.elapsed;
		}
		else
		{
			// speed decreases by 0.5 every second, FlxG.elapsed is 1 frame in seconds (like 0.0166 seconds or whatever)
			// so u know do fukken math this shit is a being run every frame blah blah blah
			speed -= 0.5 * FlxG.elapsed;
		}
		
		//if the players speed gets too low, it returns to MenuState
		//eventually this will be replaced with a small little sequence
		//of stuff rather than just jump straight to a game over style screen
		// LOL no it wont i wrote this shit like back in March lmao November 2018 gang where yall at
		if (speed < 0.2 || _player.y > 247)
		{
			/*
			if (speed < 0.2)
			{
				NG.core.calls.event.logEvent("SlowDeath").send();
			}
			else
				NG.core.calls.event.logEvent("FallDeath").send();
			*/
				
			// if logged into the Newgrounds API, it posts your score to the scoreboard
			if (NGio.isLoggedIn)
			{
				var board = NG.core.scoreBoards.get(8004);// ID found in NG project view
				board.postScore(Std.int(score));
			}
			
			#if steam
				if (Steam.active)
				{
					var steamBoard:LeaderboardScore = new LeaderboardScore("Distance", "Distance", Std.int(score), 0, -1);
					Steam.uploadLeaderboardScore(steamBoard);
					
					Steam.setAchievement("NEW_ACHIEVEMENT_1_0");
				}
			#end
			
			if (score > HighScore.score)
			{
				HighScore.score = Std.int(score);
			}
			
			// updates the scores, so on the menu its current and shit
			HighScore.recentScore = Std.int(score);
			HighScore.totalScore += Std.int(score);
			
			// Saves the scores to the current savefile
			HighScore.save();
			
			// Go to the main menu like a dumbass lmao fukken idiot i bet ur not even in Hall Of Shame	
			FlxG.switchState(new MenuState());
		}
		
		// if the player is beneath the sorta baseline (playerYPosInit) then he moves back up
		// say if he gets pushed down by a rock or whatever.
		if (_player.y > playerYPosInit)
		{
			_player.y -= 75 * FlxG.elapsed;
		}
		
		// score increments every frame by the speed variable also the HUD is updated
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
		
		// if the state of the enemy is 1 (set a little bit below) it goes through a boost check to see if the player won or lost
		// the mashstate.
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
				
				
				// at most, you can have an 80% chance to see tiddy i think
				var scoreMax:Float = 40000;
				
				if (score * 1.2 > scoreMax)
				{
					scoreMax = score * 1.2;
				}
				
				var randomNude:Bool = FlxG.random.bool((score / scoreMax) * 100);
				openSubState(new MashState(FlxColor.TRANSPARENT, e.etype, randomNude));
			}
		}
		
		// adds the speed variable to the enemy's y position, moving it down rather than moving the player up
		e.y += speed;
		
		//if an enemy is below the camera's lower bounds, then it fuccin dies
		if (e.y > FlxG.height / (FlxG.camera.zoom / FlxG.initialZoom))
		{
			_grpEnemies.remove(e, true);
		}
	}
	
	/**
	 * A function that checks whether the player should boost
	 * or whether the player should slow down after a fight
	 * 
	 * @param	e	the enemy
	 */
	private function boost(e:Enemy):Void
	{
		// If you won, you get a boost
		// else, you slow down a bit
		if (MashState.outcome == MashState.Outcome.VICTORY)
		{
			speed += FlxG.random.float(1.0, 1.2);
			trace("speed up");
			remove(bg);
		}
		else if (MashState.outcome != MashState.Outcome.VICTORY)
		{
			speed -= FlxG.random.float(0.2, 0.3);
			trace("slowed down");
			remove(bg);
		}
		// old bit of code that varied the speed depending on how fast you beat the girls
		//speed += MashState.horniness;
		
		// sets the ID back to 0, and then kills it and sets the outcome back to NONE
		e.ID = 0;
		e.kill();
		MashState.outcome = MashState.Outcome.NONE;
		//MashState.horniness = 0;
	}
	
	// These 2 functions are essentially the same, but pass though different variables to seperate the layers
	// I should make this one variable but eh whatever
	
	private function checkTilemapPos(t:FlxTilemap):Void
	{
		updatePos(t, "Floor");
	}
	
	private function checkWallPos(w:FlxTilemap):Void
	{
		updatePos(w, "Walls");
	}
	
	/**
	 * Moves the tilemap down the screen, and then moves it 2 tilemaps up and loops around or whatever
	 * 
	 * @param	t A FlxTilemap that'll get moved down the screen, and checked if it should be re-generated or shit
	 * @param	type A string, with what the layer name is called in the oel/oep, mostly used
	 * in the generateTilemap() function to keep _grpWalls and _grpTilemaps seperated. It should only be either "Walls" or "Floor"
	 */
	private function updatePos(t:FlxTilemap, type:String)
	{
		t.y += speed;
		
		// if the tilemap's y pos is greater than the tilemaps height + 4 tiles (to be safe I guess)
		//then it moves it 2 tilemap's up
		if (t.y >= t.height + 16 * 4)
		{
			generateTilemap(t, type);
		}
	}
	
	/**
	 * Regenerates the tilemap data, moves it up above the other tilemaps, and adds it to the scene
	 * also spawns monster girls
	 * 
	 * @param	t	Which tilemap to regenerate
	 * @param	type	Which type (either Wall or Floor)
	 */
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
		
		// randomly load a new tilemap chunk to the ogmo loader
		_map = new FlxOgmoLoader("assets/data/chunk" + FlxG.random.int(1, 9) + ".oel");
		
		// did some fancy ass math to get a value between 0 and 4 through the score
		// so that it will constantly change the tilemap forever
		var scoreRatio = Math.floor((score + 250) / 5000);
		var scoreMod = scoreRatio % 5;
		
		t = _map.loadTilemap("assets/data/tile_temple_" + scoreMod + ".png", 16, 16, type);
		
		
		//if the type is "Walls", it simply adds the tilemap back in
		//if it's "Floor", then it also spawns some enemies, more info below
		if (type == "Walls")
		{
			// moves it to the tilemap in the first position in the members array, then moves it up a bit more
			// I think there was issues with the seam when it wasnt t.height * 2, maybe some bullshit hitbox shenanigans
			t.y = _grpWalls.members[0].y - t.height * 2;
			_grpWalls.add(t);
		}
		if (type == "Floor")
		{
			// same shit as like 5 lines above see that comment
			t.y = _grpTilemaps.members[0].y - t.height * 2;
			_grpTilemaps.add(t);
			
			//also spawns enemy
			//picks a random amount of enemies from 0-3
			var enemyAmount:Int = FlxG.random.int(1, 3);
			var posArray:Array<Dynamic> = [[-1, -1]];
			//loops in a single frame as long as the enemyAmount variable is higher than 0
			while (enemyAmount > 0)
			{
				// adds an enemy at a somewhat random position on this tilemap
				// also picks a random girl
				var randomX = 16 * FlxG.random.int(2, 6);
				var randomY = 16 * FlxG.random.int( -11, 11);
				
				for (i in 0...posArray.length)
				{
					while (randomX == posArray[i][0] && randomY == posArray[i][1])
					{
						randomX = 16 * FlxG.random.int(2, 6);
						randomY = 16 * FlxG.random.int( -12, 12);
						FlxG.log.add("NEW POSITION");
					}
					
				}
				
				posArray.push([randomX, randomY]);
				_grpEnemies.add(new Enemy(t.x + randomX, t.y + randomY, FlxG.random.int(0, 6)));
				
				// decrease the enemyAmount variable so the while loop doesnt freeze the game lol
				enemyAmount -= 1;
			}
		}
	}	
}