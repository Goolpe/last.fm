import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'track_model.g.dart';

@JsonSerializable()
class TrackModel extends Equatable {
  const TrackModel({
    required this.rank,
    required this.name,
    required this.duration,
  });
  
  factory TrackModel.fromJson(Map<String, dynamic> json) => _$TrackModelFromJson(json);
  
  @JsonKey(defaultValue: '')
  final String name;
  final int? duration;
  @_RankConverter()
  @JsonKey(defaultValue: 0, name: '@attr')
  final int rank;

  Map<String, dynamic> toJson() => _$TrackModelToJson(this);
  
  @override
  List<Object?> get props => [
    rank,
    name,
    duration,
  ];
}

class _RankConverter
    extends JsonConverter<int, Map<String, dynamic>> {
  const _RankConverter();

  @override
  int fromJson(Map<String, dynamic> json) {
    return json['rank'] as int? ?? 0;
  }

  @override
  Map<String, dynamic> toJson(int object) => {
    'rank': object,
  };
}
