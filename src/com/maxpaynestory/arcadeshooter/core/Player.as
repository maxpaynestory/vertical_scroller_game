package com.maxpaynestory.arcadeshooter.core
{
	import com.maxpaynestory.arcadeshooter.events.GameEvent;
	import com.maxpaynestory.arcadeshooter.interfaces.IPlayer;
	
	import flash.display.Sprite;
	import flash.events.Event;
	
	public class Player extends Sprite implements IPlayer
	{
		
		protected var speed:Number;
		protected var hideFactor:Number;
		
		public function Player()
		{
			super();
			speed = 4;
			hideFactor = 0.5;
			this.addEventListener(Event.ADDED_TO_STAGE,onPlaneAddedToStage);
		}
		
		protected function onPlaneAddedToStage(event:Event):void
		{
			this.addChild(AssetsManager.getInstance().getPlaneImg());
			this.scaleY = 0.7;
			this.scaleX = 0.7;
		}
		
		public function spawn(xPos:Number, yPos:Number):void
		{
		}
		
		public function die():void
		{
			this.parent.removeChild(this);
		}
		
		public function moveLeft():void
		{
			if(this.x > -(this.width * hideFactor)){
				this.x -= speed;
			}
		}
		
		public function moveRight():void
		{
			if(this.x < stage.stageWidth - this.width + (this.width * hideFactor)){
				this.x += speed;
			}
		}
		
		public function moveDown():void
		{
			if(this.y < stage.stageHeight - this.height + (this.height * hideFactor)){
				this.y += speed;
			}
		}
		
		public function moveUp():void
		{
			if(this.y > 0){
				this.y -= speed;
			}
		}
		
		public function fire():void
		{
			this.dispatchEvent(new GameEvent(GameEvent.PLAYER_FIRED,{}));
		}
	}
}