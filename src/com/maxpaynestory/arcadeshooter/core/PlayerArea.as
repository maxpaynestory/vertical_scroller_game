package com.maxpaynestory.arcadeshooter.core
{
	import com.maxpaynestory.arcadeshooter.events.GameEvent;
	
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.ui.Keyboard;
	
	public class PlayerArea extends Sprite
	{

		private var _player:Player;

		private var nextKeyboardMove:uint;
		private var leftDown:Boolean = false;
		private var upDown:Boolean = false;
		private var rightDown:Boolean = false;
		private var downDown:Boolean = false;
		private var spaceDown:Boolean = false;
		private var bulletList:Array;
		private var bulletFrameDelayCounter:Number;
		private var frameDelayToShoot:Number;
		
		public function PlayerArea()
		{
			super();
			this.addEventListener(Event.ADDED_TO_STAGE,onPlayerAreaAddedToStage);
			bulletList = new Array;
			bulletFrameDelayCounter = 0;
			frameDelayToShoot = 4;
		}
		
		protected function onPlayerAreaAddedToStage(event:Event):void
		{
			
			stage.addEventListener(KeyboardEvent.KEY_DOWN,keyPressHandler);
			stage.addEventListener(KeyboardEvent.KEY_UP,keyUpHandler);
			this.addEventListener(GameEvent.PLAYER_FIRED,onPlayerFired);
		}
		
		protected function onPlayerFired(event:GameEvent):void
		{
			//bulletList.push(new Bullet(Bullet.DIRECTION_UP));
		}
		
		protected function keyUpHandler(event:KeyboardEvent):void
		{
			switch(event.keyCode){
				case Keyboard.UP:
					upDown = false;
					break;
				
				case Keyboard.DOWN:
					downDown = false;
					break;
				
				case Keyboard.LEFT:
					leftDown = false;
					break;
				
				case Keyboard.RIGHT:
					rightDown = false;
					break;
				
				case Keyboard.SPACE:
					spaceDown = false;
					break;
			}
		}
		
		protected function keyPressHandler(event:KeyboardEvent):void
		{
			switch(event.keyCode){
				case Keyboard.UP:
					upDown = true;
					break;
				
				case Keyboard.DOWN:
					downDown = true;
					break;
				
				case Keyboard.LEFT:
					leftDown = true;
					break;
				
				case Keyboard.RIGHT:
					rightDown = true;
					break;
				
				case Keyboard.SPACE:
					spaceDown = true;
					break;
			}
		}
		
		public function updateFrame():void
		{
			if(spaceDown){
				bulletFrameDelayCounter++;
				
				if(bulletFrameDelayCounter == frameDelayToShoot){
					//player.fire();
					var bullet:Bullet = new Bullet(Bullet.DIRECTION_UP,_player.x+_player.width/2,_player.y);
					bulletList.push(bullet);
					this.addChild(bullet);
					bulletFrameDelayCounter = 0;
				}
			}
			
			if(leftDown){
				_player.moveLeft();
			}
			if(upDown){
				_player.moveUp();
			}
			if(rightDown){
				_player.moveRight();
			}
			if(downDown){
				_player.moveDown();
			}
			
			if(bulletList.length > 0)
			{
				for(var i:int = bulletList.length-1; i >= 0; i--)
				{
					var bul:Bullet = bulletList[i] as Bullet;
					bul.uproachEnemy();
				}
			}
		}
		
		public function spawnPlayer():void
		{
			_player = new Player;
			_player.x = stage.stageWidth/2;
			_player.y = stage.stageHeight - 200;
			this.addChild(_player);
		}

		public function get getPlayer():Player
		{
			return _player;
		}
		
		public function gameOver():void
		{
			
		}
	}
}