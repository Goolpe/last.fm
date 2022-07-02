import 'dart:async';

import 'package:appsfactory_test/core/exceptions/exceptions.dart';
import 'package:appsfactory_test/core/exceptions/failure.dart';
import 'package:appsfactory_test/data/data_sources/album_detail_local_data_source.dart';
import 'package:appsfactory_test/data/data_sources/album_detail_remote_data_source.dart';
import 'package:appsfactory_test/data/data_sources/albums_remote_data_source.dart';
import 'package:appsfactory_test/data/mappers/album_detail_mapper.dart';
import 'package:appsfactory_test/data/models/album_detail_model.dart';
import 'package:appsfactory_test/data/models/album_model.dart';
import 'package:appsfactory_test/domain/enitities/album_detail.dart';
import 'package:appsfactory_test/domain/repositories/album_detail_repository.dart';
import 'package:dartz/dartz.dart';

class AlbumDetailRepositoryImpl implements AlbumDetailRepository {
  AlbumDetailRepositoryImpl(
    this.remoteDataSource,
    this.albumsRemoteDataSource,
    this.localDataSource,
  );

  final AlbumDetailRemoteDataSource remoteDataSource;
  final AlbumsRemoteDataSource albumsRemoteDataSource;
  final AlbumDetailLocalDataSource localDataSource;
  
  @override
  Future<Either<Failure, List<AlbumDetail>>> getStoredAlbums() async {
    try {
      final List<AlbumDetailModel> albumDetailModels = await localDataSource.getAlbums();

      final List<AlbumDetail> albumDetails = albumDetailModels
      .map(AlbumDetailMapper.fromAlbumDetailModel)
      .cast<AlbumDetail>()
      .toList();

      return Right(albumDetails);
    } on ServerException catch (error) {
      return Left(ServerFailure(error.message));
    }
  }

  @override
  Future<Either<Failure, AlbumDetail>> getAlbumDetail(String mbid) async {
    try {
      AlbumDetailModel? albumDetailModel;

      albumDetailModel = await localDataSource.getAlbumDetail(mbid);

      albumDetailModel ??= await remoteDataSource.getAlbumDetail(mbid);

      final AlbumDetail albumDetail = AlbumDetailMapper.fromAlbumDetailModel(albumDetailModel);

      return Right(albumDetail);
    } on ServerException catch (error) {
      return Left(ServerFailure(error.message));
    } on DBException catch (error) {
      return Left(ClientFailure(error.message));
    } on ClientException catch (error) {
      return Left(ClientFailure(error.message));
    }
  }

  @override
  Future<Either<Failure, void>> saveAlbum(String mbid) async {
    try {
      final AlbumDetailModel albumDetailModel = await remoteDataSource.getAlbumDetail(mbid);

      final result = await localDataSource.saveAlbum(albumDetailModel);

      return Right(result);
    } on DBException catch (error) {
      return Left(ClientFailure(error.message));
    } on ServerException catch (error) {
      return Left(ServerFailure(error.message));
    } on ClientException catch (error) {
      return Left(ClientFailure(error.message));
    }
  }

  @override
  Future<Either<Failure, void>> deleteAlbum(String mbid) async {
    try {
      final result = await localDataSource.deleteAlbum(mbid);

      return Right(result);
    } on DBException catch (error) {
      return Left(ClientFailure(error.message));
    }
  }
  
  @override
  Future<Either<Failure, List<AlbumDetail>>> getArtistTopAlbums(
    String artistName,
    int page,
  ) async {
    try {
      final List<AlbumModel> albumsModels = await albumsRemoteDataSource.getArtistTopAlbums(artistName, page);

      final List<AlbumDetail> albums = albumsModels.map(AlbumDetailMapper.fromAlbumModel).toList();

      return Right(albums);
    } on ServerException catch (error) {
      return Left(ServerFailure(error.message));
    } on ClientException catch (error) {
      return Left(ClientFailure(error.message));
    }
  }
  
  @override
  Either<Failure, bool> containsStoredAlbum(String mbid) {
    try {
      final result = localDataSource.containsAlbum(mbid);
      
      return Right(result);
    } on DBException catch (error) {
      return Left(ClientFailure(error.message));
    }
  }
  
  @override
  Either<Failure, Stream<AlbumDetailBoxEvent>> watchStoredAlbum([String? mbid]) {
    try {
      final result = localDataSource.watchStoredAlbum(mbid)
      .transform(StreamTransformer
      .fromHandlers(handleData: AlbumDetailBoxEvent.handleData));
      
      return Right(result);
    } on DBException catch (error) {
      return Left(ClientFailure(error.message));
    }
  }
}

class AlbumDetailBoxEvent{
  AlbumDetailBoxEvent({
    required this.key,
    required this.value,
    required this.deleted,
  });

  final String key;
  final AlbumDetail value;
  final bool deleted;

  static void handleData(AlbumDetailModelBoxEvent data, EventSink<AlbumDetailBoxEvent> sink) {
    final event = AlbumDetailBoxEvent(
      key: data.key,
      value: AlbumDetailMapper.fromAlbumDetailModel(data.value),
      deleted: data.deleted,
    );
    sink.add(event);
  }
}
