import 'package:appsfactory_test/core/core.dart';
import 'package:appsfactory_test/data/repositories/album_detail_repositories_impl.dart';
import 'package:appsfactory_test/domain/repositories/album_detail_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

class WatchStoredAlbum implements UseCase<Stream<AlbumDetailBoxEvent>, WatchStoredAlbumParams> {

  final AlbumDetailRepository albumDetailRepository = getIt<AlbumDetailRepositoryImpl>();

  @override
  Future<Either<Failure, Stream<AlbumDetailBoxEvent>>> call(WatchStoredAlbumParams params) async {
    return albumDetailRepository.watchStoredAlbum(params.mbid);
  }
}

class WatchStoredAlbumParams extends Equatable{
  const WatchStoredAlbumParams({
    required this.mbid,
  });

  final String mbid;
  
  @override
  List<Object?> get props => [mbid];

}
