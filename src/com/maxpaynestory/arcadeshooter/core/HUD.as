package com.maxpaynestory.arcadeshooter.core
{
	import com.maxpaynestory.arcadeshooter.events.GameEvent;
	
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
			lifeText.text = "Lives: " + lives.toString();
			lifeText.setTextFormat(textFormatLives);
			lifeText.autoSize = TextFieldAutoSize.LEFT;
			
			scoreText = new TextField;
			scoreText.selectable = false;
			scoreText.text = "Score: " + score.toString();
			scoreText.setTextFormat(textFormatScore);
			scoreText.autoSize = TextFieldAutoSize.RIGHT;
			
			startBtn = new SimpleButton;
			startBtn.y = 350;
			startBtn.upState = AssetsManager.getInstance().getStartGameImg();
			startBtn.downState = AssetsManager.getInstance().getStartGameImg();
			startBtn.overState = AssetsManager.getInstance().getStartGameImg();
			startBtn.hitTestState = AssetsManager.getInstance().getStartGameImg();
			startBtn.addEventListener(MouseEvent.CLICK,onStartButtonClicked);
			
			pauseBtn = new SimpleButton;
			pauseBtn.y = 10;
			pauseBtn.upState = AssetsManager.getInstance().getPauseGameImg()
			pauseBtn.downState = AssetsManager.getInstance().getPauseGameImg();
			pauseBtn.overState = AssetsManager.getInstance().getPauseGameImg();
			pauseBtn.hitTestState = AssetsManager.getInstance().getPauseGameImg();
			pauseBtn.addEventListener(MouseEvent.CLICK,onPauseButtonClicked);
		}
		
		protected function onPauseButtonClicked(event:MouseEvent):void
		{
			this.removeChild(pauseBtn);
			this.dispatchEvent(new GameEvent(GameEvent.PAUSE_GAME,{}));
			this.addChild(startBtn);
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
		
	}
}