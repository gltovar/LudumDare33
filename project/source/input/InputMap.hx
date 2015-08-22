package input;
import flixel.FlxG;

/**
 * ...
 * @author 
 */
class InputMap
{
	static public var WSAD:InputMap = new InputMap( function():Bool { return FlxG.keys.pressed.W; },
													function():Bool { return FlxG.keys.pressed.S; },
													function():Bool { return FlxG.keys.pressed.A; },
													function():Bool { return FlxG.keys.pressed.D; },
													function():Bool { return FlxG.keys.pressed.K; },
													function():Bool { return FlxG.keys.pressed.L; });
	
	public var inputMap:Map< InputTypes, Void->Bool >;
	
	private var m_up:Void->Bool;
	private var m_down:Void->Bool;
	private var m_left:Void->Bool;
	private var m_right:Void->Bool;
	private var m_action1:Void->Bool;
	private var m_action2:Void->Bool;
	
	public function new( _up:Void->Bool, _down:Void->Bool, _left:Void->Bool, _right:Void->Bool, _action1:Void->Bool, _action2:Void->Bool )
	{
		inputMap = new Map< InputTypes, Void->Bool >();
		
		m_up = _up;
		m_down = _down;
		m_left = _left;
		m_right = _right;
		m_action1 = _action1;
		m_action2 = _action2;
		
		inputMap[InputTypes.UP] = function():Bool{ return m_up(); };
		inputMap[InputTypes.DOWN] = function():Bool{ return m_down(); };
		inputMap[InputTypes.LEFT] = function():Bool{ return m_left(); };
		inputMap[InputTypes.RIGHT] = function():Bool{ return m_right(); };
		inputMap[InputTypes.ACTION_1] = function():Bool{ return m_action1(); };
		inputMap[InputTypes.ACTION_2] = function():Bool{ return m_action2(); };
	}
	
}