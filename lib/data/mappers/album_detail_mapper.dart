import 'package:appsfactory_test/data/mappers/track_mapper.dart';
import 'package:appsfactory_test/data/models/album_detail_model.dart';
import 'package:appsfactory_test/data/models/album_model.dart';
import 'package:appsfactory_test/data/models/track_model.dart';
import 'package:appsfactory_test/domain/enitities/album_detail.dart';
import 'package:appsfactory_test/domain/enitities/track.dart';

class AlbumDetailMapper {
  
  static AlbumDetail fromAlbumDetailModel(AlbumDetailModel object) {
    return AlbumDetail(
      mbid: object.mbid ?? '',
      name: object.name,
      artistName: object.artist,
      imageUrl: object.imageUrl,
      tracks: object.tracks.map((TrackModel e) => TrackMapper.fromTrackModel(e)).toList(),
      savedAt: object.savedAt,
    );
  }

  static AlbumDetail fromAlbumModel(AlbumModel object) {
    return AlbumDetail(
      mbid: object.mbid ?? '',
      name: object.name,
      artistName: object.artist?.name ?? '',
      imageUrl: object.imageUrl,
      tracks: const <Track>[],
    );
  }
}
