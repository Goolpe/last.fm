import 'package:appsfactory_test/core/core.dart';
import 'package:appsfactory_test/data/data_sources/album_detail_local_data_source.dart';
import 'package:appsfactory_test/data/data_sources/album_detail_remote_data_source.dart';
import 'package:appsfactory_test/data/data_sources/albums_remote_data_source.dart';
import 'package:appsfactory_test/data/data_sources/artists_remote_data_source.dart';
import 'package:appsfactory_test/data/data_sources/image_local_data_source.dart';
import 'package:appsfactory_test/data/repositories/album_detail_repositories_impl.dart';
import 'package:appsfactory_test/data/repositories/artists_repositories_impl.dart';
import 'package:appsfactory_test/data/repositories/image_repositories_impl.dart';
import 'package:get_it/get_it.dart';

GetIt getIt = GetIt.instance;

class ServiceLocator{
  ServiceLocator(){
    _init();
  }

  factory ServiceLocator.init(){
    return ServiceLocator();
  }

  void _init(){
    final HttpClientImpl httpClient = HttpClientImpl();

    final DBClientImpl dbClient = DBClientImpl();

    final ImageClientImpl imageClient = ImageClientImpl();
    
    getIt.registerSingleton<AlbumDetailRepositoryImpl>(AlbumDetailRepositoryImpl(
      AlbumDetailRemoteDataSourceImpl(httpClient),
      AlbumsRemoteDataSourceImpl(httpClient),
      AlbumDetailLocalDataSourceImpl(dbClient),
    ));
    
    getIt.registerSingleton<ArtistsRepositoryImpl>(ArtistsRepositoryImpl(
      ArtistsRemoteDataSourceImpl(httpClient),
    ));

    getIt.registerSingleton<ImageRepositoryImpl>(ImageRepositoryImpl(
      ImageLocalDataSourceImpl(imageClient),
    ));
  }
}
