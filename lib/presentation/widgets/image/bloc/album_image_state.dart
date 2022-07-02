import 'package:equatable/equatable.dart';

abstract class AlbumImageState extends Equatable{
  const AlbumImageState();

  @override
  List<Object> get props => [];
}

class AlbumImageStateLoading extends AlbumImageState{}

class AlbumImageStateEmpty extends AlbumImageState{}

class AlbumImageStateLocal extends AlbumImageState {
  const AlbumImageStateLocal(this.imagePath);

  final String imagePath;

  @override
  List<Object> get props => [imagePath];
}

class AlbumImageStateNetwork extends AlbumImageState {
  const AlbumImageStateNetwork(this.imageUrl);

  final String imageUrl;

  @override
  List<Object> get props => [imageUrl];
}

class AlbumImageStateError extends AlbumImageState {
  const AlbumImageStateError(this.error);

  final String error;

  @override
  List<Object> get props => [error];
}
