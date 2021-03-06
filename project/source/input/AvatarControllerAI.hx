package input;

import avatar.AvatarEntity;
import flixel.FlxBasic;
import flixel.util.FlxPath;
import flixel.util.FlxPoint;
import flixel.util.FlxRandom;
import flixel.util.FlxVector;
import openfl.events.EventDispatcher;
import room.RoomData;

/**
 * ...
 * @author 
 */
class AvatarControllerAI extends FlxBasic implements IAvatarController
{
	
	private var m_avatarEntity:AvatarEntity;

	private var m_localRoomsList:Array<RoomData>;
	
	private var m_currentRoomTarget:RoomData;
	
	private var m_currentPath:FlxPath;
	
	private var m_prevVector:FlxVector;
	
	public function new() 
	{
		super();
		
		m_localRoomsList = Reg.LIST_ROOM_DATA.copy();
		FlxRandom.shuffleArray(m_localRoomsList, m_localRoomsList.length * 2);
		
		m_currentPath = new FlxPath();
		m_currentPath.cancel();
		
		m_prevVector = new FlxVector();
		
	}
	
	/* INTERFACE input.IAvatarController */
	
	public var dispatcher(default, null):EventDispatcher;
	
	public function anyDirectionPressed():Bool 
	{
		return false;
	}
	
	override public function update():Void 
	{
		super.update();
		
		if (m_localRoomsList.length > 0 && m_currentPath.finished == true)
		{
			var l_currentRoomTarget:RoomData = m_localRoomsList.pop();
			
			var l_pathPoints:Array<FlxPoint> = Reg.MAP_WALLS.findPath( m_avatarEntity.view.getMidpoint(),  FlxPoint.weak( l_currentRoomTarget.x, l_currentRoomTarget.y) );
			
			if ( l_pathPoints != null )
			{
				m_currentPath.start( m_avatarEntity.view, l_pathPoints, m_avatarEntity.view.maxVelocity.x * .5, FlxPath.FORWARD );
			}
		}
		
		var l_currentVector:FlxVector = FlxVector.get(  m_avatarEntity.view.x - m_prevVector.x, m_avatarEntity.view.y - m_prevVector.y );
		if ( l_currentVector.length > 0.01)
		{
			m_avatarEntity.view.angle = l_currentVector.degrees;
		}
		
		
		m_prevVector.set( m_avatarEntity.view.x, m_avatarEntity.view.y);
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
	
}