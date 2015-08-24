package item;
import flixel.FlxBasic;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.util.FlxColor;
import flixel.util.FlxColorUtil;
import flixel.util.FlxMath;
import flixel.util.FlxPoint;
import flixel.util.FlxRandom;
import flixel.util.FlxSpriteUtil;
import avatar.AvatarView;
import flixel.util.FlxVector;

/**
 * ...
 * @author 
 */
class NoiseMakerComponent extends FlxBasic implements IEntityComponent
{
	private var m_itemEntity:ItemEntity;
	private var m_soundRadius:Float = 75;
	private var m_soundCollisionSprite:FlxSprite;
	
	private var m_pixelPerfectOverlap:Bool;
	
	public function new() 
	{
		super();
		
		m_soundRadius = FlxRandom.floatRanged(75, 250);
		
		m_soundCollisionSprite = new FlxSprite(0, 0);
		m_soundCollisionSprite.makeGraphic(cast(m_soundRadius*2), cast(m_soundRadius*2), FlxColor.TRANSPARENT);
		
		
		
		Reg.LAYER_NOISE_COLLIDERS.add(m_soundCollisionSprite);
	}
	
	/* INTERFACE IEntityComponent */
	
	public function SetEntity(_entity:IEntity):Void 
	{
		if (Std.is(_entity, ItemEntity))
		{
			m_itemEntity = cast(_entity);
			
			FlxSpriteUtil.drawCircle(m_soundCollisionSprite, -1, -1, m_soundRadius, FlxColor.WHITE);
			m_soundCollisionSprite.alpha = .25;
			m_soundCollisionSprite.color = m_itemEntity.view.color;
			m_soundCollisionSprite.setSize(m_soundRadius * 2, m_soundRadius * 2);
			m_soundCollisionSprite.centerOffsets();
			m_soundCollisionSprite.centerOrigin();
			
		}
		else
		{
			throw "entity passed in was not ItemEntity";
		}
	}
	
	override public function update():Void 
	{
		super.update();
		//emitSound();
		
		m_soundCollisionSprite.visible = emitSound();
	}
	
	public function emitSound():Bool
	{
		var midPoint:FlxPoint = m_itemEntity.view.getMidpoint();
		m_soundCollisionSprite.setPosition(midPoint.x - m_soundRadius, midPoint.y - m_soundRadius);
		
		m_pixelPerfectOverlap = false;
		
		FlxG.overlap(m_soundCollisionSprite, Reg.LAYER_AVATAR_VIEWS, onAvatarOverlap);
		
		return m_pixelPerfectOverlap;
	}
	
	private function onAvatarOverlap( item:FlxSprite, avatar:FlxSprite ):Void
	{
		if ( FlxMath.distanceBetween(item, avatar) <= m_soundRadius )
		{
			m_pixelPerfectOverlap = true;
		}
	}
	
}