import 'package:appsfactory_test/core/core.dart';
import 'package:appsfactory_test/domain/enitities/artist.dart';
import 'package:dartz/dartz.dart';

abstract class ArtistsRepository {
  Future<Either<Failure, List<Artist>>> searchArtists(String text, int page);
}
