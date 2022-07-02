// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'album_detail_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AlbumDetailModel _$AlbumDetailModelFromJson(Map<String, dynamic> json) =>
    AlbumDetailModel(
      mbid: json['mbid'] as String?,
      name: json['name'] as String? ?? '',
      artist: json['artist'] as String? ?? '',
      image: (json['image'] as List<dynamic>?)
              ?.map((e) => ImageModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      tracks: json['tracks'] == null
          ? []
          : const _TracksConverter()
              .fromJson(json['tracks'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AlbumDetailModelToJson(AlbumDetailModel instance) =>
    <String, dynamic>{
      'mbid': instance.mbid,
      'name': instance.name,
      'artist': instance.artist,
      'image': instance.image.map((e) => e.toJson()).toList(),
      'tracks': const _TracksConverter().toJson(instance.tracks),
    };
