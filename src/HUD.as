package
{
	import flash.display.Sprite;
	import flash.events.Event;
	
	public class HUD extends Sprite
	{
		public function HUD()
		{
			super();
			this.addEventListener(Event.ADDED_TO_STAGE,onHUDAddedToStage);
		}
		
		protected function onHUDAddedToStage(event:Event):void
		{
			
		}
	}
}