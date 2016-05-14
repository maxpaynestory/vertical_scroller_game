package com.maxpaynestory.arcadeshooter.events
{
	import flash.events.Event;
	
	public class GameEvent extends Event
	{
		private var _data:Object;
		public static const START_GAME:String="startgame";
		public static const PAUSE_GAME:String="pausegame";
		public static const RESUME_GAME:String="resumegame";
		public static const PLAYER_FIRED:String="playerfired";
		public static const ENEMY_FIRED:String="enemyfired";
		public static const ENEMY_HIT_THE_PLAYER:String="enemyhittheplayer";
		public function GameEvent(type:String, data:Object, bubbles:Boolean=true, cancelable:Boolean=true)
		{
			super(type, bubbles, cancelable);
			this._data = data;
		}
		
		public function get data():Object
		{
			return _data;
		}
	}
}