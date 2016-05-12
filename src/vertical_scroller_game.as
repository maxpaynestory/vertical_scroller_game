package
{
	import com.maxpaynestory.arcadeshooter.core.Background;
	import com.maxpaynestory.arcadeshooter.core.HUD;
	import com.maxpaynestory.arcadeshooter.events.GameEvent;
	
	import flash.display.Sprite;
	import flash.events.Event;
	
	[SWF(frameRate=29,width="300",height="500")]
	public class vertical_scroller_game extends Sprite
	{

		private var backgroundLayer:Background;
		private var hud:HUD;
		private var isPaused:Boolean;
		
		public function vertical_scroller_game()
		{
			this.addEventListener(Event.ADDED_TO_STAGE,onAddedToStage);
			backgroundLayer = new Background;
			hud = new HUD;
			isPaused = true;
		}
		
		protected function onAddedToStage(event:Event):void
		{
			this.addEventListener(Event.ENTER_FRAME,onFrameLoop);
			this.addChild(backgroundLayer);
			this.addChild(hud);
			this.addEventListener(GameEvent.START_GAME,onGameStartEvent);
			this.addEventListener(GameEvent.PAUSE_GAME,onGamePauseEvent);
		}
		
		protected function onGamePauseEvent(event:GameEvent):void
		{
			isPaused = true;
		}
		
		protected function onGameStartEvent(event:GameEvent):void
		{
			isPaused = false;
		}
		
		protected function onFrameLoop(event:Event):void
		{
			if(!isPaused){
				backgroundLayer.updateFrame();
			}
		}
	}
}