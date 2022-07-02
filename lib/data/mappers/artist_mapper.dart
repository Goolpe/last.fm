import 'package:appsfactory_test/data/models/artist_model.dart';
import 'package:appsfactory_test/domain/enitities/artist.dart';

class ArtistMapper {

  static Artist fromArtistModel(ArtistModel? object) {
    return Artist(
      mbid: object?.mbid ?? '',
      name: object?.name ?? '',
      imageUrl: object?.lImageUrl,
    );
  }
}
