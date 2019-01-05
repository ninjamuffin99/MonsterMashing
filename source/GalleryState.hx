package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.group.FlxSpriteGroup;
import flixel.math.FlxAngle;
import flixel.math.FlxMath;
import flixel.math.FlxPoint;
import flixel.math.FlxVector;
import flixel.text.FlxText;
import flixel.ui.FlxSpriteButton;

/**
 * ...
 * @author 
 */
class GalleryState extends BaseMenuState
{
	// SYNTAX GUIDE
	// link to image
	// Info
	// isAnimated
	// frames horiz num
	// frames vert num
	// animation data
	private var grid:Array<Dynamic> = 
	[
		[
			"assets/images/clamSheet.png",
			"more info",
		],
		[
			"assets/images/echidnaSheet.png",
			"more info",
		],
		[
			"assets/images/minotaurSheet.png",
			"more info",
		],
		[
			"assets/images/batSheet.png",
			"more info",
		],
		[
			"assets/images/mushSheet.png",
			"more info",
		],
		[
			"assets/images/slimeSheet.png",
			"more info",
		],
		[
			"assets/images/vineSheet.png",
			"more info",
		],
		[
			"assets/images/mmLogo.png",
			"logo thing"
		]
		/*
		[
			"assets/images/preloaderArt.png",
			"Coolguy PhantomArcade, at the Ambler Theater before the Newgrounds Pico Day Reanimated event from Oct twenty something"
		],
		[
			"assets/images/spr_player.png",
			"The Player sprites",
			true,
			3,
			1,
			[
				[
					"run",
					[0, 1, 2],
					6
				]
			]
		],
		[
			"assets/images/trimmedAndFixedSprites.png",
			"All the enemy sprites",
			true,
			21,
			1,
			[
				[
					"runMush",
					[0, 1, 2],
					6
				],
				[
					"runVine",
					[3, 4, 5],
					6
				],
				[
					"runBat",
					[6, 7, 8],
					6
				],
				[
					"runSlime",
					[9, 10, 11],
					6
				],
				[
					"runMino",
					[12, 13, 14],
					6
				],
				[
					"runEchid",
					[15, 16, 17],
					6
				],
				[
					"runClam",
					[18, 19, 20],
					6
				]
			]
		],
		[
			"assets/images/fanart/clamOld.png",
			"Fanart of the old Clam Girl design, art by Peeper"
		],
		[
			"assets/images/fanart/clamOldNUDEHELLYEAH.png",
			"Fanart of the old Clam Girl design, but this one is naked hell yeah damn, art by Peeper"
		],
		[
			"assets/images/fanart/Monster_mashin_lady.png",
			"Fanart of the old Clam Girl design, you know she had to do it to em, art by Peeper"
		],
		[
			"assets/images/fanart/mushOogtarded.png",
			"Fanart of mush girl, some of the first fanart we got!\n Art by Oogtarded"
		],
		*/
	];
	
	private var bigImage:FlxSpriteGroup;
	private var _grpThumbnails:FlxTypedGroup<FlxSpriteButton>;
	private var bigPreview:FlxSprite;
	private var imageText:FlxText;
	
	private var curOpen:Int = 0;
	private var curAnimPlaying:Int = 0;
	private var isSpritesheet:Bool = false;
	
	private var titleText:FlxText;
	
	override public function create():Void 
	{
		#if !mobile
			FlxG.mouse.visible = true;
		#end
		
		initTilemap(2);
		
		bigImage = new FlxSpriteGroup();
		bigPreview = new FlxSprite();
		bigImage.add(bigPreview);
		
		imageText = new FlxText(0, FlxG.height - 70, FlxG.width - 6, "Test Words", 18);
		imageText.alignment = FlxTextAlign.CENTER;
		imageText.screenCenter(X);
		bigImage.add(imageText);
		
		titleText = new FlxText(10, 10, 0, "Gallery - Press ESC to exit", 20);
		add(titleText);
		
		
		add(bigImage);
		bigImage.visible = false;
		
		super.create();
	}
	
	private function openImage(i:Int):Void
	{
		curAnimPlaying = 0;
		bigImage.visible = true;
		bigPreview.loadGraphic(grid[i][0]);
		
		var isAnimated = grid[i][2];
		var horizSize:Int = Std.int(bigPreview.width);
		var vertSize:Int = Std.int(bigPreview.height);
		// checks if animated
		if (isAnimated && !isSpritesheet)
		{
			isAnimated = true;
			horizSize = Std.int(horizSize / grid[i][3]);
			vertSize = Std.int(vertSize / grid[i][4]);
		}
		
		bigPreview.loadGraphic(grid[i][0], isAnimated, horizSize, vertSize);
		
		// loads animation data
		if (isAnimated && !isSpritesheet)
		{
			for (a in 0...grid[i][5].length)
			{
				bigPreview.animation.add(grid[i][5][a][0], grid[i][5][a][1], grid[i][5][a][2]);
				bigPreview.animation.play(grid[i][5][a][0]);
			}
		}
		
		if (bigPreview.width < bigPreview.height)
			bigPreview.setGraphicSize(0, Std.int(FlxG.width * 0.75));
		else
			bigPreview.setGraphicSize(Std.int(FlxG.height * 0.75));
		
		bigPreview.updateHitbox();
		bigPreview.screenCenter();
		
		imageText.text = grid[i][1];
		
	}
	
	override public function update(elapsed:Float):Void 
	{
		#if !mobile
			keyboardControls();
		#end
		
		if (FlxG.onMobile)
		{
			if (FlxG.touches.list[0].overlaps(titleText))
				FlxG.switchState(new MenuState());
		}
		
		dragControls();
		
		super.update(elapsed);
	}
	
	private function keyboardControls():Void
	{
		#if !mobile
		if (FlxG.mouse.wheel != 0)
		{
			bigPreview.setGraphicSize(Std.int(bigPreview.width + (FlxG.mouse.wheel * 1.5)));
			bigPreview.updateHitbox();
			bigPreview.screenCenter();
		}
		
		#end
		
		if (FlxG.keys.justPressed.ESCAPE)
			FlxG.switchState(new MenuState());
		
		if (FlxG.keys.justPressed.LEFT)
		{
			if (grid[curOpen][2])
			{
				curAnimPlaying -= 1;
				if (curAnimPlaying < 0)
				{
					curAnimPlaying = grid[curOpen][5].length;
					curAnimPlaying -= 1;
				}
				bigPreview.animation.play(grid[curOpen][5][curAnimPlaying][0]);
			}
		}
		
		
		if (FlxG.keys.justPressed.RIGHT)
		{
			if (grid[curOpen][2])
			{
				curAnimPlaying += 1;
				if (curAnimPlaying > grid[curOpen][5].length - 1)
				{
					curAnimPlaying = 0;
				}
				bigPreview.animation.play(grid[curOpen][5][curAnimPlaying][0]);
			}
		}
		
		if (FlxG.keys.justPressed.E)
		{
			isSpritesheet = !isSpritesheet;
			
			openImage(curOpen);
		}
		
		
		// REPLACE THESE TO BE CLEANER LATER AND WITH MORE KEYS
		if (FlxG.keys.pressed.S)
		{
			bigPreview.offset.y += 10;
		}
		if (FlxG.keys.pressed.W)
		{
			bigPreview.offset.y -= 10;
		}
		
		if (FlxG.keys.pressed.D)
		{
			bigPreview.offset.x += 10;
		}
		
		if (FlxG.keys.pressed.A)
		{
			bigPreview.offset.x -= 10;
		}
		
	}
	
	private var dragPos:FlxPoint = new FlxPoint();
	private var picPosOld:FlxPoint = new FlxPoint();
	
	private var touchesLength:Float = 0;
	private var touchesAngle:Float = 0;
	private var picAngleOld:Float = 0;
	private var picWidthOld:Float = 0;
	
	private function dragControls():Void
	{	
		var pressingButton:Bool = false;
		var zoomPressingButton:Bool = false;
		var buttonJustPressed:Bool = false;
		var zoomButtonJustPressed:Bool = false;
		var buttonPos:FlxPoint = new FlxPoint();
		
		// its called touchNew, but really its the length of the line between the two touches
		// or the length between the center of the image and the mouse on right click
		var touchNew:Float = 0;
		var rads:Float = 0;
		var midScreen:FlxPoint = new FlxPoint();
		midScreen.set(FlxG.width / 2, FlxG.height / 2);
				
		
		#if !mobile
			if (FlxG.mouse.pressed)
			{
				if (FlxG.mouse.justPressed)
				{
					dragPos = FlxG.mouse.getPosition();
					buttonJustPressed = true;
				}
				
				pressingButton = true;
				buttonPos = FlxG.mouse.getPosition();
			}
			
			if (FlxG.mouse.pressedRight)
			{
				if (FlxG.mouse.justPressedRight)
				{
					zoomButtonJustPressed = true;
				}
				
				zoomPressingButton = true;
				
				rads = Math.atan2(midScreen.y - FlxG.mouse.y, midScreen.x - FlxG.mouse.x);
				touchNew = FlxMath.vectorLength(midScreen.x - FlxG.mouse.x, midScreen.y - FlxG.mouse.y);
			}
			
		#else
			if (FlxG.touches.list.length == 1)
			{
				if (FlxG.touches.list[0].justPressed)
				{
					dragPos = FlxG.touches.list[0].getPosition();
					buttonJustPressed = true;
				}
				
				pressingButton = true;
				buttonPos = FlxG.touches.list[0].getPosition();
			}
			if (FlxG.touches.list.length == 2)
			{
				
				if (FlxG.touches.list[1].justPressed)
				{
					zoomButtonJustPressed = true;
				}
				
				zoomPressingButton = true;
				
				rads = Math.atan2(FlxG.touches.list[0].y - FlxG.touches.list[1].y, FlxG.touches.list[0].x - FlxG.touches.list[1].x);
				touchNew = FlxMath.vectorLength(FlxG.touches.list[0].x - FlxG.touches.list[1].x, FlxG.touches.list[0].y - FlxG.touches.list[1].y);
			}
		#end
		
		// drag behaviour
		if (pressingButton)
		{
			if (buttonJustPressed)
			{
				picPosOld.x = bigPreview.offset.x;
				picPosOld.y = bigPreview.offset.y;
			}
		
			
			var xPos:Float = buttonPos.x - dragPos.x;
			var yPos:Float = buttonPos.y - dragPos.y;
			
			bigPreview.offset.x = picPosOld.x - xPos;
			bigPreview.offset.y = picPosOld.y - yPos;
			
		}
		
		// zoom behaviour
		if (zoomPressingButton)
		{	
			if (zoomButtonJustPressed)
			{
				touchesLength = touchNew;
				touchesAngle = FlxAngle.asDegrees(rads);
				picAngleOld = bigPreview.angle;
				picWidthOld = bigPreview.width;
			}
			
			
			var degs = FlxAngle.asDegrees(rads);
			bigPreview.angle = (picAngleOld + degs - touchesAngle);
			
			FlxG.watch.addQuick("Degs/Angle", degs);
			
			bigPreview.setGraphicSize(Std.int(picWidthOld * (touchNew / touchesLength)));
			bigPreview.updateHitbox();
			bigPreview.screenCenter();
			
		}
	}
}
	