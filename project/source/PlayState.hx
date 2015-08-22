package;

import avatar.AvatarView;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.group.FlxTypedGroup;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.util.FlxMath;
import input.InputMap;
import avatar.AvatarEntity;
import flixel.tile.FlxTilemap;
import flixel.util.FlxStringUtil;

/**
 * A FlxState which can be used for the actual gameplay.
 */
class PlayState extends FlxState
{
	
	/**
	 * Function that is called up when to state is created to set it up. 
	 */
	override public function create():Void
	{
		super.create();
		
		Reg.ENTITY_LIST_AVATARS = new Array<AvatarEntity>();
		
		Reg.LAYER_AVATAR_VIEWS = new FlxTypedGroup<AvatarView>();
		add(Reg.LAYER_AVATAR_VIEWS);
		
		var avatar:avatar.AvatarEntity = new avatar.AvatarEntity();
		
		var test:FlxText = new FlxText(100, 200, 100, "PLAY STATE");
		
		var l_map = new FlxTilemap();
		l_map.loadMap(FlxStringUtil.imageToCSV("assets/data/test_map.png", false, 2), "assets/images/test_tiles.png", 0, 0, FlxTilemap.ALT);
		add(l_map);
		
		add(test);
	}
	
	/**
	 * Function that is called when this state is destroyed - you might want to 
	 * consider setting all objects this state uses to null to help garbage collection.
	 */
	override public function destroy():Void
	{
		super.destroy();
	}

	/**
	 * Function that is called once every frame.
	 */
	override public function update():Void
	{
		super.update();
		
		for ( l_avatarEntity in Reg.ENTITY_LIST_AVATARS )
		{
			l_avatarEntity.update();
		}
		
		//FlxG.keys.reset(); // might be a bug fix here for keys.  asked: http://haxeflixel.com/forum/
	}	
}