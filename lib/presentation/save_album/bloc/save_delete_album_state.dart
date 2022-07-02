import 'package:equatable/equatable.dart';

abstract class SaveDeleteAlbumState extends Equatable{
  const SaveDeleteAlbumState();

  @override
  List<Object> get props => [];
}

class SaveDeleteAlbumStateInitial extends SaveDeleteAlbumState{}

class SaveDeleteAlbumStateLoading extends SaveDeleteAlbumState{}

class SaveDeleteAlbumStateLocal extends SaveDeleteAlbumState{}

class SaveDeleteAlbumStateNetwork extends SaveDeleteAlbumState{}

class SaveDeleteAlbumStateError extends SaveDeleteAlbumState{
  const SaveDeleteAlbumStateError(this.error, this.repeat);

  final String error;
  final Future<void> Function() repeat;

  @override
  List<Object> get props => [error, repeat];
}
