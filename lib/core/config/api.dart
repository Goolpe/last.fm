
class Api{
  static const String key = 'a81e2f2f20486a0ffc36e39162fad929';

  static const String url = 'http://ws.audioscrobbler.com/2.0/?method=';

  static String fullPath(String path) => '$url$path&api_key=$key&format=json';

  static const String albums = '';

  static String artistSearch(String artistName, int page) {
    return 'artist.search&artist=$artistName&page=$page';
  }

  static String artistTopAlbums(String artistName, int page) 
    => 'artist.gettopalbums&artist=$artistName&page=$page';

  static String albumInfo({
    required String mbid, 
  }) => 'album.getinfo&mbid=$mbid';
}
