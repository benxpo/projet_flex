package MediaTool
{ 
	public class Play
	{
		public var _name:String;
		public var _path:String;
		
		public function Play(path:String)
		{
			_path = path;
			
			var splitedPath:Array = path.split('\\');
			if (splitedPath.length > 0)
			{	
				var splitedName:Array = splitedPath[splitedPath.length - 1].split('.');
				if (splitedName.length > 1)
				{
					//if (splitedName[splitedName.length - 1] == "mp3")
						_name = splitedName[splitedName.length - 2];
				}				
			}
		}
	}
}