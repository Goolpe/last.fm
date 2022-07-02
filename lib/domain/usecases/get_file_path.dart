import 'package:appsfactory_test/core/core.dart';
import 'package:appsfactory_test/data/repositories/image_repositories_impl.dart';
import 'package:appsfactory_test/domain/repositories/image_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

class GetFilePath implements UseCase<String?, GetFilePathParams> {

  final ImageRepository imageRepository = getIt<ImageRepositoryImpl>();

  @override
  Future<Either<Failure, String?>> call(GetFilePathParams params) {
    return imageRepository.getFilePath(params.imageUrl);
  }
}

class GetFilePathParams extends Equatable{
  const GetFilePathParams({
    required this.imageUrl,
  });

  final String imageUrl;
  
  @override
  List<Object?> get props => [imageUrl];
}
