import 'package:appsfactory_test/domain/enitities/album_detail.dart';
import 'package:equatable/equatable.dart';

abstract class AlbumDetailState extends Equatable{
  const AlbumDetailState();

  @override
  List<Object> get props => [];
}

class AlbumDetailStateLoading extends AlbumDetailState{}

class AlbumDetailStateSuccess extends AlbumDetailState {
  const AlbumDetailStateSuccess(this.albumDetail);

  final AlbumDetail albumDetail;

  @override
  List<Object> get props => [albumDetail];
}

class AlbumDetailStateError extends AlbumDetailState {
  const AlbumDetailStateError(this.error, this.repeat);

  final String error;
  final Function() repeat;

  @override
  List<Object> get props => [error, repeat];
}
