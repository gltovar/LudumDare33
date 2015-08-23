package input;
import flixel.util.FlxPoint;
import openfl.events.EventDispatcher;

/**
 * @author 
 */

interface IAvatarController extends IEntityComponent
{
	var dispatcher(default, null):EventDispatcher;
	function anyDirectionPressed():Bool;
	function update():Void;
}