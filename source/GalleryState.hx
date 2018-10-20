package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.group.FlxSpriteGroup;
import flixel.math.FlxPoint;
import flixel.text.FlxText;
import flixel.ui.FlxSpriteButton;

/**
 * ...
 * @author 
 */
class GalleryState extends FlxState 
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
			"assets/images/edition.png",
			"Test Info"
		],
		[
			"assets/images/left_and_right.png",
			"more info",
			true,
			2,
			1,
			[
				[
					"idle",
					[0, 1],
					6
				]
			]
		],
		[
			"assets/images/mmLogo.png",
			"logo thing"
		],
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
		]
	];

	private var bigImage:FlxSpriteGroup;
	private var _grpThumbnails:FlxTypedGroup<FlxSpriteButton>;
	private var bigPreview:FlxSprite;
	private var imageText:FlxText;
	
	private var curOpen:Int = 0;
	private var curAnimPlaying:Int = 0;
	private var isSpritesheet:Bool = false;
	
	override public function create():Void 
	{
		#if !mobile
			FlxG.mouse.visible = true;
		#end
		
		bigImage = new FlxSpriteGroup();
		bigPreview = new FlxSprite();
		bigImage.add(bigPreview);
		
		imageText = new FlxText(0, FlxG.height - 70, FlxG.width - 6, "Test Words", 18);
		imageText.alignment = FlxTextAlign.CENTER;
		imageText.screenCenter(X);
		bigImage.add(imageText);
		
		var text:FlxText = new FlxText(10, 10, 0, "Gallery", 16);
		add(text);
		
		_grpThumbnails = new FlxTypedGroup<FlxSpriteButton>();
		add(_grpThumbnails);
		
		for (i in 0...grid.length)
		{
			var gridPos:FlxPoint = new FlxPoint(120 * (i % 4) + 10, (120 * Std.int(i / 4)) + 60);
			
			var gridBG:FlxSpriteButton = new FlxSpriteButton(gridPos.x, gridPos.y, null, function(){
				curOpen = i;
				isSpritesheet = false;
				
				openImage(curOpen);
			});
			gridBG.makeGraphic(100, 100);
			_grpThumbnails.add(gridBG);
			
			var gridThing:FlxSprite = new FlxSprite(gridPos.x, gridPos.y);
			gridThing.loadGraphic(grid[i][0]);
			
			var testSize:Int = 90;
			if (gridThing.width > gridThing.height)
				gridThing.setGraphicSize(testSize);
			else
				gridThing.setGraphicSize(0, testSize);
			
			gridThing.updateHitbox();
			gridThing.setPosition(gridBG.getMidpoint().x - (gridThing.width / 2), gridBG.getMidpoint().y - (gridThing.height / 2)); 
			add(gridThing);
		}
		
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
			if (FlxG.mouse.wheel != 0)
			{
				bigPreview.setGraphicSize(Std.int(bigPreview.width + (FlxG.mouse.wheel * 10)));
				bigPreview.updateHitbox();
				bigPreview.screenCenter();
			}
		#end
		
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
		
		super.update(elapsed);
	}
	
}