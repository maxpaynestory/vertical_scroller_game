package 
{
	import flash.display.Bitmap;

	public class AssetsManager
	{
		
		[Embed(source="../assets/background.png")] 
		private var backgroundImgClass:Class;
		
		private var bgImage:Bitmap;
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
		}
		
		public function getBackgroundImg():Bitmap{
			return bgImage;
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