// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'track_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TrackModel _$TrackModelFromJson(Map<String, dynamic> json) => TrackModel(
      rank: json['@attr'] == null
          ? 0
          : const _RankConverter()
              .fromJson(json['@attr'] as Map<String, dynamic>),
      name: json['name'] as String? ?? '',
      duration: json['duration'] as int?,
    );

Map<String, dynamic> _$TrackModelToJson(TrackModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'duration': instance.duration,
      '@attr': const _RankConverter().toJson(instance.rank),
    };
