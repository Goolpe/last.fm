import 'package:appsfactory_test/domain/enitities/album_detail.dart';
import 'package:equatable/equatable.dart';

abstract class StoredAlbumsState extends Equatable{
  const StoredAlbumsState();

  @override
  List<Object> get props => [];
}

class StoredAlbumsStateInitial extends StoredAlbumsState{}
class StoredAlbumsStateLoading extends StoredAlbumsState{}

class StoredAlbumsStateSuccess extends StoredAlbumsState{
  const StoredAlbumsStateSuccess(this.albums);

  final List<AlbumDetail> albums;

  @override
  List<Object> get props => [albums];
}

class StoredAlbumsStateError extends StoredAlbumsState{
  const StoredAlbumsStateError(this.error, this.repeat);

  final String error;
  final Function() repeat;

  @override
  List<Object> get props => [error, repeat];
}
