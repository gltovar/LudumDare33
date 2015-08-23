package;

import avatar.AvatarView;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.group.FlxGroup;
import flixel.group.FlxTypedGroup;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.util.FlxColorUtil;
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
		
		Reg.DEBUG_SPRITE_VIEW_TEST = new FlxSprite( 300, 400 );
		Reg.DEBUG_SPRITE_VIEW_TEST.makeGraphic(32, 32);
		add(Reg.DEBUG_SPRITE_VIEW_TEST);
		
		Reg.LAYER_DEBUG = new FlxTypedGroup<FlxSprite>();
		
		Reg.ENTITY_LIST_AVATARS = new Array<AvatarEntity>();
		
		Reg.LAYER_AVATAR_VIEWS = new FlxTypedGroup<AvatarView>();
		add(Reg.LAYER_AVATAR_VIEWS);
		
		var avatar:avatar.AvatarEntity = new avatar.AvatarEntity();
		
		var test:FlxText = new FlxText(100, 200, 100, "PLAY STATE");
		
		Reg.MAP_WALLS = new FlxTilemap();
		Reg.MAP_WALLS.loadMap(FlxStringUtil.imageToCSV("assets/data/test_map.png", false, 1), "assets/images/test_tiles.png", 0, 0, FlxTilemap.OFF);
		add(Reg.MAP_WALLS );
		
		FlxG.worldBounds.setSize(Reg.MAP_WALLS.width, Reg.MAP_WALLS.height);
		
		add(Reg.LAYER_DEBUG);
		
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
		
		FlxG.collide(Reg.LAYER_AVATAR_VIEWS, Reg.MAP_WALLS);
		
		for ( l_avatarEntity in Reg.ENTITY_LIST_AVATARS )
		{
			l_avatarEntity.update();
		}
		
		//FlxG.keys.reset(); // might be a bug fix here for keys.  asked: http://haxeflixel.com/forum/
	}	
}