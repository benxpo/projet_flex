package MediaTool
{
	import flash.filesystem.File;
	import flash.filesystem.FileMode;
	import flash.filesystem.FileStream;
	
	import mx.states.AddItems;

	public class PlayListCollection
	{
		public var _playListcollection:Vector.<PlayList>;
		private var _filename:String = "playlist.txt"; ///Users/vincent/Library/Preferences/MediaPlayer/Local Store/playlist.txt
		
		public function PlayListCollection()
		{
			_playListcollection = new Vector.<PlayList>();
			
			var myFile:File = File.applicationStorageDirectory;
			myFile = myFile.resolvePath(_filename);
			
			
			if (myFile == null || !myFile.exists)
				return;
			
			var fileStream:FileStream = new FileStream();
			fileStream.open(myFile, FileMode.READ);
			
			if (fileStream == null)
				return;
			
			var fileContents:String = fileStream.readUTFBytes(fileStream.bytesAvailable);
			
			for each (var s:String in fileContents.split("&&")) {
				if (s != "") {
					var data:Array = s.split('==');
					var myPlaylist:PlayList = new PlayList(data[0]);
					for each (var ss:String in data[1].split("!!")) {
						if (ss != "")
							myPlaylist.AddMusic(ss);
					}
					_playListcollection.push(myPlaylist);
				}
			}
			
			fileStream.close();
		}
		
		public function SavePlayList():void
		{
			var myFile:File = File.applicationStorageDirectory;
			myFile = myFile.resolvePath(_filename);
			
			if (myFile == null)
				return;
			
			var fileStream:FileStream = new FileStream();
			fileStream.open(myFile, FileMode.WRITE);
			
			if (fileStream == null)
				return;
			
			for each (var myPlaylist:PlayList in _playListcollection)
			{
				fileStream.writeUTFBytes(myPlaylist._name + "==");
				
				for each (var myPlay:Play in myPlaylist._playList)
				{
					fileStream.writeUTFBytes(myPlay._path + "!!");
				}
				
				fileStream.writeUTFBytes("&&");
			}
			
			fileStream.close();
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
			this.SavePlayList();
		}
		
		public function RemovePlayList(playListName:String):void
		{
			for(var i:int = 0; i < _playListcollection.length; i++)
				if (_playListcollection[i]._name == playListName)
					_playListcollection.splice(i, 1);
			this.SavePlayList();
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
			this.SavePlayList();
		}
		
		public function RemoveMusic(playListName:String, musicName:String):void
		{
			for(var i:int = 0; i < _playListcollection.length; i++)
				if (_playListcollection[i]._name == playListName)
					_playListcollection[i].RemoveMusic(musicName);
			this.SavePlayList();
		}
	}
}