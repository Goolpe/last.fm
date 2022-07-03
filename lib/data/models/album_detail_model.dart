import 'package:appsfactory_test/data/models/image_model.dart';
import 'package:appsfactory_test/data/models/track_model.dart';
import 'package:collection/collection.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'album_detail_model.g.dart';

@JsonSerializable()
class AlbumDetailModel extends Equatable {
  const AlbumDetailModel({
    required this.mbid,
    required this.name,
    required this.artist,
    required this.image,
    required this.tracks,
    required this.savedAt,
  });

  factory AlbumDetailModel.fromJson(Map<String, dynamic> json) 
    => _$AlbumDetailModelFromJson(json);
  
  final String? mbid;
  @JsonKey(defaultValue: '')
  final String name;
  @JsonKey(defaultValue: '')
  final String artist;
  @JsonKey(defaultValue: <ImageModel>[])
  final List<ImageModel> image;
  @_TracksConverter()
  @JsonKey(defaultValue: <TrackModel>[])
  final List<TrackModel> tracks;
  final DateTime? savedAt;
  
  String? get imageUrl => image
    .firstWhereOrNull((ImageModel img) => img.size == 'large')?.url;

  Map<String, dynamic> toJson() => _$AlbumDetailModelToJson(this);
  
  AlbumDetailModel copyWith({
    String? mbid,
    String? name,
    String? artist,
    List<ImageModel>? image,
    List<TrackModel>? tracks,
    DateTime? savedAt,
  }){
    return AlbumDetailModel(
      mbid: mbid ?? this.mbid,
      artist: artist ?? this.artist,
      name: name ?? this.name,
      image: image ?? this.image,
      tracks: tracks ?? this.tracks,
      savedAt: savedAt ?? this.savedAt,
    );
  }

  @override
  List<Object?> get props => [
    mbid,
    name,
    artist,
    image,
    tracks,
  ];
}

class _TracksConverter
    extends JsonConverter<List<TrackModel>, Map<String, dynamic>> {
  const _TracksConverter();

  @override
  List<TrackModel> fromJson(Map<String, dynamic> json) {
    final dynamic jsonTrack = json['track'];

    if(jsonTrack is List){
      return jsonTrack
        .cast<Map<String, dynamic>>()
        .map((Map<String, dynamic> e) => TrackModel.fromJson(e))
        .toList();
    } else if(jsonTrack is Map){
      return <TrackModel>[TrackModel.fromJson(jsonTrack as Map<String, dynamic>)];
    }

    return <TrackModel>[];
  }

  @override
  Map<String, dynamic> toJson(List<TrackModel> object) => {
    'track': object.map((TrackModel e) => e.toJson()).toList(),
  };
}
