package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.group.FlxGroup;
import flixel.system.FlxSound;

/**
 * ...
 * @author ninjaMuffin
 */
class RhythmState extends FlxState 
{
	private var song:FlxSound;
	private var bar:FlxSprite;
	private var grpNotes:FlxTypedGroup<Note>;
	
	override public function create():Void 
	{
		song = new FlxSound();
		song.loadEmbedded("assets/music/1683_newgrounds_lhm__e.mp3", false, false, function(){FlxG.resetState(); });
		add(song);
		song.play();
		
		bar = new FlxSprite(0, 20);
		bar.makeGraphic(FlxG.width, 5);
		add(bar);
		
		grpNotes = new FlxTypedGroup<Note>();
		add(grpNotes);
		
		for (i in 0...FlxG.random.int(5, 10))
		{
			var newNote:Note;
			newNote =  new Note(40);
			newNote.strumTime = FlxG.random.float(0, 8000);
			grpNotes.add(newNote);
		}
		
		
		super.create();
	}
	
	override public function update(elapsed:Float):Void 
	{
		
		if (FlxG.keys.justPressed.ONE)
		{
			FlxG.switchState(new PlayState());
		}
		
		Conductor.songPos = song.time;
		
		grpNotes.forEachAlive(noteFall);
		
		super.update(elapsed);
	}
	
	private function noteFall(note:Note)
	{
		note.y = bar.y - (Conductor.songPos - note.strumTime);
	}
}