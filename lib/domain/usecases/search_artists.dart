import 'package:appsfactory_test/core/core.dart';
import 'package:appsfactory_test/data/repositories/artists_repositories_impl.dart';
import 'package:appsfactory_test/domain/enitities/artist.dart';
import 'package:appsfactory_test/domain/repositories/artists_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

class SearchArtists implements UseCase<List<Artist>, SearchArtistsParams> {

  final ArtistsRepository artistsRepository = getIt<ArtistsRepositoryImpl>();

  @override
  Future<Either<Failure, List<Artist>>> call(SearchArtistsParams params) {
    return artistsRepository.searchArtists(params.artistName, params.page);
  }
}

class SearchArtistsParams extends Equatable{
  const SearchArtistsParams({
    required this.artistName,
    required this.page,
  });

  final String artistName;
  final int page;
  
  @override
  List<Object?> get props => [artistName, page];

}
