package Media
{
	public class PlayList
	{
		public var _name:String;	
		public var _playList:Vector.<Play>;
		
		public function PlayList(name:String)
		{
			_name = name;
			_playList = new Vector.<Play>();
		}
		
		public function GetMusic(musicName:String):Play
		{
			for(var i:int = 0; i < _playList.length; i++)
				if (_playList[i]._name == musicName)
					return _playList[i];
			
			return null;
		}
		
		public function AddMusic(musicPath:String):void
		{
			_playList.push(new Play(musicPath));
		}
		
		public function RemoveMusic(musicName:String):void
		{
			for(var i:int = 0; i < _playList.length; i++)
				if (_playList[i]._name == musicName)
					_playList.splice(i, 1);
		}
	}
}