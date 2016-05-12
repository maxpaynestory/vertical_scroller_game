package com.maxpaynestory.arcadeshooter.events
{
	import flash.events.Event;
	
	public class GameEvent extends Event
	{
		private var _data:Object;
		public static const START_GAME:String="startgame";
		public static const PAUSE_GAME:String="pausegame";
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