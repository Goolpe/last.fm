import 'package:equatable/equatable.dart';

class Artist extends Equatable{
  const Artist({
    required this.mbid,
    required this.name,
    required this.imageUrl,
  });

  final String mbid;
  final String name;
  final String? imageUrl;
  
  @override
  List<Object?> get props => [
    mbid, 
    name, 
    imageUrl,
  ];
}
