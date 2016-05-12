package com.maxpaynestory.arcadeshooter.core
{
	import flash.display.Sprite;
	import flash.events.Event;
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
			lifeText.text = "Lives: " + lives.toString();
			lifeText.setTextFormat(textFormatLives);
			lifeText.autoSize = TextFieldAutoSize.LEFT;
			
			scoreText = new TextField;
			scoreText.text = "Score: " + score.toString();
			scoreText.setTextFormat(textFormatScore);
			scoreText.autoSize = TextFieldAutoSize.LEFT;
		}
		
		protected function onHUDAddedToStage(event:Event):void
		{
			lifeText.x = lifeText.y = scoreText.y = 10;
			this.addChild(lifeText);
			
			scoreText.x = stage.stageWidth - 100;
			this.addChild(scoreText);
		}
		
	}
}