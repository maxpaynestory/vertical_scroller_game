package com.maxpaynestory.arcadeshooter.core
{
	import com.maxpaynestory.arcadeshooter.events.GameEvent;
	
	import flash.display.Sprite;
	import flash.events.Event;
	
	public class EnemyArea extends Sprite
	{
		private var enemyLimit:uint;
		private var enemyTime:uint;
		private var enemyList:Array;
		private var _playerArea:PlayerArea;
		
		public function EnemyArea(playerArea:PlayerArea)
		{
			super();
			this.addEventListener(Event.ADDED_TO_STAGE,onEnemyAreaAddedToStage);
			enemyLimit = 5;
			enemyTime = 0;
			enemyList = new Array;
			_playerArea = playerArea;
		}
		
		protected function onEnemyAreaAddedToStage(event:Event):void
		{
			
		}
		
		public function spawnEnemies():void
		{
			if(enemyList.length < enemyLimit){
				var enemy:Enemy = new Enemy();
				enemy.y = 0;
				enemy.x = int(Math.random()*(stage.stageWidth - enemy.width));
				enemyList.push(enemy);
				this.addChild(enemy);
			}
		}
		
		public function updateFrame():void
		{
			var enemiesToDestroy:Array = new Array;
			var enemy:Enemy;
			var bullet:Bullet;
			
			if (enemyList.length > 0){
				for (var m:int = 0; m < enemyList.length; m++){
					enemy = enemyList[m] as Enemy;
					if ( enemy.hitTestObject(_playerArea.player) ){
						enemiesToDestroy.push(m);
						this.dispatchEvent(new GameEvent(GameEvent.ENEMY_HIT_THE_PLAYER,{}));
					}
					
					for (var bulletCounter:int = 0; bulletCounter < _playerArea.bulletList.length; bulletCounter++){
						bullet = _playerArea.bulletList[bulletCounter] as Bullet;
						if ( enemy.hitTestObject(bullet) ){
							enemiesToDestroy.push(m);
							this.dispatchEvent(new GameEvent(GameEvent.BULLET_HIT_THE_ENEMY,{}));
						}
					}
				}
			}
			
			if(enemyList.length > 0)
			{
				for(var i:int = enemyList.length-1; i >= 0; i--)
				{
					enemy = enemyList[i] as Enemy;
					enemy.moveDown();
					
					if(enemy.outOfScreen()){
						enemiesToDestroy.push(i);
					}
				}
			}
			
			for(var loopCounter:int = 0; loopCounter < enemiesToDestroy.length;loopCounter++)
			{
				enemy = enemyList[enemiesToDestroy[loopCounter]] as Enemy;
				if(enemy != null){
					enemy.removeSelf();
				}
				enemyList.splice(enemiesToDestroy[loopCounter],1);
			}
			
			spawnEnemies();
			enemiesToDestroy = null;
		}
	}
}