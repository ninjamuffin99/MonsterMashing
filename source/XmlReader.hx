package;

import haxe.xml.Fast;
import openfl.Assets;

/**
 * ...
 * @author brandybuizel
 */
class Strings 
{
	//Some magic that uses the xml dialogue data
	private function new(){}
	
	public static var instance(get, null):Strings;
	
	private static function get_instance():Strings{
		if(instance == null){
		   instance = new Strings();
		}
		return instance;
	}	
}