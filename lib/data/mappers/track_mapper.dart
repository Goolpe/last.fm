import 'package:appsfactory_test/data/models/track_model.dart';
import 'package:appsfactory_test/domain/enitities/track.dart';

class TrackMapper {

  static Track fromTrackModel(TrackModel object) {
    return Track(
      rank: object.rank,
      name: object.name,
      duration: object.duration,
    );
  }
}
