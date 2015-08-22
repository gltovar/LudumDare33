package;

import flixel.util.FlxSave;
import input.InputTypes;

/**
 * Handy, pre-built Registry class that can be used to store 
 * references to objects and other things for quick-access. Feel
 * free to simply ignore it or change it in any way you like.
 */
class Reg
{
	public static var INPUT_TYPES_LIST:Array<InputTypes> = [InputTypes.UP, InputTypes.DOWN, InputTypes.LEFT, InputTypes.RIGHT, InputTypes.ACTION_1, InputTypes.ACTION_2];
}