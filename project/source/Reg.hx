package;

import avatar.AvatarEntity;
import avatar.AvatarView;
import flixel.group.FlxTypedGroup;
import flixel.util.FlxSave;
import input.DirectionVector;
import input.InputTypes;

/**
 * Handy, pre-built Registry class that can be used to store 
 * references to objects and other things for quick-access. Feel
 * free to simply ignore it or change it in any way you like.
 */
class Reg
{
	public static var AVATAR_MAX_VELOCITY:Float = 300;
	public static var AVATAR_DRAG_MULTIPLIER:Float = 8;
	
	
	public static var ENTITY_LIST_AVATARS:Array<AvatarEntity>;
	
	
	public static var LAYER_AVATAR_VIEWS:FlxTypedGroup<AvatarView>;
	
	
	public static var INPUT_TYPES_LIST:Array<InputTypes> = [InputTypes.UP, InputTypes.DOWN, InputTypes.LEFT, InputTypes.RIGHT, InputTypes.ACTION_1, InputTypes.ACTION_2];
	public static var DIRECTIONAL_INPUT_TYPES_LIST:Array<InputTypes> = [InputTypes.UP, InputTypes.DOWN, InputTypes.LEFT, InputTypes.RIGHT];
	public static var ACTION_INPUT_TYPES_LIST:Array<InputTypes> = [InputTypes.ACTION_1, InputTypes.ACTION_2];	
	public static var DIRECTION_VECTORS:Map< InputTypes, DirectionVector > = [ 	InputTypes.UP => new DirectionVector("y", -1),
																				InputTypes.DOWN => new DirectionVector("y", 1),
																				InputTypes.LEFT => new DirectionVector("x", -1),
																				InputTypes.RIGHT => new DirectionVector("x", 1) ];
}