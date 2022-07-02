import 'package:appsfactory_test/core/core.dart';
import 'package:appsfactory_test/data/repositories/album_detail_repositories_impl.dart';
import 'package:appsfactory_test/domain/enitities/album_detail.dart';
import 'package:appsfactory_test/domain/repositories/album_detail_repository.dart';
import 'package:dartz/dartz.dart';

class GetStoredAlbums implements UseCase<List<AlbumDetail>, NoParams> {

  final AlbumDetailRepository albumDetailRepository = getIt<AlbumDetailRepositoryImpl>();

  @override
  Future<Either<Failure, List<AlbumDetail>>> call(NoParams params) {
    return albumDetailRepository.getStoredAlbums();
  }
}
