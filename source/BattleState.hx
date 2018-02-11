package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.FlxSubState;
import flixel.addons.effects.chainable.FlxEffectSprite;
import flixel.addons.effects.chainable.FlxWaveEffect;
import flixel.group.FlxSpriteGroup;
import flixel.text.FlxText;
import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;
import flixel.ui.FlxBar;
import flixel.util.FlxColor;
import flixel.util.FlxTimer;
import openfl.geom.Matrix;
import openfl.geom.Point;
//import ui.Strings;
//import ui.StringIDs;

/**
 * ...
 * @author ninjaMuffin
 */
class BattleState extends FlxState 
{
	public static var outcome(default, null):Outcome;
	//public static var outcome:String;
	
	private var _sprScreen:FlxSprite;
	private var _sprEnemy:FlxSprite;
	
	private var _grpMenu:FlxSpriteGroup;
	private var _grpAttack:FlxSpriteGroup;
	
	private var attacking:Bool = false;
	private var tickMoveRight:Bool = true;
	private var isKey:Bool = false;
	
	private var enemyHP:Int = 10;
	private var playerHP:Int = 10;
	
	private var selector:FlxSprite;
	private var selectorPos:Int = 0;
	private var menuText:FlxText;
	
	//REFERING TO ENEMY'S HP!!
	private var hpBar:FlxBar;
	private var hpText:FlxText;
	
	private var playerHPBar:FlxBar;
	private var playerHPText:FlxText;
	
	private var attackTick:FlxSprite;
	private var attackCrit:FlxSprite;
	private var attackMid:FlxSprite;
	private var attackBar:FlxSprite;
	
	//The Girls
	private var enemyPath:String;
	private var mushGirl:String = AssetPaths.spr_mush_new__png;
	private var sixerGirl:String = AssetPaths.spr_mush__png;
	private var batGirl:String = AssetPaths.spr_mush__png;
	private var mummyGirl:String = AssetPaths.spr_mush__png;
	
	/*
	public function new(BGColor:FlxColor=FlxColor.TRANSPARENT) 
	{
		super(BGColor);
	}
	*/
	override public function create():Void 
	{
		_sprScreen = new FlxSprite().makeGraphic(FlxG.width, FlxG.height, FlxColor.TRANSPARENT);
		var waveEffect = new FlxWaveEffect(FlxWaveMode.ALL, 4, -1, 4);
		var waveSprite = new FlxEffectSprite(_sprScreen, [waveEffect]);
		add(waveSprite);
		
		/*switch(enemyPath) 
		{
			case :
				
			default:mushGirl;
				
		}*/
		
		enemyPath = mushGirl;
		_sprEnemy = new FlxSprite(150, 20).loadGraphic(enemyPath, false, 800, 1200);
		/*
		 * resizes the graphic to half, retaining its aspect ratio
		 * if you do this make sure you call updateHitbox() afterwards!
		_sprEnemy.setGraphicSize(_sprEnemy.width / 2);
		_sprEnemy.updateHitbox();
		*/
		_sprEnemy.alpha = 0;
		add(_sprEnemy);
		
		hpBar = new FlxBar(_sprEnemy.x, _sprEnemy.y - 30, FlxBarFillDirection.LEFT_TO_RIGHT, 200, 20, this, "enemyHP", 0, 10);
		add(hpBar);
		
		initMenu();
		initAttackMenu();
		initCombat();

		/*if (supRound = true){

		if (supRound = true){

			enemyHP = 8;
		}
		*/
		
		new FlxTimer().start(0.7, tweenMenu, 1);
		
		super.create();
		//Strings.instance.init();
	}
	
	private function initMenu():Void
	{
		_grpMenu = new FlxSpriteGroup();
		_grpMenu.y = FlxG.height;
		_grpMenu.x = FlxG.width * 0.05;
		var rect:FlxSprite = new FlxSprite().makeGraphic(Std.int(FlxG.width * 0.9), Std.int(FlxG.height * 0.2), 0xCCFFFFFF);
		_grpMenu.add(rect);
		add(_grpMenu);
		
		//Pull from XML "Attack\nFuck\nRun"
		menuText = new FlxText(100, 16, 0, "Attack\nFuck\nRun", 32);
		menuText.color = FlxColor.BLACK;
		_grpMenu.add(menuText);
		
		playerHPBar = new FlxBar(16, 8, FlxBarFillDirection.BOTTOM_TO_TOP, 32, 100, this, "playerHP", 0, 10);
		_grpMenu.add(playerHPBar);
		
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
		
		//Setup Hit Bar sizes
		attackBar = new FlxSprite().makeGraphic(400, 30, 0xffffffff);
		_grpAttack.add(attackBar);
		
		attackMid = new FlxSprite().makeGraphic(240, 30, 0xff000000);
		attackMid.x = (attackBar.width / 2) - (attackMid.width / 2);
		_grpAttack.add(attackMid);
		
		attackCrit = new FlxSprite().makeGraphic(15, 30, 0xff545454);
		attackCrit.x = (attackBar.width / 2) - (attackCrit.width / 2);
		_grpAttack.add(attackCrit);
		
		attackTick = new FlxSprite().makeGraphic(8, 16, 0xffd12912);
		_grpAttack.add(attackTick);
		
		_grpAttack.kill();
	}
	
	public function initCombat():Void
	{
		outcome = NONE;
		
		_sprScreen.drawFrame();
		var screenPixels = _sprScreen.framePixels;
		
		if (FlxG.renderBlit)
			screenPixels.copyPixels(FlxG.camera.buffer, FlxG.camera.buffer.rect, new Point());
		else
			screenPixels.draw(FlxG.camera.canvas, new Matrix(1, 0, 0, 1, 0, 0));
		
		FlxTween.tween(_sprEnemy, {y: -15, alpha: 1}, 1, {ease:FlxEase.cubeInOut});
	}
	
	override public function update(elapsed:Float):Void 
	{
		super.update(elapsed);
		
		//HP Position
		hpBar.x = 120;
		hpBar.y = _sprEnemy.y + 90;
		
		if (_sprEnemy.alpha == 1){
			isKey = true;
		}
		
		selectorUpdate();
		
		if (_grpAttack.alive && attacking && enemyHP > 0){
			//Loop left to right
			var tickSpeed:Float = 4;
			if (attackTick.x >= (attackBar.x + attackBar.width)){
				tickMoveRight = false;
			}else if (attackTick.x <= attackBar.x){
				tickMoveRight = true;
			}
			
			//Attack Bar
			var tickSpeed:Float = 12;
			var speedBuffer:Float = tickSpeed;
			
			//Speed up on low enemy health
			if (enemyHP <= 6){
				tickSpeed = speedBuffer * 1.5;
				speedBuffer = tickSpeed;
			}else if (enemyHP <= 2){
				tickSpeed = speedBuffer * 2;
				speedBuffer = tickSpeed;
			}
			
			//Slow your roll, health is low
			if (playerHP <= 6){
				tickSpeed = speedBuffer * 0.8;
				speedBuffer = tickSpeed;
			}else if(playerHP <= 2){
				tickSpeed = speedBuffer * 0.4;
				speedBuffer = tickSpeed;
			}
			
			if (tickMoveRight)
				attackTick.x += tickSpeed;
			else
				attackTick.x -= tickSpeed;
			
			if (FlxG.keys.justPressed.X){
				if (FlxG.overlap(attackMid, attackTick)){
					enemyHP -= 2;
					
					if (FlxG.overlap(attackCrit, attackTick)){
						enemyHP -= 2;
					}
					
					FlxG.log.add(enemyHP);
					attacking = false;
					
					//FlxTween.tween(_sprEnemy, { x: _sprEnemy.x * 1.5 }, .1, {onComplete: function(_){
						//FlxTween.tween(_sprEnemy, { x: _sprEnemy.x / 1.5 }, .1);}});
					//Char Shake
					FlxTween.tween(_sprEnemy, {x: FlxG.height * (-.1)}, .1, {onComplete: function(_)
						{FlxTween.tween(_sprEnemy, {x: FlxG.height * 1.2}, .15, {onComplete: function(_)
						{FlxTween.tween(_sprEnemy, {x: FlxG.height * .15 + 48}, .5, {ease:FlxEase.elasticOut});}});}});
					/*_sprEnemy.color = 0xd12912;
					var i:Int = 0;
					while (i < 10) {
						i++;
					}
					if (i == 10){
						_sprEnemy.color = 0xffffff;
						i = 0;
					}*/
						
					playerHP -= FlxG.random.int(0, 2);
				}else{
					attacking = false;
				}
			}
		}else if (_grpAttack.alive){
			new FlxTimer().start(1, killAttacks);
		}else if(enemyHP <= 0){
			attacking = false;
			outcome = VICTORY;
			FlxG.switchState(new PlayState());
		}
	}
	
	private function selectorUpdate():Void
	{
		if (FlxG.keys.justPressed.UP && isKey == true)
		{
			selectorPos -= 1;
		}
		if (FlxG.keys.justPressed.DOWN && isKey == true)
		{
			selectorPos += 1;
		}
		
		//Takes the remainder to establish pos
		selectorPos = (selectorPos + 3) % 3;
		
		/*
		if (selectorPos < 0)
		{
			selectorPos = 2;
		}
		if (selectorPos > 2)
		{
			selectorPos = 0;
		}*/
		
		//Attack Option
		if (selectorPos == 0 && _grpMenu.alive){
			selector.y = 445;
			
			if (FlxG.keys.justPressed.Z && isKey == true){
				//Delay Z press
				var i:Int = 0;
				while (i < 10) {
					i++;
				}
				if (i == 10){
					_grpMenu.kill();
					_grpAttack.revive();
					attacking = true;
					i = 0;
				}
			}

		}
		
		//**** Option
		if (selectorPos == 1 && _grpMenu.alive){
			selector.y = 480;
			
			if(FlxG.keys.justPressed.Z && isKey == true){
				FlxG.switchState(new RhythmState());
			}
		}
		
		//Escape Option
		if (selectorPos == 2 && _grpMenu.alive){
			selector.y = 520;
			
			if (FlxG.keys.justPressed.Z && isKey == true){
				FlxG.switchState(new PlayState());
			}
		}
		
		//selector.y = (35 * selectorPos) + 20 + _grpMenu.y;
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

enum Outcome
{
	NONE;
	ESCAPE;
	VICTORY;//COMPLETION
	DEFEAT;//SUBMISSION
}