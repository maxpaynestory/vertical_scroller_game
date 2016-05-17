package com.maxpaynestory.arcadeshooter.factories
{
	import flash.display.SimpleButton;
	import flash.display.Sprite;
	import flash.text.TextField;
	import flash.text.TextFieldAutoSize;
	import flash.text.TextFormat;
	import flash.text.TextFormatAlign;

	public class ButtonBuilder
	{
		public function ButtonBuilder()
		{
		}
		
		public static function createButton(text:String):SimpleButton
		{
			var textFormatLives:TextFormat = new TextFormat();
			textFormatLives.color = 0x000000;
			textFormatLives.font = "Verdana";
			textFormatLives.size = 24;
			textFormatLives.bold = true;
			textFormatLives.align = TextFormatAlign.CENTER;
			
			var playSprite:Sprite = new Sprite;
			
			playSprite.graphics.beginFill(0xFFFFFF,1);
			playSprite.graphics.drawRoundRect(0,0,170,50,8,8);
			playSprite.graphics.endFill();
			
			var playAgainText:TextField = new TextField;
			playAgainText.selectable = false;
			playAgainText.defaultTextFormat = textFormatLives;
			playAgainText.setTextFormat(textFormatLives);
			playAgainText.text = text;
			playAgainText.autoSize = TextFieldAutoSize.CENTER;
			playAgainText.x = playAgainText.y = 10;
			
			playSprite.addChild(playAgainText);
			
			var button:SimpleButton = new SimpleButton;
			button.upState = button.downState = button.overState = button.hitTestState = playSprite;
			
			return button;
		}
	}
}