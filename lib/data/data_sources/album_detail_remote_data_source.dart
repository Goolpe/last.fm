
import 'package:appsfactory_test/core/core.dart';
import 'package:appsfactory_test/data/models/album_detail_model.dart';

abstract class AlbumDetailRemoteDataSource {
  Future<AlbumDetailModel> getAlbumDetail(String mbid);
}

class AlbumDetailRemoteDataSourceImpl implements AlbumDetailRemoteDataSource {
  AlbumDetailRemoteDataSourceImpl(this.client);

  final HttpClient client;

  @override
  Future<AlbumDetailModel> getAlbumDetail(String mbid) async {
    final response = await client.get(
      Api.albumInfo(mbid: mbid),
    );

    final albumDetailReponse = response['album'] ?? {};

    final AlbumDetailModel albumDetailModel = AlbumDetailModel.fromJson(albumDetailReponse)
      .copyWith(mbid: mbid);

    return albumDetailModel;
  }
}
