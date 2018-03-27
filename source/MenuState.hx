package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.addons.editors.ogmo.FlxOgmoLoader;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.text.FlxText;
import flixel.tile.FlxTilemap;
import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;
import flixel.ui.FlxButton;
import flixel.math.FlxMath;
import flixel.ui.FlxSpriteButton;
import flixel.util.FlxColor;
import flixel.util.FlxTimer;
import io.newgrounds.NG;

/*
import io.newgrounds.objects.Medal;
import io.newgrounds.objects.ScoreBoard;
*/
class MenuState extends FlxState
{
	private var mScore:FlxText;
	
	private var debugInfo:FlxText;
	private var currentVersion:String = "v1.1.1";
	
	private var sprMonster:FlxSprite;
	private var sprMashing:FlxSprite;
	private var bg:FlxSprite;
	
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
	
	private var _grpMenu:FlxTypedGroup<FlxText>;
	private var _grpMenuBar:FlxTypedGroup<FlxSprite>;
	
	private var menuItems:Array<String> = ["Play", "Credits", "Hall of Shame", "Settings"];
	private var leadItems:Array<String>;
	
	private var selected:Int = 0;
	private var selector:FlxSprite;
	private var selMax:Int = 0;//gets set later
	
	private var mapZoom:Float = 5;
	private var mapOffsetX:Float = -86;
	
	//private var votingLink:String = "https://www.newgrounds.com/bbs/topic/1430563";
	
	override public function create():Void
	{
		FlxG.timeScale = 1;
		
		FlxG.save.bind("File");
		HighScore.load();
		
		FlxG.mouse.visible = false;
		
		FlxG.camera.fade(FlxColor.BLACK, 0.8, true);
		
		initTilemap();
		initImages();
		initText();
		
		var tempBg:FlxSprite = new FlxSprite().loadGraphic(AssetPaths.menuMockup__png, false, 544, 816);
		//add(tempBg);
		
		FlxTween.tween(mScore, {y: mScore.y + 24}, 0.86, {type:FlxTween.PINGPONG, ease:FlxEase.quadInOut});
		FlxTween.tween(sprMashing, {y: sprMashing.y + 20}, 1.2, {type:FlxTween.PINGPONG, ease:FlxEase.quadInOut});
		FlxTween.tween(sprMonster.scale, {y: sprMonster.scale.y * 1.07, x: sprMonster.scale.x * 1.075}, 1.2 * 0.75, {type:FlxTween.PINGPONG, ease:FlxEase.quadInOut});
			
		super.create();
	}
	
	private function initTilemap():Void
	{
		_grpTilemaps = new FlxTypedGroup<FlxTilemap>();
		add(_grpTilemaps);
		
		_grpWalls = new FlxTypedGroup<FlxTilemap>();
		add(_grpWalls);
		
		var scaleFixin:Float = 12 * mapZoom;
		
		//loads a new oel for the _map variable
		_map = new FlxOgmoLoader("assets/data/start.oel");
		
		_mFloors = _map.loadTilemap("assets/data/tile_temple_0.png", 16, 16, "Floor");
		_grpTilemaps.add(_mFloors);
		
		_mWalls = _map.loadTilemap("assets/data/tile_temple_0.png", 16, 16, "Walls");
		_grpWalls.add(_mWalls);
		
		//loads a new oel for the _map variable
		_map = new FlxOgmoLoader("assets/data/7.oel");
		
		_mFloors2 = _map.loadTilemap("assets/data/tile_temple_0.png", 16, 16, "Floor");
		_mFloors2.y -= 16 * scaleFixin;
		_grpTilemaps.add(_mFloors2);
		
		_mWalls2 = _map.loadTilemap("assets/data/tile_temple_0.png", 16, 16, "Walls");
		_mWalls2.y -= 16 * scaleFixin;
		_grpWalls.add(_mWalls2);
		
		_mFloors3 = _map.loadTilemap("assets/data/tile_temple_0.png", 16, 16, "Floor");
		_mFloors3.y -= 16 * scaleFixin * 2;
		_grpTilemaps.add(_mFloors3);
		
		_mWalls3 = _map.loadTilemap("assets/data/tile_temple_0.png", 16, 16, "Walls");
		_mWalls3.y -= 16 * scaleFixin * 2;
		_grpWalls.add(_mWalls3);
		
		_grpTilemaps.forEach(scaleUp);
		_grpWalls.forEach(scaleUp);
	}
	
	private function initImages():Void
	{
		bg = new FlxSprite().makeGraphic(FlxG.width, FlxG.height, FlxColor.BLACK);
		bg.alpha = 0.4;
		add(bg);
		
		sprMonster = new FlxSprite(0, 30).loadGraphic(AssetPaths.monster__png, false, 492, 166);
		sprMonster.screenCenter(X);
				
		sprMashing = new FlxSprite(0, 150).loadGraphic(AssetPaths.mashing__png, false, 319, 62);
		sprMashing.screenCenter(X);
		
		//April Fools Code
		if (SettingState.aprilFools == 1){
			sprMonster.loadGraphic(AssetPaths.aprilfools__png, false, 492, 166);
			sprMashing.loadGraphic(AssetPaths.edition__png, false, 319, 62);
		}
		
		add(sprMashing);
		add(sprMonster);
	}
	
	
	private function initText():Void
	{
		_grpMenuBar = new FlxTypedGroup<FlxSprite>();
		add(_grpMenuBar);
		
		selector = new FlxSprite(0, 315);
		selector.makeGraphic(FlxG.width, 36, FlxColor.MAGENTA);
		//add(selector);
		//resetBarFill();		
		
		_grpMenu = new FlxTypedGroup<FlxText>();
		add(_grpMenu);
		
		selMax = menuItems.length - 1;
		
		for (i in 0...menuItems.length)
		{
			/*
			var whiteBar:FlxSprite = new FlxSprite(0, (i * 54) + 315);
			whiteBar.makeGraphic(FlxG.width, 36);
			_grpMenuBar.add(whiteBar);
			*/
			
			var text:FlxText = new FlxText(0, (i * 54) + 320, 0, menuItems[i], 32);
			text.color = FlxColor.BLACK;
			text.screenCenter(X);
			_grpMenu.add(text);
		}
		
		if (FlxG.onMobile)
		{
			mScore = new FlxText(0, FlxG.height / 2 + 210, 0, "", 40);
		}
		else
		{
			mScore = new FlxText(0, FlxG.height / 2 + 180, 0, "", 32);	
		}
		mScore.text = "High Score: " + HighScore.score + "\nTotal Score: " + HighScore.totalScore;
		mScore.alignment = FlxTextAlign.CENTER;
		mScore.screenCenter(X);
		add(mScore);
			
		if (HighScore.recentScore > 0)
		{
			mScore.text += "\nRecent Score: " + HighScore.recentScore;
		}
		
		//What device are you on?
		debugInfo = new FlxText(8, FlxG.height - 20, 0, currentVersion, 16);
		add(debugInfo);
		
		#if flash
			debugInfo.text += " Flash Version";
		#elseif html5
			debugInfo.text += " HTML5 Version ";
			debugInfo.text += "(" + Std.string(FlxG.html5.platform) + " " +  Std.string(FlxG.html5.browser) + ")";
			
			if (FlxG.html5.onMobile)
			{
				debugInfo.text += "mobile";
			}
			
		#end
	}
	
	private function scaleUp(t:FlxTilemap):Void
	{
		t.scale.set(mapZoom, mapZoom);
		t.x = mapOffsetX;
	}
	
	override public function update(elapsed:Float):Void
	{
		if (FlxG.keys.justPressed.T)
		{
			FlxG.switchState(new SettingState());
		}
		
		menuHandling();
		
		#if html5
			if (FlxG.html5.onMobile)
			{
				for (touch in FlxG.touches.list)
				{
					if (touch.justPressed) 
					{
						if (touch.overlaps(_grpMenu.members[0]))
						{
							FlxG.switchState(new PlayState());
						}
						if (touch.overlaps(_grpMenu.members[1]))
						{
							FlxG.switchState(new CredState());
						}
						if (touch.overlaps(_grpMenu.members[2]))
						{
							openSubState(new ScoreState(0xCC000000));
						}
						if (touch.overlaps(_grpMenu.members[3]))
						{
							FlxG.switchState(new SettingState());
						}
					}
				}
			}
		#end
		
		_grpTilemaps.forEach(checkTilemapPos);
		_grpWalls.forEach(checkWallPos);
		
		super.update(elapsed);
	}
	
	private function menuHandling():Void
	{
		
		for (i in 0..._grpMenu.members.length)
		{
			_grpMenu.members[i].color = FlxColor.WHITE;
		}
		
		_grpMenu.members[selected].color = FlxColor.YELLOW;
		
		if (FlxG.keys.anyJustPressed(["W", "UP", "I"]))
		{
			selected -= 1;
		}
		if (FlxG.keys.anyJustPressed(["S", "DOWN", "K"]))
		{
			selected += 1;
		}
		
		FlxG.watch.addQuick("selected 1: ", selected);
		
		
		if (selected > _grpMenu.members.length - 1)
			selected = 0;
		if (selected < 0)
			selected = _grpMenu.members.length - 1;
		
		FlxG.watch.addQuick("selected 2: ", selected);
		
		/* Change this so it only chekcs if up or down keys get pressed
		if (FlxG.keys.justPressed.ANY)
		{
			resetBarFill();
		}
		*/
		
		if (FlxG.keys.anyJustPressed(["ENTER", "Z", "SPACE"]))
		{
			switch (selected) 
			{
				case 0:
					FlxG.switchState(new PlayState());
				case 1:
					FlxG.switchState(new CredState());
				case 2:
					openSubState(new ScoreState(0xCC000000));
				case 3:
					FlxG.switchState(new SettingState());
				default:
			}
		}
	}

	
	private function resetBarFill():Void
	{
		selector.y = (selected * 54) + 315;
		selector.x = -selector.width;
		FlxTween.tween(selector, {x: 0}, 0.35, {ease:FlxEase.quartOut});
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
		
		_map = new FlxOgmoLoader("assets/data/" + FlxG.random.int(2, 10) + ".oel");
		//t = _map.loadTilemap("assets/data/tile_temple_0.png", 16, 16, type);
		
		//loads the _map data to the current tilemap(t) up to 40k from current score
		/*
		if (HighScore.score > 49750)
			t = _map.loadTilemap("assets/data/tile_temple_0.png", 16, 16, type);
		else if (HighScore.score > 44750)
			t = _map.loadTilemap("assets/data/tile_temple_4.png", 16, 16, type);
		else if (HighScore.score > 39750)
			t = _map.loadTilemap("assets/data/tile_temple_3.png", 16, 16, type);
		else if (HighScore.score > 34750)
			t = _map.loadTilemap("assets/data/tile_temple_2.png", 16, 16, type);
		else if (HighScore.score > 29750)
			t = _map.loadTilemap("assets/data/tile_temple_1.png", 16, 16, type);
		else if (HighScore.score > 24750)
			t = _map.loadTilemap("assets/data/tile_temple_0.png", 16, 16, type);
		else if (HighScore.score > 19750)
			t = _map.loadTilemap("assets/data/tile_temple_4.png", 16, 16, type);
		else if (HighScore.score > 14750)
			t = _map.loadTilemap("assets/data/tile_temple_3.png", 16, 16, type);
		else if (HighScore.score > 9750)
			t = _map.loadTilemap("assets/data/tile_temple_2.png", 16, 16, type);
		else if (HighScore.score > 4750)
			t = _map.loadTilemap("assets/data/tile_temple_1.png", 16, 16, type);
		else
			t = _map.loadTilemap("assets/data/tile_temple_0.png", 16, 16, type);
		*/
		
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