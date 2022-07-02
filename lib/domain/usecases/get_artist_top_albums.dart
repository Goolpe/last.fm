import 'package:appsfactory_test/core/core.dart';
import 'package:appsfactory_test/data/repositories/album_detail_repositories_impl.dart';
import 'package:appsfactory_test/domain/enitities/album_detail.dart';
import 'package:appsfactory_test/domain/repositories/album_detail_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

class GetArtistTopAlbums implements UseCase<List<AlbumDetail>, GetArtistTopAlbumsParams> {

  final AlbumDetailRepository albumDetailRepository = getIt<AlbumDetailRepositoryImpl>();

  @override
  Future<Either<Failure, List<AlbumDetail>>> call(GetArtistTopAlbumsParams params) {
    return albumDetailRepository.getArtistTopAlbums(params.artistName, params.page);
  }
}

class GetArtistTopAlbumsParams extends Equatable{
  const GetArtistTopAlbumsParams({
    required this.artistName,
    required this.page,
  });

  final String artistName;
  final int page;
  
  @override
  List<Object?> get props => [artistName, page];
}
