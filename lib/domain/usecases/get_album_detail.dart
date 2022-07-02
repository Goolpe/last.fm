import 'package:appsfactory_test/core/core.dart';
import 'package:appsfactory_test/data/repositories/album_detail_repositories_impl.dart';
import 'package:appsfactory_test/domain/enitities/album_detail.dart';
import 'package:appsfactory_test/domain/repositories/album_detail_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

class GetAlbumDetail implements UseCase<AlbumDetail, GetAlbumDetailParams> {

  final AlbumDetailRepository albumDetailRepository = getIt<AlbumDetailRepositoryImpl>();

  @override
  Future<Either<Failure, AlbumDetail>> call(GetAlbumDetailParams params) {
    return albumDetailRepository.getAlbumDetail(params.mbid);
  }
}

class GetAlbumDetailParams extends Equatable{
  const GetAlbumDetailParams({
    required this.mbid,
  });

  final String mbid;
  
  @override
  List<Object?> get props => [mbid];
}
