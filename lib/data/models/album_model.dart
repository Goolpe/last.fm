import 'package:appsfactory_test/data/models/artist_model.dart';
import 'package:appsfactory_test/data/models/image_model.dart';
import 'package:collection/collection.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'album_model.g.dart';

@JsonSerializable()
class AlbumModel extends Equatable {
  const AlbumModel({
    required this.mbid,
    required this.name,
    required this.artist,
    required this.image,
  });
  
  factory AlbumModel.fromJson(Map<String, dynamic> json) => _$AlbumModelFromJson(json);

  final String? mbid;
  @JsonKey(defaultValue: '')
  final String name;
  final ArtistModel? artist;
  @JsonKey(defaultValue: [])
  final List<ImageModel> image;

  Map<String, dynamic> toJson() => _$AlbumModelToJson(this);
  
  String? get imageUrl => image
    .firstWhereOrNull((ImageModel img) => img.size == 'large')?.url;
    
  @override
  List<Object?> get props => [
    name,
    artist,
    image,
  ];
}
