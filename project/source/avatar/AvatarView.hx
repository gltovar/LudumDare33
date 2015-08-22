package avatar;

import flixel.FlxSprite;
import flixel.util.FlxColor;
import flixel.util.FlxVector;

/**
 * ...
 * @author 
 */
class AvatarView extends FlxSprite implements IEntityComponent
{
	private var m_avatarEntity:AvatarEntity;

	public function new(X:Float=0, Y:Float=0, ?SimpleGraphic:Dynamic) 
	{
		super(X, Y, SimpleGraphic);
		
		makeGraphic(32, 32, FlxColor.BLUE);
		maxVelocity.set(Reg.AVATAR_MAX_VELOCITY, Reg.AVATAR_MAX_VELOCITY);
		drag.set( maxVelocity.x * Reg.AVATAR_DRAG_MULTIPLIER, maxVelocity.y * Reg.AVATAR_DRAG_MULTIPLIER);
		
		
	}
	
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
	
	public function updateAcceleration( _angle:FlxVector ):Void
	{
		if (_angle.length > 0.01)
		{
			//drag.set(0, 0);
			_angle.normalize();
			_angle.scale(Reg.AVATAR_MAX_VELOCITY * Reg.AVATAR_DRAG_MULTIPLIER);
			acceleration.set( _angle.x, _angle.y );
		}
		else
		{
			acceleration.set(0, 0);
			//drag.set(2000, 2000);
		}
		
	}
}