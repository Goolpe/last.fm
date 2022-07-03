import 'package:appsfactory_test/domain/enitities/track.dart';
import 'package:equatable/equatable.dart';

class AlbumDetail extends Equatable{
  const AlbumDetail({
    required this.mbid,
    required this.name,
    required this.artistName,
    required this.imageUrl,
    required this.tracks,
    this.savedAt,
  });

  final String mbid;
  final String name;
  final String artistName;
  final String? imageUrl;
  final List<Track> tracks;
  final DateTime? savedAt;
  
  @override
  List<Object?> get props => [
    mbid,
    name,
    artistName, 
    imageUrl,
    tracks,
    savedAt,
  ];
}
