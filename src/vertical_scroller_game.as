package
{
	import com.maxpaynestory.arcadeshooter.core.Background;
	import com.maxpaynestory.arcadeshooter.core.EnemyArea;
	import com.maxpaynestory.arcadeshooter.core.HUD;
	import com.maxpaynestory.arcadeshooter.core.PlayerArea;
	import com.maxpaynestory.arcadeshooter.events.GameEvent;
	
	import flash.display.Sprite;
	import flash.events.Event;
	
	[SWF(frameRate=35,width="300",height="500")]
	public class vertical_scroller_game extends Sprite
	{

		private var backgroundLayer:Background;
		private var hud:HUD;
		private var isGamePaused:Boolean;
		private var playerArea:PlayerArea;
		private var enemyArea:EnemyArea;
		private var isPlayerHit:Boolean;
		private var isEnemyHit:Boolean;
		
		public function vertical_scroller_game()
		{
			this.addEventListener(Event.ADDED_TO_STAGE,onAddedToStage);
			backgroundLayer = new Background;
			hud = new HUD;
			playerArea = new PlayerArea;
			enemyArea = new EnemyArea(playerArea);
			isGamePaused = true;
			isPlayerHit = false;
		}
		
		protected function onAddedToStage(event:Event):void
		{
			this.addEventListener(Event.ENTER_FRAME,onFrameLoop);
			this.addChild(backgroundLayer);
			this.addChild(enemyArea);
			this.addChild(playerArea);
			this.addChild(hud);
			this.addEventListener(GameEvent.START_GAME,onGameStartEvent);
			this.addEventListener(GameEvent.PAUSE_GAME,onGamePauseEvent);
			this.addEventListener(GameEvent.RESUME_GAME,onGameResumeEvent);
			this.addEventListener(GameEvent.ENEMY_HIT_THE_PLAYER,onEnemyHitThePlayerEvent);
			this.addEventListener(GameEvent.BULLET_HIT_THE_ENEMY,onBulletHitTheEnemy);
		}
		
		protected function onBulletHitTheEnemy(event:Event):void
		{
			isEnemyHit = true;
		}
		
		protected function onEnemyHitThePlayerEvent(event:Event):void
		{
			isPlayerHit = true;
		}
		
		protected function onGameResumeEvent(event:GameEvent):void
		{
			isGamePaused = false;
		}
		
		protected function onGamePauseEvent(event:GameEvent):void
		{
			isGamePaused = true;
		}
		
		protected function onGameStartEvent(event:GameEvent):void
		{
			playerArea.spawnPlayer();
			isGamePaused = false;
		}
		
		protected function onFrameLoop(event:Event):void
		{
			if(!isGamePaused){    ////// Check if Game is not paused or over.
				
				if(isPlayerHit){ //// Decrease player life of player if it was hit
					hud.decreasePlayerLife();
					isPlayerHit = false;
				}
				
				if(isEnemyHit){ //// Incease player score if a bullet hit enemy
					hud.increasePlayerScore();
					isEnemyHit = false;
				}
				
				if(hud.checkIfPlayerDied()){ //// Show game over if player died
					isGamePaused = true;
					//playerArea.gameOver();
				}
				
				backgroundLayer.updateFrame();
				playerArea.updateFrame();
				enemyArea.updateFrame();
			}
		}
	}
}