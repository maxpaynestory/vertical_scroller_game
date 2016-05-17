package com.maxpaynestory.arcadeshooter.core
{
	import com.maxpaynestory.arcadeshooter.events.GameEvent;
	import com.maxpaynestory.arcadeshooter.interfaces.IPlayer;
	
	import flash.display.Bitmap;
	import flash.display.Sprite;
	import flash.events.Event;
	
	public class Enemy extends Player
	{
		public function Enemy()
		{
			super();
			speed = 4;
		}
		
		override protected function onPlaneAddedToStage(event:Event):void
		{
			this.addChild(new Bitmap(AssetsManager.getInstance().getPlaneImg().bitmapData));
			this.scaleY = -0.7;
			this.scaleX = 0.7;
		}
		
		override public function moveDown():void
		{
			this.y += speed;
		}
		
		override public function fire():void
		{
			this.dispatchEvent(new GameEvent(GameEvent.ENEMY_FIRED,{}));
		}
		
		public function removeSelf():void
		{
			this.parent.removeChild(this);
		}
		
		public function outOfScreen():Boolean
		{
			if(this.y >= stage.stageHeight){
				return true;
			}
			return false;
		}
	}
}