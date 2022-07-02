import 'package:equatable/equatable.dart';

abstract class SaveDeleteAlbumState extends Equatable{
  const SaveDeleteAlbumState();

  @override
  List<Object> get props => [];
}

class SaveDeleteAlbumInitial extends SaveDeleteAlbumState{}

class SaveDeleteAlbumLoading extends SaveDeleteAlbumState{}

class SaveDeleteAlbumLocal extends SaveDeleteAlbumState{}

class SaveDeleteAlbumNetwork extends SaveDeleteAlbumState{}

class SaveDeleteAlbumError extends SaveDeleteAlbumState{
  const SaveDeleteAlbumError(this.error, this.repeat);

  final String error;
  final Future<void> Function() repeat;

  @override
  List<Object> get props => [error, repeat];
}
