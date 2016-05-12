package com.maxpaynestory.arcadeshooter.interfaces
{
	public interface IPlayer
	{
		function Spawn(xPos:Number,yPos:Number):void;
		function Die():void;
		function MoveLeft():void;
		function MoveRight():void;
		function MoveDown():void;
		function MoveUp():void;
		function Fire():void;
	}
}