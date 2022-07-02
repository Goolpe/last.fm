import 'package:equatable/equatable.dart';

abstract class AlbumImageState extends Equatable{
  const AlbumImageState();

  @override
  List<Object> get props => [];
}

class AlbumImageLoading extends AlbumImageState{}

class AlbumImageEmpty extends AlbumImageState{}

class AlbumImageLocal extends AlbumImageState {
  const AlbumImageLocal(this.imagePath);

  final String imagePath;

  @override
  List<Object> get props => [imagePath];
}

class AlbumImageNetwork extends AlbumImageState {
  const AlbumImageNetwork(this.imageUrl);

  final String imageUrl;

  @override
  List<Object> get props => [imageUrl];
}

class AlbumImageError extends AlbumImageState {
  const AlbumImageError(this.error);

  final String error;

  @override
  List<Object> get props => [error];
}
