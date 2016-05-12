package
{
	import flash.display.Sprite;
	import flash.events.Event;
	
	[SWF(frameRate=29,width="300",height="500")]
	public class vertical_scroller_game extends Sprite
	{

		private var backgroundLayer:Background;
		public function vertical_scroller_game()
		{
			this.addEventListener(Event.ADDED_TO_STAGE,onAddedToStage);
			backgroundLayer = new Background();
		}
		
		protected function onAddedToStage(event:Event):void
		{
			this.addEventListener(Event.ENTER_FRAME,onFrameLoop);
			this.addChild(backgroundLayer);
		}
		
		protected function onFrameLoop(event:Event):void
		{
			backgroundLayer.updateFrame();
		}
	}
}