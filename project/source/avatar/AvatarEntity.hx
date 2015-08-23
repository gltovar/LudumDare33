package avatar;

import avatar.abilities.RegularVision;
import flixel.FlxBasic;
import flixel.FlxG;
import input.AvatarControllerInput;
import input.IAvatarController;

/**
 * ...
 * @author 
 */
class AvatarEntity extends FlxBasic implements IEntity
{

	public var m_controller:IAvatarController;
	public var m_view:AvatarView;
	
	public var m_regularVision:RegularVision;
	
	public function new() 
	{
		super();
		
		m_view = new AvatarView();
		m_view.SetEntity(this);
		
		FlxG.camera.follow(m_view);
		
		m_controller = new AvatarControllerInput();
		m_controller.SetEntity(this);
		
		m_regularVision = new RegularVision();
		m_regularVision.SetEntity(this);
		
		Reg.ENTITY_LIST_AVATARS.push(this);
		Reg.LAYER_AVATAR_VIEWS.add(m_view);
		
	}
	
	override public function update():Void 
	{
		super.update();
		
		m_controller.update();
		m_regularVision.update();
	}
	
}