import 'package:appsfactory_test/core/core.dart';
import 'package:appsfactory_test/data/models/album_model.dart';

abstract class AlbumsRemoteDataSource {
  Future<List<AlbumModel>> getArtistTopAlbums(String artistName, int page);
}

class AlbumsRemoteDataSourceImpl implements AlbumsRemoteDataSource {
  AlbumsRemoteDataSourceImpl(this.client);

  final HttpClient client;

  @override
  Future<List<AlbumModel>> getArtistTopAlbums(String artistName, int page) async {
    final response = await client.get(Api.artistTopAlbums(artistName, page));

    final List albumsReponse = response['topalbums']?['album'] ?? [];

    final List<AlbumModel> albumsModels = albumsReponse
        .cast<Map<String, dynamic>>()
        .map(AlbumModel.fromJson)
        .where((AlbumModel element) => element.mbid != null)
        .toList();

    return albumsModels;
  }
}
