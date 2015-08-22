package avatar;

import flixel.FlxBasic;
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
	
	public function new() 
	{
		super();
		
		m_view = new AvatarView();
		m_view.SetEntity(this);
		
		m_controller = new AvatarControllerInput();
		m_controller.SetEntity(this);
		
		Reg.ENTITY_LIST_AVATARS.push(this);
		Reg.LAYER_AVATAR_VIEWS.add(m_view);
		
	}
	
	override public function update():Void 
	{
		super.update();
		
		m_controller.update();
	}
	
}