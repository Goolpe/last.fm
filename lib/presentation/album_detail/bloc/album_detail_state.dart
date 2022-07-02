import 'package:appsfactory_test/domain/enitities/album_detail.dart';
import 'package:equatable/equatable.dart';

abstract class AlbumDetailState extends Equatable{
  const AlbumDetailState();

  @override
  List<Object> get props => [];
}

class AlbumDetailLoading extends AlbumDetailState{}

class AlbumDetailSuccess extends AlbumDetailState {
  const AlbumDetailSuccess(this.albumDetail);

  final AlbumDetail albumDetail;

  @override
  List<Object> get props => [albumDetail];
}

class AlbumDetailError extends AlbumDetailState {
  const AlbumDetailError(this.error, this.repeat);

  final String error;
  final Function() repeat;

  @override
  List<Object> get props => [error, repeat];
}
