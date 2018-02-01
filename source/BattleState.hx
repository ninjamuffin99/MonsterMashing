package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxSubState;
import flixel.addons.effects.chainable.FlxEffectSprite;
import flixel.addons.effects.chainable.FlxWaveEffect;
import flixel.group.FlxSpriteGroup;
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
		
		
		_grpMenu = new FlxSpriteGroup();
		_grpMenu.y = FlxG.height;
		_grpMenu.x = FlxG.width * 0.05;
		var rect:FlxSprite = new FlxSprite().makeGraphic(Std.int(FlxG.width * 0.9), Std.int(FlxG.height * 0.275), 0xCCFFFFFF);
		_grpMenu.add(rect);
		add(_grpMenu);
		
		new FlxTimer().start(0.7, tweenMenu, 1);
		
		initCombat();
		
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
	
	private function tweenMenu(t:FlxTimer):Void
	{
		FlxTween.tween(_grpMenu, {y: FlxG.height * 0.6,}, 1.4, {ease:FlxEase.elasticOut});
	}
	
}