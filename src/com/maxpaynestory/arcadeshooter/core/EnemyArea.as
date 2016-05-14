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
			if (enemyList.length > 0){ //enemies left?
				var enemy:Enemy;
				for (var m:int = 0; m < enemyList.length; m++){ // for each enemy in the enemyList
					enemy = enemyList[m] as Enemy;
					if ( enemy.hitTestObject(_playerArea.getPlayer) ){
						trace("player collided with enemy");
						//code to damage player goes here
						enemy.removeSelf();
						this.dispatchEvent(new GameEvent(GameEvent.ENEMY_HIT_THE_PLAYER,{}));
					}
				}
			}
			
			if(enemyList.length > 0)
			{
				var en:Enemy;
				for(var i:int = enemyList.length-1; i >= 0; i--)
				{
					en = enemyList[i] as Enemy;
					en.moveDown();
				}
			}
			
			spawnEnemies();
		}
	}
}