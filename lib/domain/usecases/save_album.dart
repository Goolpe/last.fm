import 'package:appsfactory_test/core/core.dart';
import 'package:appsfactory_test/data/repositories/album_detail_repositories_impl.dart';
import 'package:appsfactory_test/data/repositories/image_repositories_impl.dart';
import 'package:appsfactory_test/domain/repositories/album_detail_repository.dart';
import 'package:appsfactory_test/domain/repositories/image_repository.dart';
import 'package:collection/collection.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

class SaveAlbum implements UseCase<void, SaveAlbumParams> {
  
  final AlbumDetailRepository albumDetailRepository = getIt<AlbumDetailRepositoryImpl>();
  final ImageRepository imageRepository = getIt<ImageRepositoryImpl>();

  @override
  Future<Either<Failure, void>> call(SaveAlbumParams params) async {
    return Future.wait([
      albumDetailRepository.saveAlbum(params.mbid),
      imageRepository.save(params.imageUrl),
    ]).then((values){
      final value = values.firstWhereOrNull((element) => element.isLeft());

      return value ?? const Right(null);
    });
  }
}

class SaveAlbumParams extends Equatable{
  const SaveAlbumParams({
    required this.mbid,
    required this.imageUrl,
  });

  final String mbid;
  final String? imageUrl;
  
  @override
  List<Object?> get props => [mbid, imageUrl];

}
