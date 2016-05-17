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
		private var _bulletList:Array;
		private var bulletFrameDelayCounter:Number;
		private var frameDelayToShoot:Number;
		private var controlsEnabled:Boolean;
		
		public function PlayerArea()
		{
			super();
			this.addEventListener(Event.ADDED_TO_STAGE,onPlayerAreaAddedToStage);
			_bulletList = new Array;
			bulletFrameDelayCounter = 0;
			frameDelayToShoot = 4;
		}
		
		protected function onPlayerAreaAddedToStage(event:Event):void
		{
			stage.addEventListener(KeyboardEvent.KEY_DOWN,keyPressHandler);
			stage.addEventListener(KeyboardEvent.KEY_UP,keyUpHandler);
			this.addEventListener(GameEvent.ENABLE_PLAYER_CONTROLS,onPlayeControlsEnabledEvent);
		}
		
		protected function onPlayeControlsEnabledEvent(event:GameEvent):void
		{
			controlsEnabled = true;
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
			var bulletsToDestroy:Array = new Array;
			var bullet:Bullet;
			
			if(spaceDown){   ///// If Space bar is down
				bulletFrameDelayCounter++;
				
				/////// If bullet delay has reached then fire a bullet.
				if(bulletFrameDelayCounter == frameDelayToShoot){ 
					bullet = new Bullet(Bullet.DIRECTION_UP,_player.x+_player.width/2,_player.y);
					bulletList.push(bullet);
					this.addChild(bullet);
					bulletFrameDelayCounter = 0;
				}
			}
			
			if(leftDown){
				_player.moveLeft();
			}
			if(upDown && controlsEnabled){   ////// disable up key if greensock library is doing motion tweening
				_player.moveUp();
			}
			if(rightDown){
				_player.moveRight();
			}
			if(downDown && controlsEnabled){ /////// disable down key if greensock library is doing motion tweening
				_player.moveDown();
			}
			
			if(bulletList.length > 0)
			{
				for(var i:int = bulletList.length-1; i >= 0; i--)
				{
					bullet = bulletList[i] as Bullet;
					bullet.uproachEnemy();  ///// update position of bullets fired by player
					
					if(bullet.outOfScreen()){
						bulletsToDestroy.push(i); //// if bullet has gone out of screen add to a list
					}
				}
			}
			
			for(var loopCounter:int = 0; loopCounter < bulletsToDestroy.length;loopCounter++)
			{
				bullet = bulletList[bulletsToDestroy[loopCounter]] as Bullet;
				bullet.removeSelf(); //// remove bullets that need to be destroyed
				bulletList.splice(bulletsToDestroy[loopCounter],1);
			}
		}
		
		public function spawnPlayer():void
		{
			if(_player){
				this.removeChild(_player);
			}
			controlsEnabled = false;
			_player = new Player;
			this.addChild(_player);
			_player.spawn(100,100);
		}

		public function get player():Player
		{
			return _player;
		}

		public function get bulletList():Array
		{
			return _bulletList;
		}

	}
}