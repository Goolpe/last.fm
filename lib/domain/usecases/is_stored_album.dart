import 'package:appsfactory_test/core/core.dart';
import 'package:appsfactory_test/data/repositories/album_detail_repositories_impl.dart';
import 'package:appsfactory_test/domain/repositories/album_detail_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

class IsStoredAlbum implements UseCase<bool, IsStoredAlbumParams> {
  
  final AlbumDetailRepository albumDetailRepository = getIt<AlbumDetailRepositoryImpl>();

  @override
  Future<Either<Failure, bool>> call(IsStoredAlbumParams params) async {
    return albumDetailRepository.containsStoredAlbum(params.mbid);
  }
}

class IsStoredAlbumParams extends Equatable{
  const IsStoredAlbumParams({
    required this.mbid,
  });

  final String mbid;
  
  @override
  List<Object?> get props => [mbid];

}
