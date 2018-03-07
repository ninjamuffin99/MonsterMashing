//SHOUTOUTS TO GAMEPOPPER FOR THE BALLIN TUTORIAL
//https://gamepopper.co.uk/2014/08/26/haxeflixel-making-a-custom-preloader/


package;

import flixel.FlxG;
import flixel.system.FlxBasePreloader;
import flash.display.*;
import flash.text.*;
import flash.Lib;
import flixel.text.FlxText;
import io.newgrounds.NG;
import lime.audio.FlashAudioContext;
import openfl.display.Sprite;
import flash.text.Font;
import flash.text.TextField;
import flash.text.TextFormat;
/*
import com.newgrounds.*;
import com.newgrounds.components.*;
*/

/**
 * ...
 * @author ninjaMuffin
 */
class Preloader extends FlxBasePreloader 
{

	public function new(MinDisplayTime:Float=2, ?AllowedURLs:Array<String>) 
	{
		super(MinDisplayTime, AllowedURLs);
	}
	
	var logo:Sprite;
	var bg:Sprite;
	var text:TextField;
	
	override function create():Void 
	{	
		this._width = Lib.current.stage.stageWidth;
		this._height = Lib.current.stage.stageHeight;
		
		var ratio:Float = this._width / 800; //This allows us to scale assets depending on the size of the screen.
		
		//logo = new Sprite();
		//logo.addChild(new Bitmap(new LogoImage(0, 0))); //Sets the graphic of the sprite to a bitmap object, which uses our embedded bitmapData class
		//logo.scaleX = logo.scaleY = ratio;
		//logo.x = ((this._width) / 2) - ((logo.width) / 2);
		//logo.y = (this._height / 2) - ((logo.height) / 2);
		//addChild(logo);
		/*
		var font:CustomFont = new CustomFont();
		
		Font.registerFont(CustomFont);
		text = new TextField();
		text.defaultTextFormat = new TextFormat(font.fontName, 24, 0xffffff, false, false, false, "", "", TextFormatAlign.CENTER);
		text.embedFonts = true;
		text.selectable = false;
		text.multiline = false;
		text.x = 0;
		text.y = 5.2 * this._height / 6;
		text.width = _width;
		text.height = Std.int(32 * ratio);
		text.text = "Loading";
		addChild(text);
		*/
		/*
		NG.createAndCheckSession(this.stage, APIStuff.APIID);
		
		if (!NG.core.loggedIn)
		{
			NG.core.requestLogin(function():Void { trace("logged on"); });
		}
		
		NG.core.initEncryption(APIStuff.EncKey);
		*/
		/*
		#if (flash)
			API.connect(root, APIStuff.APIID, APIStuff.EncKey);
			
			if (API.isNewgrounds)
			{
				var ad:FlashAd = new FlashAd();
				ad.x = (_width / 2) - (ad.width/2);
				ad.y = (_width / 2.5) - (ad.height/2);
				addChild(ad);
				minDisplayTime = 8;
			}
		#end
		*/
		
		super.create();
	}
	
	
	override function update(Percent:Float):Void
	{
		//text.text = "Loading " + Std.int(Percent * 100) + "%";
		super.update(Percent);
		
	}
	
}
