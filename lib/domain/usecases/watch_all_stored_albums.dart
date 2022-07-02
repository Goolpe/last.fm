import 'package:appsfactory_test/core/core.dart';
import 'package:appsfactory_test/data/repositories/album_detail_repositories_impl.dart';
import 'package:appsfactory_test/domain/repositories/album_detail_repository.dart';
import 'package:dartz/dartz.dart';

class WatchAllStoredAlbums implements UseCase<Stream<AlbumDetailBoxEvent>, NoParams> {

  final AlbumDetailRepository albumDetailRepository = getIt<AlbumDetailRepositoryImpl>();

  @override
  Future<Either<Failure, Stream<AlbumDetailBoxEvent>>> call(NoParams params) async {
    return albumDetailRepository.watchStoredAlbum();
  }
}
