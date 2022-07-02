import 'package:appsfactory_test/core/core.dart';
import 'package:dartz/dartz.dart';

abstract class ImageRepository {
  Future<Either<Failure, String?>> getFilePath(String imageUrl);

  Future<Either<Failure, void>> save(String? imageUrl);

  Future<Either<Failure, void>> delete(String? imageUrl);
}
