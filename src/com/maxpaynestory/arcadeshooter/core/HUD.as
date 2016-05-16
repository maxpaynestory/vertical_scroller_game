package com.maxpaynestory.arcadeshooter.core
{
	import com.maxpaynestory.arcadeshooter.events.GameEvent;
	
	import flash.display.Bitmap;
	import flash.display.SimpleButton;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.text.TextField;
	import flash.text.TextFieldAutoSize;
	import flash.text.TextFormat;
	import flash.text.TextFormatAlign;
	
	public class HUD extends Sprite
	{

		private var score:Number;

		private var lives:Number;

		private var lifeText:TextField;

		private var scoreText:TextField;
		
		private var textColor:Object = 0xFFFFFF;

		private var startBtn:SimpleButton;

		private var pauseBtn:SimpleButton;
		
		private var pauseImg:Bitmap;
		
		private var resumeImg:Bitmap;
		
		public function HUD()
		{
			super();
			this.addEventListener(Event.ADDED_TO_STAGE,onHUDAddedToStage);
			score = 0;
			lives = 3;
			var textFormatLives:TextFormat = new TextFormat();
			textFormatLives.color = textColor;
			textFormatLives.font = "Helvetica";
			textFormatLives.size = 16;    
			textFormatLives.align = TextFormatAlign.LEFT;
			
			var textFormatScore:TextFormat = textFormatLives;
			textFormatScore.align = TextFormatAlign.RIGHT;
			
			lifeText = new TextField;
			lifeText.selectable = false;
			updateLife();
			lifeText.defaultTextFormat = textFormatLives;
			lifeText.setTextFormat(textFormatLives);
			lifeText.autoSize = TextFieldAutoSize.LEFT;
			
			scoreText = new TextField;
			scoreText.selectable = false;
			updateScore();
			scoreText.defaultTextFormat = textFormatScore;
			scoreText.setTextFormat(textFormatScore);
			scoreText.autoSize = TextFieldAutoSize.RIGHT;
			
			startBtn = new SimpleButton;
			startBtn.y = 350;
			startBtn.upState = AssetsManager.getInstance().getStartGameImg();
			startBtn.downState = AssetsManager.getInstance().getStartGameImg();
			startBtn.overState = AssetsManager.getInstance().getStartGameImg();
			startBtn.hitTestState = AssetsManager.getInstance().getStartGameImg();
			startBtn.addEventListener(MouseEvent.CLICK,onStartButtonClicked);
			
			pauseImg = AssetsManager.getInstance().getPauseGameImg();
			resumeImg = AssetsManager.getInstance().getResumeGameImg();
			
			pauseBtn = new SimpleButton;
			pauseBtn.y = 10;
			pauseBtn.upState = pauseBtn.downState = pauseBtn.overState = pauseBtn.hitTestState = pauseImg;
			pauseBtn.addEventListener(MouseEvent.CLICK,onPauseButtonClicked);
		}
		
		protected function onPauseButtonClicked(event:MouseEvent):void
		{
			if(pauseBtn.upState == pauseImg){
				pauseBtn.upState = pauseBtn.downState = pauseBtn.overState = pauseBtn.hitTestState = resumeImg;
				this.dispatchEvent(new GameEvent(GameEvent.PAUSE_GAME,{}));
			}else{
				pauseBtn.upState = pauseBtn.downState = pauseBtn.overState = pauseBtn.hitTestState = pauseImg;
				this.dispatchEvent(new GameEvent(GameEvent.RESUME_GAME,{}));
			}
			
		}
		
		protected function onStartButtonClicked(event:MouseEvent):void
		{
			this.removeChild(startBtn);
			this.dispatchEvent(new GameEvent(GameEvent.START_GAME,{}));
			this.addChild(pauseBtn);
		}
		
		protected function onHUDAddedToStage(event:Event):void
		{
			lifeText.x = lifeText.y = scoreText.y = 10;
			this.addChild(lifeText);
			
			scoreText.x = stage.stageWidth - 100;
			this.addChild(scoreText);
			
			this.addChild(startBtn);
			
			pauseBtn.x = stage.stageWidth/2 -  pauseBtn.width/2;
			startBtn.x = stage.stageWidth/2 -  startBtn.width/2;
		}
		
		public function decreasePlayerLife():void
		{
			lives--;
			updateLife();
		}
		
		private function updateLife():void
		{
			lifeText.text = "Lives: " + lives.toString();
		}
		
		public function checkIfPlayerDied():Boolean
		{
			// TODO Auto Generated method stub
			if(lives <= 0){
				return true;
			}
			return false;
		}
		
		public function increasePlayerScore():void
		{
			score += 10;
			updateScore();
			if(score == 150){ /////////// on reaching 150 score increase player speed
				this.dispatchEvent(new GameEvent(GameEvent.GIVE_PERKS_TO_PLAYER,[
					Player.BOOST_PLAYER_SPEED
				]));
			}
		}
		
		private function updateScore():void
		{
			scoreText.text = "Score: " + score.toString();
		}
	}
}