import 'package:equatable/equatable.dart';

class Track extends Equatable{
  const Track({
    required this.rank,
    required this.name,
    required this.duration,
  });

  final int rank;
  final String name;
  final int? duration;
  
  @override
  List<Object?> get props => [
    rank,
    name, 
    duration,
  ];
}
