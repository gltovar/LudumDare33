package avatar;

import avatar.abilities.RegularVision;
import flixel.FlxBasic;
import flixel.FlxG;
import flixel.FlxSprite;
import input.AvatarControllerInput;
import input.IAvatarController;

/**
 * ...
 * @author 
 */
class AvatarEntity extends FlxBasic implements IEntity
{

	public var m_controller:IAvatarController;
	public var view(default, null):FlxSprite;
	
	public function getAvatarView():AvatarView { return cast(view); }
	
	public var m_regularVision:RegularVision;
	
	public function new() 
	{
		super();
		
		view = new AvatarView();
		getAvatarView().SetEntity(this);
		
		view.setPosition(32, 32);
		
		FlxG.camera.follow(view);
		
		m_controller = new AvatarControllerInput();
		m_controller.SetEntity(this);
		
		m_regularVision = new RegularVision();
		m_regularVision.SetEntity(this);
		
		Reg.ENTITY_LIST_AVATARS.push(this);
		Reg.LAYER_AVATAR_VIEWS.add(getAvatarView());
		
	}
	
	override public function update():Void 
	{
		super.update();
		
		m_controller.update();
		m_regularVision.update();
	}
	
}