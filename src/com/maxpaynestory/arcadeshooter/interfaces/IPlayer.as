package com.maxpaynestory.arcadeshooter.interfaces
{
	public interface IPlayer
	{
		function spawn(xPos:Number,yPos:Number):void;
		function die():void;
		function moveLeft():void;
		function moveRight():void;
		function moveDown():void;
		function moveUp():void;
		function fire():void;
	}
}