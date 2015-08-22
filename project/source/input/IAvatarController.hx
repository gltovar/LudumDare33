package input;
import openfl.events.EventDispatcher;

/**
 * @author 
 */

interface IAvatarController 
{
	public var dispatcher(default, null):EventDispatcher;
	public var currentDirection(default, null):Float;
	public function update():Void;
}