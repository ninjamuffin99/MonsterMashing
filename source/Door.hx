package;

import flixel.FlxObject;

/**
 * ...
 * @author ninjaMuffin
 */
class Door extends FlxObject 
{
	
	public var doorID:Int = 0;

	public function new(X:Float = 0, Y:Float = 0, doorid:Int = 0) 
	{
		super(X, Y, 16, 16);
		
		doorID = doorid;
		
	}
	
}