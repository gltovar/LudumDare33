package item;
import flixel.FlxBasic;
import flixel.FlxSprite;
import flixel.util.FlxColor;
import flixel.util.FlxColorUtil;

/**
 * ...
 * @author 
 */
class ItemEntity extends FlxBasic implements IEntity
{

	public var noiseMaker:NoiseMakerComponent;
	
	public function new() 
	{
		super();
		
		view = new FlxSprite(500, 350);
		view.makeGraphic(16, 16);
		view.color = FlxColorUtil.getRandomColor();
		Reg.LAYER_ITEM_VIEWS.add(view);
		
		noiseMaker = new NoiseMakerComponent();
		noiseMaker.SetEntity(this);
	}
	
	/* INTERFACE IEntity */
	
	public var view(default, null):FlxSprite;
	
	override public function update():Void 
	{
		super.update();
		
		noiseMaker.update();
	}
	
}