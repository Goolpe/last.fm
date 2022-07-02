import 'dart:async';

import 'package:appsfactory_test/core/core.dart';
import 'package:appsfactory_test/data/data_sources/image_local_data_source.dart';
import 'package:appsfactory_test/domain/repositories/image_repository.dart';
import 'package:dartz/dartz.dart';

class ImageRepositoryImpl implements ImageRepository {
  ImageRepositoryImpl(
    this.localDataSource,
  );

  final ImageLocalDataSource localDataSource;
  
  @override
  Future<Either<Failure, void>> delete(String? imageUrl) async {
    try{
      final result = await localDataSource.delete(imageUrl); 

      return Right(result);
    } on DBException catch (error) {
      return Left(ClientFailure(error.message));
    }
  }
  
  @override
  Future<Either<Failure, String?>> getFilePath(String imageUrl) async {
    try{
      final result = await localDataSource.getPath(imageUrl); 
      
      return Right(result);
    } on DBException catch (error) {
      return Left(ClientFailure(error.message));
    }
  }
  
  @override
  Future<Either<Failure, void>> save(String? imageUrl) async {
    try{
      final result = await localDataSource.save(imageUrl); 
      
      return Right(result);
    } on DBException catch (error) {
      return Left(ClientFailure(error.message));
    }
  }
  
}
