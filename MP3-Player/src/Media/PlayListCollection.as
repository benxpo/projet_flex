package Media
{
	import mx.states.AddItems;

	public class PlayListCollection
	{
		public var _playListcollection:Vector.<PlayList>;
		
		public function PlayListCollection()
		{
			_playListcollection = new Vector.<PlayList>();
		}
		
		public function GetPlayList(playListName:String):PlayList
		{
			for(var i:int = 0; i < _playListcollection.length; i++)
				if (_playListcollection[i]._name == playListName)
					return _playListcollection[i];
			
			return null;
		}
		
		public function AddPlayList(playListName:String):void
		{
			_playListcollection.push(new PlayList(playListName));
		}
		
		public function RemovePlayList(playListName:String):void
		{
			for(var i:int = 0; i < _playListcollection.length; i++)
				if (_playListcollection[i]._name == playListName)
					_playListcollection.splice(i, 1);
		}
		
		public function GetMusic(playListName:String, musicName:String):Play
		{
			for(var i:int = 0; i < _playListcollection.length; i++)
				if (_playListcollection[i]._name == playListName)
					return _playListcollection[i].GetMusic(musicName);
			
			return null;
		}
		
		public function AddMusic(playListName:String, musicPath:String):void
		{
			for(var i:int = 0; i < _playListcollection.length; i++)
				if (_playListcollection[i]._name == playListName)
					_playListcollection[i].AddMusic(musicPath);
		}
		
		public function RemoveMusic(playListName:String, musicName:String):void
		{
			for(var i:int = 0; i < _playListcollection.length; i++)
				if (_playListcollection[i]._name == playListName)
					_playListcollection[i].RemoveMusic(musicName);
		}
	}
}