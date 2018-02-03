package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxSubState;
import flixel.addons.effects.chainable.FlxEffectSprite;
import flixel.addons.effects.chainable.FlxWaveEffect;
import flixel.group.FlxSpriteGroup;
import flixel.text.FlxText;
import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;
import flixel.util.FlxColor;
import flixel.util.FlxTimer;
import openfl.geom.Matrix;
import openfl.geom.Point;

/**
 * ...
 * @author ninjaMuffin
 */
class BattleState extends FlxSubState 
{
	private var _sprScreen:FlxSprite;
	private var _sprEnemy:FlxSprite;
	
	private var _grpMenu:FlxSpriteGroup;
	private var _grpAttack:FlxSpriteGroup;
	
	private var attacking:Bool = false;
	
	private var enemyHP:Int = 10;
	private var playerHP:Int = 10;
	
	private var selector:FlxSprite;
	private var selectorPos:Int = 0;
	private var menuText:FlxText;
	
	private var attackTick:FlxSprite;
	private var attackBar:FlxSprite;

	public function new(BGColor:FlxColor=FlxColor.TRANSPARENT) 
	{
		super(BGColor);
		
		_sprScreen = new FlxSprite().makeGraphic(FlxG.width, FlxG.height, FlxColor.TRANSPARENT);
		var waveEffect = new FlxWaveEffect(FlxWaveMode.ALL, 4, -1, 4);
		var waveSprite = new FlxEffectSprite(_sprScreen, [waveEffect]);
		add(waveSprite);
		
		_sprEnemy = new FlxSprite(150, 20).makeGraphic(275, 375, FlxColor.RED);
		_sprEnemy.alpha = 0;
		add(_sprEnemy);
		
		initMenu();
		initAttackMenu();
		initCombat();
		
		new FlxTimer().start(0.7, tweenMenu, 1);
	}
	
	private function initMenu():Void
	{
		_grpMenu = new FlxSpriteGroup();
		_grpMenu.y = FlxG.height;
		_grpMenu.x = FlxG.width * 0.05;
		var rect:FlxSprite = new FlxSprite().makeGraphic(Std.int(FlxG.width * 0.9), Std.int(FlxG.height * 0.275), 0xCCFFFFFF);
		_grpMenu.add(rect);
		add(_grpMenu);
		
		menuText = new FlxText(100, 16, 0, "Attack\nFuck\nFun", 32);
		menuText.color = FlxColor.BLACK;
		_grpMenu.add(menuText);
		
		selector = new FlxSprite(100 - 32, 16);
		selector.makeGraphic(32, 8);
		selector.color = FlxColor.BLACK;
		_grpMenu.add(selector);
	}
	

	
	private function initAttackMenu():Void
	{
		_grpAttack = new FlxSpriteGroup();
		_grpAttack.x = _grpMenu.x;
		_grpAttack.y = FlxG.height * 0.6;
		add(_grpAttack);
		
		attackBar = new FlxSprite().makeGraphic(400, 30, FlxColor.BLUE);
		_grpAttack.add(attackBar);
		
		attackTick = new FlxSprite().makeGraphic(8, 16, FlxColor.RED);
		_grpAttack.add(attackTick);
		
		_grpAttack.kill();
	}
	
	public function initCombat():Void
	{
		_sprScreen.drawFrame();
		var screenPixels = _sprScreen.framePixels;
		
		if (FlxG.renderBlit)
			screenPixels.copyPixels(FlxG.camera.buffer, FlxG.camera.buffer.rect, new Point());
		else
			screenPixels.draw(FlxG.camera.canvas, new Matrix(1, 0, 0, 1, 0, 0));
		
		FlxTween.tween(_sprEnemy, {y: 60, alpha: 1}, 1, {ease:FlxEase.cubeInOut});
	}
	
	private var tickMoveRight:Bool = true;
	
	override public function update(elapsed:Float):Void 
	{
		super.update(elapsed);
		
		if (FlxG.keys.justPressed.UP)
		{
			selectorPos -= 1;
		}
		if (FlxG.keys.justPressed.DOWN)
		{
			selectorPos += 1;
		}
		
		if (selectorPos == 0 && _grpMenu.alive && FlxG.keys.justPressed.SPACE)
		{
			_grpMenu.kill();
			_grpAttack.revive();
			
			attacking = true;
		}
		
		if (_grpAttack.alive && attacking)
		{
			var tickSpeed:Float = 4;
			if (attackTick.x >= (attackBar.x + attackBar.width))
			{
				tickMoveRight = false;
			}
			else if (attackTick.x <= attackBar.x)
			{
				tickMoveRight = true;
			}
			
			if (tickMoveRight)
				attackTick.x += 4;
			else
				attackTick.x -= 4;
			
			if (FlxG.keys.justPressed.UP)
			{
				attacking = false;
			}
			
		}
		else if (_grpAttack.alive)
		{
			new FlxTimer().start(1, killAttacks);
		}
		
		selector.y = (46 * selectorPos) + 28 + _grpMenu.y;
		
	}
	
	private function killAttacks(t:FlxTimer):Void
	{
		_grpAttack.kill();
		_grpMenu.revive();
	}
	
	private function tweenMenu(t:FlxTimer):Void
	{
		FlxTween.tween(_grpMenu, {y: FlxG.height * 0.6}, 1.6, {ease:FlxEase.elasticOut});
	}
	
}