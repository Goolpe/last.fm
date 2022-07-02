import 'package:appsfactory_test/data/models/image_model.dart';
import 'package:collection/collection.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'artist_model.g.dart';

@JsonSerializable()
class ArtistModel extends Equatable {
  const ArtistModel({
    required this.mbid,
    required this.name,
    required this.image,
  });
  
  factory ArtistModel.fromJson(Map<String, dynamic> json) 
    => _$ArtistModelFromJson(json);

  final String? mbid;
  @JsonKey(defaultValue: '')
  final String name;
  @JsonKey(defaultValue: [])
  final List<ImageModel> image;

  Map<String, dynamic> toJson() => _$ArtistModelToJson(this);
  
  String? get lImageUrl => image
    .firstWhereOrNull((ImageModel img) => img.size == 'large')?.url;
    
  @override
  List<Object?> get props => [
    name,
    image,
  ];
}
