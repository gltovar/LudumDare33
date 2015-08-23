package avatar.abilities;

import avatar.AvatarEntity;
import flixel.effects.FlxSpriteFilter;
import flixel.FlxBasic;
import flixel.FlxSprite;
import flixel.util.FlxColor;
import flixel.util.FlxVector;

/**
 * hearing doesn't have a line of sight but has a shorter range
 * @author 
 */
class RegularHearing extends FlxBasic implements IEntityComponent
{
	
	private var m_avatarEntity:AvatarEntity;
	private var m_hearingLength = 150;
	private var m_debugHearingSprite:FlxSprite

	public function new() 
	{
		super();
		
		m_debugHearingSprite = new FlxSprite();
		m_debugHearingSprite.makeGraphic( 15, 15, FlxColor.BLUE );
		Reg.LAYER_DEBUG.add( m_debugHearingSprite );
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
		
		if ( l_lineToMonster.length <= m_hearingLength )
		{
			
		}
	}
	
}