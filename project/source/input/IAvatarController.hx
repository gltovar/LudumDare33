package input;
import flixel.util.FlxPoint;
import openfl.events.EventDispatcher;

/**
 * @author 
 */

interface IAvatarController extends IEntityComponent
{
	public var dispatcher(default, null):EventDispatcher;
	public var currentDirection(default, null):FlxPoint;
	public function update():Void;
}