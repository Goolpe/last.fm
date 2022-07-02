import 'package:appsfactory_test/core/exceptions/exceptions.dart';
import 'package:appsfactory_test/core/exceptions/failure.dart';
import 'package:appsfactory_test/data/data_sources/artists_remote_data_source.dart';
import 'package:appsfactory_test/data/mappers/artist_mapper.dart';
import 'package:appsfactory_test/data/models/artist_model.dart';
import 'package:appsfactory_test/domain/enitities/artist.dart';
import 'package:appsfactory_test/domain/repositories/artists_repository.dart';
import 'package:dartz/dartz.dart';

class ArtistsRepositoryImpl implements ArtistsRepository {
  ArtistsRepositoryImpl(
    this.remoteDataSource,
  );

  final ArtistsRemoteDataSource remoteDataSource;

  @override
  Future<Either<Failure, List<Artist>>> searchArtists(String text, int page) async {
    try {
      final List<ArtistModel> artistsModels = await remoteDataSource.searchArtists(text, page);

      final List<Artist> artists = artistsModels.map(ArtistMapper.fromArtistModel).cast<Artist>().toList();

      return Right(artists);
    } on ServerException catch (error) {
      return Left(ServerFailure(error.message));
    } on ClientException catch (error) {
      return Left(ClientFailure(error.message));
    }
  }
}
