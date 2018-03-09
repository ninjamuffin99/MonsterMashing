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
import com.newgrounds.*;
import com.newgrounds.components.*;
import flixel.util.FlxTimer;
/*
import io.newgrounds.NG;
import io.newgrounds.objects.Medal;
import io.newgrounds.objects.ScoreBoard;
*/
class MenuState extends FlxState
{
	private var mScore:FlxText;
	
	private var debugInfo:FlxText;
	private var currentVersion:String = "v1.1.0";
	
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
	
	#if flash
	private var menuItems:Array<String> = ["Play", "Credits", "Hall of Shame"];
	private var ad:ScoreBrowser = new ScoreBrowser();
	#else
	private var menuItems:Array<String> = ["Play", "Credits"];
	#end
	
	private var selected:Int = 0;
	private var selMax:Int = 0;//gets set later
	
	private var mapZoom:Float = 5;
	private var mapOffsetX:Float = -86;
	
	override public function create():Void
	{
		FlxG.save.bind("File");
		HighScore.load();
		
		FlxG.mouse.visible = false;
		
		FlxG.camera.fade(FlxColor.BLACK, 0.8, true);
		
		initTilemap();
		initImages();
		initText();
		
		FlxTween.tween(mScore, {y: mScore.y + 24}, 0.86, {type:FlxTween.PINGPONG, ease:FlxEase.quadInOut});
		FlxTween.tween(sprMashing, {y: sprMashing.y + 20}, 1.2, {type:FlxTween.PINGPONG, ease:FlxEase.quadInOut});
		FlxTween.tween(sprMonster.scale, {y: sprMonster.scale.y * 1.07, x: sprMonster.scale.x * 1.075}, 1.2, {type:FlxTween.PINGPONG, ease:FlxEase.quadInOut});
		
		super.create();
		
		//new FlxTimer().start(1, finTim);
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
		add(sprMonster);
		
		sprMashing = new FlxSprite(0, 160).loadGraphic(AssetPaths.mashing__png, false, 319, 62);
		sprMashing.screenCenter(X);
		add(sprMashing);
	}
	
	private function initText():Void
	{
		_grpMenu = new FlxTypedGroup<FlxText>();
		add(_grpMenu);
		
		selMax = menuItems.length - 1;
		
		for (i in 0...menuItems.length)
		{
			var text:FlxText = new FlxText(0, (i * 36) + 370, 0, menuItems[i], 32);
			text.screenCenter(X);
			_grpMenu.add(text);
		}
		
		mScore = new FlxText(0, FlxG.height / 2 + 110, 0, "High Score: " + HighScore.score, 32);
		mScore.screenCenter(X);
		add(mScore);
		
		if (HighScore.recentScore > 0)
		{
			mScore.text += "\nRecent Score: " + HighScore.recentScore;
		}
		
		#if (flash)
			if (API.isNewgrounds)
			{
				ad.x = (FlxG.width / 2) - (ad.width/2);
				ad.y = (FlxG.height / 2.5) - (ad.height/2);
				FlxG.stage.addChild(ad);
				toggleScores();
			}
		#end
		
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
	
	private function finTim(t:FlxTimer):Void
	{
		var Ng:NGio = new NGio();
		Ng.initNG(FlxG.stage);
	}
	
	override public function update(elapsed:Float):Void
	{
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
		
		#if flash
		if (API.isNewgrounds)
		{
			if (ad.visible && FlxG.keys.justPressed.ANY)
			{
				ripScoreboard();
			}
		}
		#end
		
		if (selected > selMax)
			selected = 0;
		if (selected < 0)
			selected = selMax;
		
		if (FlxG.keys.anyJustPressed(["ENTER", "SPACE", "Z", "X"]))
		{
			switch (selected) 
			{
				case 0:
					FlxG.switchState(new PlayState());
				case 1:
					FlxG.switchState(new CredState());
				case 2:
					toggleScores();
				default:
					
			}
		}
	}
	
	private function toggleScores():Void
	{
		#if flash
		if (API.isNewgrounds)
		{
			FlxG.mouse.visible = true;
			ad.visible = !ad.visible;
		}
		else
		{
			FlxG.openURL("https://www.newgrounds.com/portal/view/707498");
		}
		#end
	}
	
	private function ripScoreboard():Void
	{
		#if flash
		if (API.isNewgrounds)
		{
			FlxG.mouse.visible = false;
			ad.visible = false;
		}
		#end
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
		
		_map = new FlxOgmoLoader("assets/data/" + FlxG.random.int(2, 9) + ".oel");
		
		t = _map.loadTilemap("assets/data/tile_temple_0.png", 16, 16, type);
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