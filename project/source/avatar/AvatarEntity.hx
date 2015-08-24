package avatar;

import avatar.abilities.RegularVision;
import flixel.FlxBasic;
import flixel.FlxG;
import flixel.FlxSprite;
import input.AvatarControllerAI;
import input.AvatarControllerInput;
import input.IAvatarController;

/**
 * ...
 * @author 
 */
class AvatarEntity extends FlxBasic implements IEntity
{

	private var m_isPlayer:Bool;
	
	public var m_controller:IAvatarController;
	public var view(default, null):FlxSprite;
	
	public function getAvatarView():AvatarView { return cast(view); }
	
	public var m_regularVision:RegularVision;
	
	public function new( _isPlayer:Bool = false ) 
	{
		super();
		
		m_isPlayer = _isPlayer;
		
		view = new AvatarView();
		getAvatarView().SetEntity(this);
		
		view.setPosition(32, 32);
		
		FlxG.camera.follow(view);
		
		if ( _isPlayer )
		{
			m_controller = new AvatarControllerInput();
		}
		else
		{
			m_controller = new AvatarControllerAI();
		}
		m_controller.SetEntity(this);
		
		if ( m_isPlayer == false )
		{
			m_regularVision = new RegularVision();
			m_regularVision.SetEntity(this);
		}
		
		Reg.LIST_ENTITY_AVATARS.push(this);
		Reg.LAYER_AVATAR_VIEWS.add(getAvatarView());
		
	}
	
	override public function update():Void 
	{
		super.update();
		
		m_controller.update();
		if (m_isPlayer == false)
		{
			m_regularVision.update();
		}
	}	
	
}