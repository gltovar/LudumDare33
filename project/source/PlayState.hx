package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.util.FlxMath;
import input.InputMap;

/**
 * A FlxState which can be used for the actual gameplay.
 */
class PlayState extends FlxState
{
	/**
	 * Function that is called up when to state is created to set it up. 
	 */
	override public function create():Void
	{
		super.create();
		
		var test:FlxText = new FlxText(100, 200, 100, "PLAY STATE");
		
		add(test);
	}
	
	/**
	 * Function that is called when this state is destroyed - you might want to 
	 * consider setting all objects this state uses to null to help garbage collection.
	 */
	override public function destroy():Void
	{
		super.destroy();
	}

	/**
	 * Function that is called once every frame.
	 */
	override public function update():Void
	{
		super.update();
		
		for ( l_direction in Reg.DIRECTIONAL_INPUT_TYPES_LIST )
		{
			if ( InputMap.WSAD.m_inputMap[ l_direction ]() )
			{
				trace("DirectionPressed. Axis " + Reg.DIRECTION_VECTORS[l_direction].m_axis + ": " + Reg.DIRECTION_VECTORS[l_direction].m_magnitude );
			}
		}
		
		FlxG.keys.reset(); // might be a bug fix here for keys.  asked: http://haxeflixel.com/forum/
	}	
}