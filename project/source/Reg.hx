package;

import avatar.AvatarEntity;
import avatar.AvatarView;
import flixel.FlxSprite;
import flixel.group.FlxTypedGroup;
import flixel.tile.FlxTilemap;
import flixel.util.FlxSave;
import input.DirectionVector;
import input.InputTypes;
import item.ItemEntity;
import room.RoomData;

/**
 * Handy, pre-built Registry class that can be used to store 
 * references to objects and other things for quick-access. Feel
 * free to simply ignore it or change it in any way you like.
 */
class Reg
{
	//public static var DEBUG_SPRITE_VIEW_TEST:FlxSprite;
	public static var ENTITY_MONSTER:AvatarEntity;
	
	
	public static var AVATAR_MAX_VELOCITY:Float = 300;
	public static var AVATAR_DRAG_MULTIPLIER:Float = 8;
	
	public static var LIST_ROOM_DATA:Array<RoomData>;
	
	public static var LIST_ENTITY_ITEMS:Array<ItemEntity>;
	public static var LIST_ENTITY_AVATARS:Array<AvatarEntity>;
	public static var LIST_ENTITY_AVATARS_VICTIMS:Array<AvatarEntity>;
	
	public static var MAP_FLOOR:FlxTilemap;
	public static var MAP_WALLS:FlxTilemap;
	public static var MAP_VENTS:FlxTilemap;
	
	public static var LAYER_AVATAR_VIEWS:FlxTypedGroup<AvatarView>;
	public static var LAYER_ITEM_VIEWS:FlxTypedGroup<FlxSprite>;
	public static var LAYER_NOISE_COLLIDERS:FlxTypedGroup<FlxSprite>;
	public static var LAYER_DEBUG:FlxTypedGroup<FlxSprite>;
	
	
	
	public static var INPUT_TYPES_LIST:Array<InputTypes> = [InputTypes.UP, InputTypes.DOWN, InputTypes.LEFT, InputTypes.RIGHT, InputTypes.ACTION_1, InputTypes.ACTION_2];
	public static var DIRECTIONAL_INPUT_TYPES_LIST:Array<InputTypes> = [InputTypes.UP, InputTypes.DOWN, InputTypes.LEFT, InputTypes.RIGHT];
	public static var ACTION_INPUT_TYPES_LIST:Array<InputTypes> = [InputTypes.ACTION_1, InputTypes.ACTION_2];	
	public static var DIRECTION_VECTORS:Map< InputTypes, DirectionVector > = [ 	InputTypes.UP => new DirectionVector("y", -1),
																				InputTypes.DOWN => new DirectionVector("y", 1),
																				InputTypes.LEFT => new DirectionVector("x", -1),
																				InputTypes.RIGHT => new DirectionVector("x", 1) ];
}