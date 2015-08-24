package;

import avatar.AvatarEntity;
import avatar.AvatarView;
import flixel.addons.editors.ogmo.FlxOgmoLoader;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.group.FlxTypedGroup;
import flixel.text.FlxText;
import item.ItemEntity;
import room.RoomData;

/**
 * A FlxState which can be used for the actual gameplay.
 */
class PlayState extends FlxState
{
	
	private function loadItems(name:String, data:Xml):Void
	{
		var l_tileX:Int = Std.parseInt(data.get("x"));
		var l_tileY:Int = Std.parseInt(data.get("y"));
		
		var l_item:ItemEntity = new ItemEntity();
		l_item.view.setPosition( l_tileX, l_tileY);
		Reg.LIST_ENTITY_ITEMS.push(l_item);
		
		Reg.LAYER_ITEM_VIEWS.add( l_item.view );		
	}
	
	private function loadRooms(name:String, data:Xml):Void
	{
		var l_tileX:Int = Std.parseInt(data.get("x"));
		var l_tileY:Int = Std.parseInt(data.get("y"));
		
		var l_roomData:RoomData = new RoomData();
		l_roomData.x = l_tileX;
		l_roomData.y = l_tileY;
		
		Reg.LIST_ROOM_DATA.push( l_roomData );
	}
	
	private function loadCharacters(name:String, data:Xml):Void
	{
		var l_tileX:Int = Std.parseInt(data.get("x"));
		var l_tileY:Int = Std.parseInt(data.get("y"));
		var l_avatarEntity:AvatarEntity = null;
		switch( name )
		{
			case "monster":
				l_avatarEntity = new AvatarEntity(true);
				Reg.ENTITY_MONSTER = l_avatarEntity;
				
				
			case "victim":
				l_avatarEntity = new AvatarEntity(false);
				Reg.LIST_ENTITY_AVATARS.push( new AvatarEntity() );
		}
		
		if ( l_avatarEntity != null )
		{
			Reg.LIST_ENTITY_AVATARS.push( l_avatarEntity );
			l_avatarEntity.view.setPosition( l_tileX, l_tileY );
		}
	}
	
	/**
	 * Function that is called up when to state is created to set it up. 
	 */
	override public function create():Void
	{
		super.create();
		
		Reg.LIST_ENTITY_ITEMS = new Array<ItemEntity>();
		Reg.LIST_ROOM_DATA = new Array<RoomData>();
		
		
		var l_map:FlxOgmoLoader = new FlxOgmoLoader("assets/data/Level1.oel");
		Reg.MAP_FLOOR = l_map.loadTilemap("assets/images/map_tiles.png", 32, 32, "floor");
		add(Reg.MAP_FLOOR);
		Reg.MAP_WALLS = l_map.loadTilemap("assets/images/map_tiles.png", 32, 32, "walls");
		add(Reg.MAP_WALLS);
		
		l_map.loadEntities(loadRooms, "rooms");
		
		
		
		/*Reg.DEBUG_SPRITE_VIEW_TEST = new FlxSprite( 300, 400 );
		Reg.DEBUG_SPRITE_VIEW_TEST.makeGraphic(32, 32);
		add(Reg.DEBUG_SPRITE_VIEW_TEST);*/
		
		Reg.LAYER_ITEM_VIEWS = new FlxTypedGroup<FlxSprite>();
		add(Reg.LAYER_ITEM_VIEWS);
		
		Reg.LAYER_NOISE_COLLIDERS = new FlxTypedGroup<FlxSprite>();
		add(Reg.LAYER_NOISE_COLLIDERS);
		
		
		Reg.LAYER_DEBUG = new FlxTypedGroup<FlxSprite>();
		
		Reg.LIST_ENTITY_AVATARS = new Array<AvatarEntity>();
		
		Reg.LAYER_AVATAR_VIEWS = new FlxTypedGroup<AvatarView>();
		add(Reg.LAYER_AVATAR_VIEWS);
		
		var avatar:avatar.AvatarEntity = new avatar.AvatarEntity();
		
		var test:FlxText = new FlxText(100, 200, 100, "PLAY STATE");
		
		
		// testing oel loader
		
		
		
		FlxG.worldBounds.setSize(Reg.MAP_WALLS.width, Reg.MAP_WALLS.height);
		
		Reg.MAP_VENTS = l_map.loadTilemap("assets/images/map_tiles.png", 32, 32, "vents");
		add(Reg.MAP_VENTS);
		
		add(Reg.LAYER_DEBUG);
		
		
		l_map.loadEntities(loadItems, "items");
		
		l_map.loadEntities(loadCharacters, "characters");
		
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
		
		for ( l_avatarEntity in Reg.LIST_ENTITY_AVATARS )
		{
			l_avatarEntity.update();
		}
		
		for ( l_item in Reg.LIST_ENTITY_ITEMS )
		{
			l_item.update();
		}
		//FlxG.keys.reset(); // might be a bug fix here for keys.  asked: http://haxeflixel.com/forum/
	}	
}