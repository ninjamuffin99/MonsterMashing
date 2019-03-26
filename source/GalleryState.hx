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
import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;
import flixel.ui.FlxSpriteButton;
import flixel.util.FlxColor;

/**
 * ...
 * @author 
 */
class GalleryState extends BaseMenuState
{
	
	private var bigImage:FlxSpriteGroup;
	private var _grpThumbnails:FlxTypedGroup<FlxSpriteButton>;
	private var _grpThumbPics:FlxTypedGroup<FlxSprite>;
	private var bigPreview:FlxSprite;
	private var imageText:FlxText;
	private var imageTextBG:FlxSprite;
	private var keyboardInfo:FlxText;
	
	private var bgFade:FlxSprite;
	
	private var curSelected = 0;
	private var curOpen:Int = 0;
	private var isOpen:Bool = false;
	private var curAnimPlaying:Int = 0;
	private var isSpritesheet:Bool = false;
	private var timerClosing:Float = 0.4;
	
	private var titleText:FlxText;
	
	override public function create():Void 
	{
		#if !mobile
			FlxG.mouse.visible = true;
		#else
			FlxG.mouse.visible = false;
		#end
		
		initTilemap(2);
		
		bigImage = new FlxSpriteGroup();
		bigPreview = new FlxSprite();
		bgFade = new FlxSprite().makeGraphic(FlxG.width, FlxG.height, FlxColor.BLACK);
		bigImage.add(bgFade);
		bigImage.add(bigPreview);
		
		// imageTextBG code setup is slightly lower heheh
		imageTextBG = new FlxSprite();
		imageTextBG.alpha = 0.5;
		bigImage.add(imageTextBG);
		
		imageText = new FlxText(0, FlxG.height - 120, FlxG.width - 6, "Test Words", 18);
		imageText.alignment = FlxTextAlign.CENTER;
		imageText.screenCenter(X);
		bigImage.add(imageText);
		
		imageTextBG.y = imageText.y - 4;
		imageTextBG.makeGraphic(Std.int(imageText.frameWidth + 10), Std.int((imageText.textField.numLines + 1) * 19), FlxColor.BLACK);
		imageTextBG.screenCenter(X);
		
		titleText = new FlxText(10, 10, 0, "Gallery", 20);
		#if mobile
		titleText.text += "\nTap here to return to main menu";
		#else
		titleText.text += "\nPress ESC to return to main menu";
		#end
		titleText.alignment = CENTER;
		titleText.screenCenter(X);
		add(titleText);
		
		_grpThumbnails = new FlxTypedGroup<FlxSpriteButton>();
		add(_grpThumbnails);
		
		_grpThumbPics = new FlxTypedGroup<FlxSprite>();
		add(_grpThumbPics);
		
		for (sh in 0...HighScore.shiniesSeen.length)
		{
			var arrBuildin:Array<Dynamic> = 
			[
				"assets/images/" + HighScore.monsterList[sh] + "SheetShiny.png",
				"SHINY ",
				true,
				4,
				1,
				[
					[
						'idle1',
						[0],
						1
					],
					[
						'idle2',
						[1],
						1
					],
					[
						'nude1',
						[2],
						1
					],
					[
						'nude2',
						[3],
						1
					],
					
				]
			];
			
			arrBuildin[1] += sh;
			
			grid.push(arrBuildin);
			
		}
		
		for (i in 0...grid.length)
		{
			var gridPos:FlxPoint = new FlxPoint(120 * (i % 4) + 30, (120 * Std.int(i / 4)) + 80);
			var gridBG:FlxSpriteButton = new FlxSpriteButton(gridPos.x, gridPos.y, null, function(){
				
				if (!isOpen && timerClosing <= 0)
				{
					curOpen = i;
					curSelected = i;
					isSpritesheet = false;
					
					openImage(curOpen);
				}
			});
			
			gridBG.onOver.callback = function()
			{
				if (!isOpen)
				{
					curSelected = i; 
				}
			};
			
			
			var gridThing:FlxSprite = new FlxSprite(gridPos.x, gridPos.y);
			if (i >= grid.length - HighScore.shiniesSeen.length)
			{
				FlxG.log.add((i - grid.length) + HighScore.shiniesSeen.length);
			}
			
			
			// do it this way somewhat makes it quicker to load when you dont have as many images unlocked
			if (hasScore(i) || (i >= grid.length - HighScore.shiniesSeen.length && HighScore.shiniesSeen[(i - grid.length) + HighScore.shiniesSeen.length]))
			{
				gridBG.loadGraphic(AssetPaths.MM_GalleryFrame__png);
				
				gridThing.loadGraphic(grid[i][0]);
				
				var horizSize:Int = Std.int(gridThing.width);
				#if !nutaku
				if (grid[i][2])
				{
					if (grid[i][5][0][0] == 'idle1')
					{
						horizSize -= Std.int(horizSize / grid[i][3]);
					}
				}
				#end
				
				gridThing.loadGraphic(grid[i][0], false, horizSize);
				
				var testSize:Int = 90;
				if (gridThing.width > gridThing.height)
					gridThing.setGraphicSize(testSize);
				else
					gridThing.setGraphicSize(0, testSize);
				
				gridThing.updateHitbox();
				gridThing.setPosition(gridBG.getMidpoint().x - (gridThing.width / 2), gridBG.getMidpoint().y - (gridThing.height / 2)); 
				
			}
			else
			{
				gridBG.loadGraphic(AssetPaths.MM_GalleryFrame_Locked1__png);
				gridThing.makeGraphic(1, 1, FlxColor.TRANSPARENT);
			}
			gridBG.scrollFactor.set(1, 1);
			_grpThumbnails.add(gridBG);
			_grpThumbPics.add(gridThing);
		}
		
		FlxG.camera.setScrollBounds(0, FlxG.width, 0, _grpThumbnails.members[_grpThumbnails.members.length - 1].y + 150);
		
		add(bigImage);
		bigImage.visible = false;
		bigImage.scrollFactor.set();
		
		super.create();
	}
	
	private function hasScore(val:Int):Bool
	{
		var theTruth:Bool = false;
		
		if (HighScore.totalScore >= val * 7500)
			theTruth = true;
		
		return theTruth;
	}
	
	private function openImage(i:Int):Void
	{
		bigPreview.angle = 0;
		
		if (!isOpen)
		{
			bgFade.alpha = 0;
			FlxTween.tween(bgFade, {alpha: 0.75}, 0.3, {ease:FlxEase.quartOut});
		}
		
		
		isOpen = true;
		curAnimPlaying = 0;
		curOpen = i;
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
		
		#if !nutaku
		if (grid[i][2])
		{
			if (grid[i][5][0][0] == 'idle1' && isSpritesheet)
			{
				horizSize -= Std.int(horizSize / grid[i][3]);
			}
		}
		#end
		
		bigPreview.loadGraphic(grid[i][0], isAnimated, horizSize, vertSize);
		
		// loads animation data
		if (isAnimated && !isSpritesheet)
		{
			for (a in 0...grid[i][5].length)
			{
				bigPreview.animation.add(grid[i][5][a][0], grid[i][5][a][1], grid[i][5][a][2]);
				bigPreview.animation.play(grid[i][5][0][0]);
			}
		}
		
		bigPreview.setGraphicSize(0, Std.int(FlxG.height));
		bigPreview.updateHitbox();
		bigPreview.screenCenter();
		
		if (bigPreview.width >= FlxG.width)
			bigPreview.setGraphicSize(Std.int(FlxG.width * 0.9));
		
		bigPreview.updateHitbox();
		bigPreview.screenCenter();
		
		imageText.text = grid[i][1];
		
		imageTextBG.makeGraphic(Std.int(imageText.fieldWidth + 10), Std.int((imageText.textField.numLines + 1) * 19), FlxColor.BLACK);
		imageTextBG.screenCenter(X);
		
		bigPreview.alpha = 0;
		bigPreview.y -= 10;
		FlxTween.tween(bigPreview, {alpha: 1, y: bigPreview.y + 10}, 0.5, {ease: FlxEase.quartOut, startDelay: 0.02});
		
		
		
		if (hasScore(i) || (i >= grid.length - HighScore.shiniesSeen.length && HighScore.shiniesSeen[(i - grid.length) + HighScore.shiniesSeen.length]))
			bigPreview.color = FlxColor.WHITE;
		else
		{
			bigPreview.color = FlxColor.BLACK;
			if (!hasScore(i) && i < grid.length - HighScore.shiniesSeen.length )
			{
				imageText.text = "You need " + ((i * 7500) - HighScore.totalScore) + " more total score to unlock this image!";
			}
		}
		
	}
	
	override public function update(elapsed:Float):Void 
	{
		#if !mobile
			keyboardControls();
			gamepadControls();
		#end
		
		#if switch
			gamepadControls();
		#end
		
				
		if (FlxG.keys.justPressed.ESCAPE)
		{
			if (isOpen)
			{
				isOpen = false;
			}
			else
			{
				FlxG.switchState(new MenuState());
			}
			
		}
		
		if (timerClosing > 0)
		{
			timerClosing -= FlxG.elapsed;
		}
		
		bigImage.visible = isOpen;
		
		if (curSelected < 0)
			curSelected = _grpThumbnails.length + curSelected + 1; // Its plus because this value is negative
		if (curSelected >= _grpThumbnails.length)
			curSelected = curSelected % (_grpThumbnails.length + 1);
		
		FlxG.watch.addQuick("sel: ", curSelected);
		FlxG.watch.addQuick("length: ", _grpThumbnails.length);
		
		if (!bigPreview.isOnScreen() && isOpen)
		{
			openImage(curOpen);
		}
		
		_grpThumbnails.forEach(function(btn:FlxSpriteButton)
		{
			btn.color = 0xFF444444;
			
		});
		
		_grpThumbPics.forEach(function(spr:FlxSprite)
		{
			spr.color = 0xFF777777;
		});
		
		for (i in 0..._grpThumbnails.members.length)
		{
			if (curSelected == i)
			{
				_grpThumbnails.members[i].color = FlxColor.WHITE;
				_grpThumbPics.members[i].color = FlxColor.WHITE;
				FlxG.camera.follow(_grpThumbnails.members[i], null, 0.1);
			}
		}
		
		if (FlxG.onMobile)
		{
			for (swipe in FlxG.swipes)
			{
				// swipe.startPosition (FlxPoint)
				// swipe.endPosition (FlxPoint)

				// swipe.id (Int)

				// swipe.distance (Float)
				// swipe.angle (Float)
				// swipe.duration (Float)
			}
			
			for (touches in FlxG.touches.list)
			{
				
				if (isOpen)
				{
					if (touches.justPressed)
					{
						if (touches.y > imageText.y)
						{
							isOpen = false;
							timerClosing = 0.1;
						}
						
						if (touches.y < FlxG.height * 0.15)
						{
							isSpritesheet = !isSpritesheet;
							
							openImage(curOpen);
						}
						
						if (touches.x > FlxG.width * 0.9 && grid[curOpen][2])
						{
							curAnimPlaying += 1;
				
							if (curAnimPlaying > grid[curOpen][5].length - 1)
							{
								curAnimPlaying = 0;
							}
							
							#if !nutaku
								if (grid[curOpen][5][curAnimPlaying][0] == 'nude2')
								{
									curAnimPlaying = 0;
								}
							#end
							
							bigPreview.animation.play(grid[curOpen][5][curAnimPlaying][0]);
						}
						
						if (touches.x < FlxG.width * 0.1 && grid[curOpen][2])
						{
							
							curAnimPlaying -= 1;
							if (curAnimPlaying < 0)
							{
								curAnimPlaying = grid[curOpen][5].length;
								curAnimPlaying -= 1;
							}
							
							#if !nutaku
							if (grid[curOpen][5][curAnimPlaying][0] == 'nude2')
							{
								curAnimPlaying -= 1;
							}
							
							#end
							
							bigPreview.animation.play(grid[curOpen][5][curAnimPlaying][0]);	
										
						}
						
					}
				}
				else
				{
					if (touches.overlaps(titleText))
						FlxG.switchState(new MenuState());
				
				}
			}
			
		}
		
		if (isOpen)
		{
			dragControls();
		}
		else
		{
			picPosOld.set();
			dragPos.set();
		}
		
		
		super.update(elapsed);
	}
	
	private function gamepadControls():Void
	{
		var gamepad = FlxG.gamepads.lastActive;
		if (gamepad != null)
		{
			#if !switch
				if (gamepad.anyJustPressed(["B", "BACK"]))
				{
					if (isOpen)
					{
						isOpen = false;
					}
					else
					{
						FlxG.switchState(new MenuState());
					}
				}
			#end
			
			#if switch
				if (gamepad.anyJustPressed(["X"]))
				{
					if (isOpen)
					{
						isOpen = false;
					}
					else
					{
						FlxG.switchState(new MenuState());
					}
				}
			#end
			
			if (isOpen)
			{
				bigPreview.offset.x -= gamepad.analog.value.LEFT_STICK_X * 10;
				bigPreview.offset.y -= gamepad.analog.value.LEFT_STICK_Y * 10;
				
				bigPreview.angle += gamepad.analog.value.RIGHT_STICK_X * 3;
				
				if (gamepad.analog.value.RIGHT_STICK_Y > gamepad.deadZone || gamepad.analog.value.RIGHT_STICK_Y < -gamepad.deadZone)
				{
					bigPreview.setGraphicSize(Std.int(bigPreview.width - (gamepad.analog.value.RIGHT_STICK_Y * 9)));
					bigPreview.updateHitbox();
					bigPreview.screenCenter();
					
				}
				
				if (gamepad.anyJustPressed(["RIGHT", "DPAD_RIGHT", "RIGHT_SHOULDER"]) && grid[curOpen][2])
				{
					curAnimPlaying += 1;
				
					if (curAnimPlaying > grid[curOpen][5].length - 1)
					{
						curAnimPlaying = 0;
					}
					
					#if !nutaku
						if (grid[curOpen][5][curAnimPlaying][0] == 'nude2')
						{
							curAnimPlaying = 0;
						}
					#end
					
					bigPreview.animation.play(grid[curOpen][5][curAnimPlaying][0]);
					
				}
				
				if (gamepad.anyJustPressed(["LEFT", "DPAD_LEFT", "LEFT_SHOULDER"]) && grid[curOpen][2])
				{
					
					curAnimPlaying -= 1;
					if (curAnimPlaying < 0)
					{
						curAnimPlaying = grid[curOpen][5].length;
						curAnimPlaying -= 1;
					}
					
					#if !nutaku
					if (grid[curOpen][5][curAnimPlaying][0] == 'nude2')
					{
						curAnimPlaying -= 1;
					}
					
					#end
					
					bigPreview.animation.play(grid[curOpen][5][curAnimPlaying][0]);	
				}
				
				if (gamepad.anyJustPressed(["X", "RIGHT_STICK_CLICK", "LEFT_STICK_CLICK"]))
				{
					isSpritesheet = !isSpritesheet;
					openImage(curOpen);
				}
			
				
			}
			else
			{
				
				if (gamepad.anyJustPressed(["DOWN", "DPAD_DOWN", "LEFT_STICK_DIGITAL_DOWN"]))
				{
					curSelected += 4;
				}
				
				if (gamepad.anyJustPressed(["UP", "DPAD_UP", "LEFT_STICK_DIGITAL_UP"]))
				{
					curSelected -= 4;
				}
				
				if (gamepad.anyJustPressed(["RIGHT", "DPAD_RIGHT", "LEFT_STICK_DIGITAL_RIGHT"]))
				{
					curSelected += 1;
				}
				
				if (gamepad.anyJustPressed(["LEFT", "DPAD_LEFT", "LEFT_STICK_DIGITAL_LEFT"]))
				{
					curSelected -= 1;
				}
				
				if (gamepad.justPressed.A)
				{
					isSpritesheet = false;
					openImage(curSelected);
				}
			}
		}
		
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

		if (isOpen)
		{
			if (FlxG.keys.justPressed.LEFT && grid[curOpen][2])
			{
				curAnimPlaying -= 1;
				if (curAnimPlaying < 0)
				{
					curAnimPlaying = grid[curOpen][5].length;
					curAnimPlaying -= 1;
				}
				
				#if !nutaku
				if (grid[curOpen][5][curAnimPlaying][0] == 'nude2')
				{
					curAnimPlaying -= 1;
				}
				
				#end
				
				bigPreview.animation.play(grid[curOpen][5][curAnimPlaying][0]);	
			}
			
			
			if (FlxG.keys.justPressed.RIGHT && grid[curOpen][2])
			{
				curAnimPlaying += 1;
				
				if (curAnimPlaying > grid[curOpen][5].length - 1)
				{
					curAnimPlaying = 0;
				}
				
				#if !nutaku
					if (grid[curOpen][5][curAnimPlaying][0] == 'nude2')
					{
						curAnimPlaying = 0;
					}
				#end
				
				bigPreview.animation.play(grid[curOpen][5][curAnimPlaying][0]);
			}
			
			if (FlxG.keys.justPressed.E)
			{
				isSpritesheet = !isSpritesheet;
				
				openImage(curOpen);
			}
			
			
			// REPLACE THESE TO BE CLEANER LATER AND WITH MORE KEYS
			if (FlxG.keys.pressed.SHIFT)
			{
				if (FlxG.keys.justPressed.S)
				{
					bigPreview.setGraphicSize(Std.int(bigPreview.width * 0.8));
					bigPreview.updateHitbox();
					bigPreview.screenCenter();
				}
				if (FlxG.keys.justPressed.W)
				{
					bigPreview.setGraphicSize(Std.int(bigPreview.width * 1.2));
					bigPreview.updateHitbox();
					bigPreview.screenCenter();
				}
				
				if (FlxG.keys.justPressed.D)
				{
					bigPreview.angle += 45 / 2;
				}
				
				if (FlxG.keys.justPressed.A)
				{
					bigPreview.angle -= 45 / 2;
				}
			}
			else
			{
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
			
		}
		else //if ur navigating the image
		{
			if (FlxG.keys.anyJustPressed([D, RIGHT]))
			{
				curSelected += 1;
			}
			if (FlxG.keys.anyJustPressed([A, LEFT]))
			{
				curSelected -= 1;
			}
			
			if (FlxG.keys.anyJustPressed([W, UP]))
			{
				curSelected -= 4;
			}
			if (FlxG.keys.anyJustPressed([S, DOWN]))
				curSelected += 4;
			
			if (FlxG.keys.anyJustPressed([SPACE, ENTER, Z]))
			{
				isSpritesheet = false;
				openImage(curSelected);
			}
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
			if (FlxG.mouse.justReleasedRight)
			{
				buttonJustPressed = true;
			}
			
		#else
			
			for (touch in FlxG.touches.list)
			{
				if (FlxG.touches.list.length == 1)
				{
					if (touch.justPressed)
					{
						dragPos = touch.getPosition();
						buttonJustPressed = true;
					}
					
					pressingButton = true;
					buttonPos = touch.getPosition();
				}
				if (FlxG.touches.list.length == 2)
				{
					
					if (FlxG.touches.list[1].justPressed)
					{
						zoomButtonJustPressed = true;
					}
					if (FlxG.touches.list[1].justReleased)
					{
						dragPos = FlxG.touches.list[0].getPosition();
						buttonJustPressed = true;
					}
					
					buttonJustPressed = true;
					zoomPressingButton = true;
					
					rads = Math.atan2(FlxG.touches.list[0].y - FlxG.touches.list[1].y, FlxG.touches.list[0].x - FlxG.touches.list[1].x);
					touchNew = FlxMath.vectorLength(FlxG.touches.list[0].x - FlxG.touches.list[1].x, FlxG.touches.list[0].y - FlxG.touches.list[1].y);
				}
			}
			
		#end
		
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
			
			if (FlxG.keys.pressed.SHIFT)
				bigPreview.angle = 0;
			
			FlxG.watch.addQuick("Degs/Angle", degs);
			
			bigPreview.setGraphicSize(Std.int(picWidthOld * (touchNew / touchesLength)));
			bigPreview.updateHitbox();
			bigPreview.screenCenter();
			
			dragPos.set(bigPreview.getGraphicMidpoint().x, bigPreview.getGraphicMidpoint().y);
			picPosOld.x = bigPreview.offset.x;
			picPosOld.y = bigPreview.offset.y;
			buttonPos = bigPreview.offset;
		}
		
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
		
	}
	
	// SYNTAX GUIDE
	// link to image
	// Info
	// isAnimated
	// frames horiz num
	// frames vert num
	// animation data
	private var grid:Array<Dynamic> = 
	[
		/*Misc Art*/
		[
			"assets/images/mmLogo.png",
			"The Monster Mashing logo"
		],
		[
			"assets/images/preloaderArt.png",
			"PhantomArcade, at the Ambler Theater. This image is used for the preloader for the web version of the game"
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
		/*Unused Concepts*/
		[
			"assets/images/unusedConcept/ColorsforMushGirl.jpg",
			"Mush Girl concept. This is unused colors for mush Girl. \nPainted by our ex-Monster Mashing dev EiGiBeast (RIP LOLOL)\nConcept art/sketch by Digimin"
		],
		[
			"assets/images/unusedConcept/Girls.png",
			"Unused concepts for Girls. Besides the echidna.\nArt by Digimin"
		],
		[
			"assets/images/unusedConcept/clamSheetOld.png",
			"Old sprites for the Clam Girl.\nArt by BrandyBuizel"
		],
		[
			"assets/images/unusedConcept/slimeSheetOld.png",
			"Old sprites for the Slime Girl.\nArt by BrandyBuizel"
		],
		[
			"assets/images/unusedConcept/spr_mush.png",
			"Early concept sketch for Mushroom Girl. She might've been the first character designed I believe\nArt by Digimin"
		],
		[
			"assets/images/unusedConcept/hhhhhhh.jpg",
			"Concepts for the second round of Girls. On the left is 'red panda' Girl. Shame she ain't in though\nArt by Digimin"
		],
		/*Fan Art*/
		[
			"assets/images/fanart/clamOld.png",
			"Fanart of the old Clam Girl design, art by Peeper"
		],
		[
			"assets/images/fanart/irri.png",
			"Fanart of the Slime Girl\nArt by Irri"
		],
		[
			"assets/images/fanart/cym0.jpg",
			"A fanart sketch of the Mush Girl\nArt by Cymbourine"
		],
		[
			"assets/images/fanart/clamOldNUDEHELLYEAH.png",
			"Fanart of the old Clam Girl design, but this one is naked hell yeah damn, art by Peeper"
		],
		[
			"assets/images/fanart/ivo.png",
			"Fanart of the Slime and Bat Girls.\nArt by IvoAnimations"
		],
		[
			"assets/images/fanart/Arzonaut.png",
			"Fanart of the Slime and Bat Girls.\nArt by Arzonaut"
		],
		[
			"assets/images/fanart/cym.png",
			"Fanart of the Vine Girl.\nArt by Cymbourine"
		],
		[
			"assets/images/fanart/dyingsun.png",
			"Fanart of the old Clam Girl design.\nArt by TheDyingSun"
		],
		[
			"assets/images/fanart/snackers.png",
			"Fanart of Echidna gf./nArt by Snackers"
		],
		[
			"assets/images/fanart/snail.png",
			"Fanart of Mushroom Girl./nArt by SnailPirate"
		],
		[
			"assets/images/fanart/Monster_mashin_lady.png",
			"Fanart of the old Clam Girl design, you know she had to do it to em, art by Peeper"
		],
		[
			"assets/images/fanart/mushOogtarded.png",
			"Fanart of mush Girl, some of the first fanart we got!\n Art by Oogtarded"
		],
		[
			"assets/images/fanart/cym1.jpg",
			"A fanart sketch of the Slime Girl\nArt by Cymbourine"
		],
		/*In-game Art*/
		[
			"assets/images/mushSheet.png",
			"The artwork for the Mushroom Girl\nArt by Digimin",
			true,
			4,
			1,
			[
				[
					'idle1',
					[0],
					1
				],
				[
					'idle2',
					[1],
					1
				],
				[
					'nude1',
					[2],
					1
				],
				[
					'nude2',
					[3],
					1
				],
				
			]
		],
		[
			"assets/images/vineSheet.png",
			"The artwork for the Vine Girl\nArt by Digimin",
			true,
			4,
			1,
			[
				[
					'idle1',
					[0],
					1
				],
				[
					'idle2',
					[1],
					1
				],
				[
					'nude1',
					[2],
					1
				],
				[
					'nude2',
					[3],
					1
				],
				
			]
		],
		[
			"assets/images/batSheet.png",
			"The artwork for the bat lady\nArt by Digimin",
			true,
			4,
			1,
			[
				[
					'idle1',
					[0],
					1
				],
				[
					'idle2',
					[1],
					1
				],
				[
					'nude1',
					[2],
					1
				],
				[
					'nude2',
					[3],
					1
				],
				
			]
		],
		[
			"assets/images/clamSheet.png",
			"The artwork for the clam lady\nArt by Digimin",
			true,
			4,
			1,
			[
				[
					'idle1',
					[0],
					1
				],
				[
					'idle2',
					[1],
					1
				],
				[
					'nude1',
					[2],
					1
				],
				[
					'nude2',
					[3],
					1
				],
				
			]
		],
		[
			"assets/images/echidnaSheet.png",
			"The artwork for the Echidna woman\nArt by Digimin",
			true,
			4,
			1,
			[
				[
					'idle1',
					[0],
					1
				],
				[
					'idle2',
					[1],
					1
				],
				[
					'nude1',
					[2],
					1
				],
				[
					'nude2',
					[3],
					1
				],
				
			]
		],
		[
			"assets/images/minotaurSheet.png",
			"The artwork for the Minotaur Girl\nArt by Digimin",
			true,
			4,
			1,
			[
				[
					'idle1',
					[0],
					1
				],
				[
					'idle2',
					[1],
					1
				],
				[
					'nude1',
					[2],
					1
				],
				[
					'nude2',
					[3],
					1
				],
				
			]
		],
		[
			"assets/images/slimeSheet.png",
			"The artwork of the slime Girl.\nArt by FuShark",
			true,
			4,
			1,
			[
				[
					'idle1',
					[0],
					1
				],
				[
					'idle2',
					[1],
					1
				],
				[
					'nude1',
					[2],
					1
				],
				[
					'nude2',
					[3],
					1
				],
				
			]
		]
	];
	
}
	