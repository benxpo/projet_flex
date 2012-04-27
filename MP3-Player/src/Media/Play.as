package Media
{ 
	public class Play
	{
		public var _name:String;
		public var _path:String;
		
		public function Play(path:String)
		{
			_path = path;
			
			var splitedPath = path.split('\\');
			if (splitedPath.length > 0)
			{	
				var splitedName = splitedPath[splitedPath.length - 1].split('.');
				if (splitedName.length > 1)
				{
					//if (splitedName[splitedName.length - 1] == "mp3")
						_name = splitedName[splitedName.length - 2];
				}				
			}
		}
	}
}