package input;

import avatar.AvatarEntity;
import flixel.FlxBasic;
import flixel.util.FlxPoint;
import openfl.events.EventDispatcher;

/**
 * ...
 * @author 
 */
class AvatarControllerInput extends FlxBasic implements IAvatarController
{
	
	private var m_avatarEntity:AvatarEntity;

	public function new() 
	{
		super();
	}
	
	public function init( _avatarEntity:AvatarEntity )
	{
		dispatcher = new EventDispatcher();
		currentDirection = FlxPoint.get();
		
		m_avatarEntity = _avatarEntity;
	}
	
	/* INTERFACE input.IAvatarController */
	public var dispatcher(default, null):EventDispatcher;
	public var currentDirection(default, null):FlxPoint;
	
	override public function update():Void 
	{
		super.update();
	}
	
}