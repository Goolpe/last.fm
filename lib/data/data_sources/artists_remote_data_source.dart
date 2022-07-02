import 'package:appsfactory_test/core/core.dart';
import 'package:appsfactory_test/data/models/artist_model.dart';

abstract class ArtistsRemoteDataSource {
  Future<List<ArtistModel>> searchArtists(String text, int page);
}

class ArtistsRemoteDataSourceImpl implements ArtistsRemoteDataSource {
  ArtistsRemoteDataSourceImpl(this.client);

  final HttpClient client;

  @override
  Future<List<ArtistModel>> searchArtists(String text, int page) async {
    final response = await client.get(Api.artistSearch(text, page));

    final List artistsReponse = response['results']?['artistmatches']?['artist'] ?? [];

    final List<ArtistModel> artistsModels = artistsReponse
        .cast<Map<String, dynamic>>()
        .map(ArtistModel.fromJson)
        .where((ArtistModel element) => element.mbid != null)
        .toList();

    return artistsModels;
  }
}
