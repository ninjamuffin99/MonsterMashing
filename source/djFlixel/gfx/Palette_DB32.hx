package djFlixel.gfx;


/**
 * The DB32 color palette
 * Static Class Helper
 * -----
 * @info http://pixeljoint.com/forum/forum_posts.asp?TID=16247
 * 
 */
 class Palette_DB32
{
	// In the order they are in Aseprite
	public static var COL:Array<Int> = [
		0xff000000, 0xff222034,
		0xff45283c, 0xff663931, 0xff8f563b, 0xffdf7126, 0xffd9a066, 0xffeec39a,
		0xfffbf236, 0xff99e550, 0xff6abe30, 0xff37946e, 0xff4b692f, 0xff524b24,
		0xff323c39, 0xff3f3f74, 0xff306082, 0xff5b6ee1, 0xff639bff, 0xff5fcde4,
		0xffcbdbfc, 0xffffffff, 0xff9badb7, 0xff847e87, 0xff696a6a, 0xff595652,
		0xff76428a, 0xffac3232, 0xffd95763, 0xffd77bba, 0xff8f974a, 0xff8a6f30
	];
	
	// What the editor says + 1
	public static inline var COL_01:Int = 0xff000000;
	public static inline var COL_02:Int = 0xff222034;
	public static inline var COL_03:Int = 0xff45283c;
	public static inline var COL_04:Int = 0xff663931;
	public static inline var COL_05:Int = 0xff8f563b;
	public static inline var COL_06:Int = 0xffdf7126;
	public static inline var COL_07:Int = 0xffd9a066;
	public static inline var COL_08:Int = 0xffeec39a;
	public static inline var COL_09:Int = 0xfffbf236;
	public static inline var COL_10:Int = 0xff99e550;
	public static inline var COL_11:Int = 0xff6abe30;
	public static inline var COL_12:Int = 0xff37946e;
	public static inline var COL_13:Int = 0xff4b692f;
	public static inline var COL_14:Int = 0xff524b24;
	public static inline var COL_15:Int = 0xff323c39;
	public static inline var COL_16:Int = 0xff3f3f74;
	public static inline var COL_17:Int = 0xff306082;
	public static inline var COL_18:Int = 0xff5b6ee1;
	public static inline var COL_19:Int = 0xff639bff;
	public static inline var COL_20:Int = 0xff5fcde4;
	public static inline var COL_21:Int = 0xffcbdbfc;
	public static inline var COL_22:Int = 0xffffffff;
	public static inline var COL_23:Int = 0xff9badb7;
	public static inline var COL_24:Int = 0xff847e87;
	public static inline var COL_25:Int = 0xff696a6a;
	public static inline var COL_26:Int = 0xff595652;
	public static inline var COL_27:Int = 0xff76428a;
	public static inline var COL_28:Int = 0xffac3232;
	public static inline var COL_29:Int = 0xffd95763;
	public static inline var COL_30:Int = 0xffd77bba;
	public static inline var COL_31:Int = 0xff8f974a;
	public static inline var COL_32:Int = 0xff8a6f30;
	//---------------------------------------------------;
	
	// Store some 3 colored combinations.
	// Mainly used for the FutureKnight game, might be removed.
	public static var colorCombo:Map<String,Array<Int>>;
	
	// The entire available color palettes
	// #AUTOGENERATED
	public static var availCombos(default, null):Array<String>;

	// --
	static var isInited = false;
	
	//====================================================;
	//  FUNCTIONS
	//====================================================;
	
	// --
	// Create palette color combinations
	public static function init()
	{
		if (isInited) return; 
			isInited = true;
		
		/// TODO: Color combos do not belong to the generic DB32 class
		///		  it is a game specific thing..
		
		// Create 3 colored Combinations
		colorCombo = new Map();
		colorCombo.set("red", 		[COL_08, COL_29, COL_04]);
		colorCombo.set("green", 	[COL_10, COL_12, COL_15]);
		colorCombo.set("blue",  	[COL_21, COL_20, COL_17]);
		colorCombo.set("yellow",   	[COL_22, COL_09, COL_05]);
		colorCombo.set("orange",   	[COL_09, COL_06, COL_03]);
		colorCombo.set("pink",   	[COL_08, COL_30, COL_03]);
		colorCombo.set("purple",   	[COL_30, COL_27, COL_02]);
		colorCombo.set("gray", 		[COL_21, COL_23, COL_15]);
		colorCombo.set("white", 	[COL_22, COL_21, COL_23]);
		
		colorCombo.set("redDark",	[COL_29, COL_28, COL_04]);
		colorCombo.set("blueDark", 	[COL_19, COL_16, COL_02]);
		colorCombo.set("greenDark",	[COL_14, COL_15, COL_02]);
		colorCombo.set("grayDark", 	[COL_25, COL_26, COL_15]);
		colorCombo.set("black", 	[COL_26, COL_02, COL_01]);
		
		colorCombo.set("brown", 	[COL_08, COL_07, COL_05]);
		colorCombo.set("brownDark", [COL_05, COL_04, COL_03]);
		
		// Fill in the available Combos
		availCombos = [];
		for (i in colorCombo.keys()) {
			availCombos.push(i);
		}
		
	}//---------------------------------------------------;
	// --
	// Whether or not this color is dark.
	// User set, not automatic check :-|
	//public static function paletteIsDark(pal:String):Bool
	//{
		//return (darkColors.indexOf(pal) >= 0);
	//}//---------------------------------------------------;
	
	// -- 
	// Return a random name name of a combo
	public inline static function getRandomCombo():String
	{
		return availCombos[Std.random(availCombos.length)];
	}//---------------------------------------------------;
	
	// --
	public static function random():Int
	{
		return COL[Std.random(COL.length)];
	}//---------------------------------------------------;
	
}// -- end -- //
