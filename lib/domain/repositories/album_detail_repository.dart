import 'package:appsfactory_test/core/core.dart';
import 'package:appsfactory_test/data/repositories/album_detail_repositories_impl.dart';
import 'package:appsfactory_test/domain/enitities/album_detail.dart';
import 'package:dartz/dartz.dart';

abstract class AlbumDetailRepository {
  Future<Either<Failure, List<AlbumDetail>>> getStoredAlbums();

  Future<Either<Failure, AlbumDetail>> getAlbumDetail(String mbid);

  Future<Either<Failure, void>> saveAlbum(String mbid);

  Future<Either<Failure, void>> deleteAlbum(String mbid);

  Either<Failure, bool> containsStoredAlbum(String mbid);
  
  Future<Either<Failure, List<AlbumDetail>>> getArtistTopAlbums(
    String artistName,
    int page,
  );

  Either<Failure, Stream<AlbumDetailBoxEvent>> watchStoredAlbum([String? mbid]);
}
