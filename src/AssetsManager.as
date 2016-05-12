package 
{
	import flash.display.Bitmap;

	public class AssetsManager
	{
		
		[Embed(source="../assets/background.png")] 
		private var backgroundImgClass:Class;
		[Embed(source="../assets/start_game.png")] 
		private var startGameImgClass:Class;
		[Embed(source="../assets/pause.png")] 
		private var pauseGameImgClass:Class;
		
		private var bgImage:Bitmap;
		private var startGameImg:Bitmap;
		private var pauseGameImg:Bitmap;
		private static var _instance:AssetsManager;
		
		public function AssetsManager()
		{
			if(_instance){
				throw new Error("AssetsManager... use getInstance()");
			}
			_instance = this;
		}
		
		public function LoadAllAssets():void{
			bgImage = new backgroundImgClass() as Bitmap;
			startGameImg = new startGameImgClass() as Bitmap;
			pauseGameImg = new pauseGameImgClass() as Bitmap;
		}
		
		public function getBackgroundImg():Bitmap{
			return bgImage;
		}
		
		public function getStartGameImg():Bitmap{
			return startGameImg;
		}
		
		public function getPauseGameImg():Bitmap{
			return pauseGameImg;
		}
		
		public static function getInstance():AssetsManager{
			if(!_instance){
				_instance = new AssetsManager();
				_instance.LoadAllAssets();
			} 
			return _instance;
		}
	}
}