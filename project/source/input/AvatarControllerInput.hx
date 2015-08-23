package input;

import avatar.AvatarEntity;
import flixel.FlxBasic;
import flixel.util.FlxMath;
import flixel.util.FlxPoint;
import flixel.util.FlxVector;
import openfl.events.EventDispatcher;

/**
 * ...
 * @author 
 */
class AvatarControllerInput extends FlxBasic implements IAvatarController
{
	
	private var m_avatarEntity:AvatarEntity;
	private var m_directionalIsPressed:Bool;

	public function new() 
	{
		super();
	}
	
	/* INTERFACE IEntityComponent */
	public function SetEntity( _entity:IEntity ):Void
	{
		if ( Std.is( _entity, AvatarEntity ) )
		{
			m_avatarEntity = cast( _entity );
		}
		else
		{
			throw "AvatarView received a non avatar entity";
		}
	}
	
	/* INTERFACE input.IAvatarController */
	public var dispatcher(default, null):EventDispatcher;
	public function anyDirectionPressed():Bool
	{
		return m_directionalIsPressed;
	}
	
	override public function update():Void 
	{
		super.update();
		
		var l_angle:FlxVector = FlxVector.get();
		var l_axis:String;
		
		m_directionalIsPressed = false;
		for ( l_inputDirection in Reg.DIRECTIONAL_INPUT_TYPES_LIST )
		{
			
			if ( InputMap.WSAD.m_inputMap[ l_inputDirection ]() )
			{
				m_directionalIsPressed = true;
				l_axis = Reg.DIRECTION_VECTORS[l_inputDirection].m_axis;
				
				Reflect.setProperty(l_angle, l_axis, Reflect.getProperty( l_angle, l_axis ) + cast(Reg.DIRECTION_VECTORS[l_inputDirection].m_magnitude, Float) );
				
				//trace("DirectionPressed. Axis " + Reg.DIRECTION_VECTORS[l_inputDirection].m_axis + ": " + Reg.DIRECTION_VECTORS[l_inputDirection].m_magnitude );
			}
		}
		
		m_avatarEntity.m_view.updateAcceleration(l_angle);
		
		l_angle.put();
	}
	
}