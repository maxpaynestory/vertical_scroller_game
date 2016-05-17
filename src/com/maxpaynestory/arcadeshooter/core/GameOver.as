package com.maxpaynestory.arcadeshooter.core
{
	import flash.display.Sprite;
	import flash.events.Event;
	
	public class GameOver extends Sprite
	{
		public function GameOver()
		{
			super();
			this.addEventListener(Event.ADDED_TO_STAGE,onGameOverAddedToStage);
		}
		
		protected function onGameOverAddedToStage(event:Event):void
		{
			
		}
	}
}