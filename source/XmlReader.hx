package;

/**
 * ...
 * @author ...
 */
class XmlReader 
{
	//Some magic that uses the xml dialogue data
	public static function new() 
	{
		var xml:Xml = Assets.getText("assets/data/dialogue.xml");
		Xml.parse(xml);
		
		var fast:Fast = new Fast(xml.firstElement());
		trace(fast.id.0);
	}
	
}