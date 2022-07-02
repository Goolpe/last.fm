import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'image_model.g.dart';

@JsonSerializable()
class ImageModel extends Equatable {
  const ImageModel({
    required this.size,
    required this.url,
  });
  
  factory ImageModel.fromJson(Map<String, dynamic> json) 
    => _$ImageModelFromJson(json);

  @JsonKey(defaultValue: '')
  final String size;
  @JsonKey(name: '#text', defaultValue: '')
  final String url;

  Map<String, dynamic> toJson() => _$ImageModelToJson(this);
  
  @override
  List<Object?> get props => [
    size,
    url,
  ];
}
