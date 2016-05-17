package com.maxpaynestory.arcadeshooter.core
{
	import com.maxpaynestory.arcadeshooter.events.GameEvent;
	import com.maxpaynestory.arcadeshooter.factories.ButtonBuilder;
	
	import flash.display.SimpleButton;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.text.TextField;
	import flash.text.TextFieldAutoSize;
	import flash.text.TextFormat;
	import flash.text.TextFormatAlign;
	
	public class GameOverDialog extends Sprite
	{
		public function GameOverDialog()
		{
			super();
			this.addEventListener(Event.ADDED_TO_STAGE,onAddedToStage);
		}
		
		protected function onAddedToStage(event:Event):void
		{
			//// Dimmed background of Game over dialog
			
			this.graphics.beginFill(0x000000,0.7);
			this.graphics.drawRect(0,0,stage.stageWidth,stage.stageHeight);
			this.graphics.endFill();
			
			var button:SimpleButton = ButtonBuilder.createButton("Play Again");
			
			button.x = stage.stageWidth/2 - button.width/2;
			button.y = stage.stageHeight/2 - button.height/2;
			
			this.addChild(button);
			
			button.addEventListener(MouseEvent.CLICK,onPlayAgainClicked);
			
		}
		
		protected function onPlayAgainClicked(event:MouseEvent):void
		{
			this.dispatchEvent(new GameEvent(GameEvent.PLAY_AGAIN_CLICKED,{}));
		}
	}
}