package avatar.abilities;
import avatar.AvatarEntity;
import flixel.FlxBasic;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.util.FlxColor;
import flixel.util.FlxColorUtil;
import flixel.util.FlxPoint;
import flixel.util.FlxVector;

/**
 * so vision is based on line of sight, but has a long range
 * @author 
 */
class RegularVision extends FlxBasic implements IEntityComponent
{
	private var m_avatarEntity:AvatarEntity;
	private var m_viewLength:Float = 500;
	private var m_viewAngle:Float = 60;
	private var m_debugVisionSprite:FlxSprite;
	
	public function new() 
	{
		super();
		
		m_debugVisionSprite = new FlxSprite();
		m_debugVisionSprite.makeGraphic(15, 15, FlxColor.RED);
		Reg.LAYER_DEBUG.add(m_debugVisionSprite);
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
	
	override public function update():Void 
	{
		super.update();
		
		var l_lineToMonster:FlxVector = FlxVector.get( Reg.DEBUG_SPRITE_VIEW_TEST.x - m_avatarEntity.view.x, Reg.DEBUG_SPRITE_VIEW_TEST.y - m_avatarEntity.view.y);
		var l_canSeeMonster:Bool = false;
		
		if ( l_lineToMonster.length <= m_viewLength)
		{
			//trace(" AtM: " + l_lineToMonster.degrees + " vs Angle: " + m_avatarEntity.m_view.angle);
			if ( angleIsInsideRange( l_lineToMonster.degrees, m_avatarEntity.view.angle + m_viewAngle, m_avatarEntity.view.angle - m_viewAngle ) )
			{
				if ( Reg.MAP_WALLS.ray( m_avatarEntity.view.getMidpoint(), Reg.DEBUG_SPRITE_VIEW_TEST.getMidpoint() ) )
				{
					l_canSeeMonster = true;
				}
			}
		}
		
		m_debugVisionSprite.visible = l_canSeeMonster;
		m_debugVisionSprite.setPosition( m_avatarEntity.view.x, m_avatarEntity.view.y - 32);
		
		l_lineToMonster.put();
	}
	
	private function angleIsInsideRange( _angle:Float, _bounds1:Float, _bounds2:Float):Bool
	{
		var rAngle:Float = ( (_bounds2 - _bounds1) % 360.0 + 360.0 ) % 360.0;
		if ( rAngle >= 180.0 )
		{
			var temp:Float = _bounds1;
			_bounds1 = _bounds2;
			_bounds2 = temp;
		}
		
		if ( _bounds1 <= _bounds2 )
		{
			return _angle >= _bounds1 && _angle <= _bounds2;
		}
		else
		{
			return _angle >= _bounds1 || _angle <= _bounds2;
		}
	}
}