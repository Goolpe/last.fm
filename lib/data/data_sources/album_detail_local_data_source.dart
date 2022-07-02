import 'dart:async';

import 'package:appsfactory_test/core/core.dart';
import 'package:appsfactory_test/data/models/album_detail_model.dart';

abstract class AlbumDetailLocalDataSource {
  Future<AlbumDetailModel?> getAlbumDetail(String mbid);

  Future<void> saveAlbum(AlbumDetailModel albumDetailModel);

  Future<void> deleteAlbum(String mbid);
  
  bool containsAlbum(String mbid);

  Future<List<AlbumDetailModel>> getAlbums();

  Stream<AlbumDetailModelBoxEvent> watchStoredAlbum(String? key);
}

class AlbumDetailLocalDataSourceImpl implements AlbumDetailLocalDataSource {
  AlbumDetailLocalDataSourceImpl(this.dbClient);

  final DBClient dbClient;

  @override
  Future<List<AlbumDetailModel>> getAlbums() async {
    final List<Map<String, dynamic>> response = await dbClient.getAll(kAlbumsdb);

    final List<AlbumDetailModel> albumDetails = response
    .map(AlbumDetailModel.fromJson).toList();

    return albumDetails;
  }

  @override
  Future<AlbumDetailModel?> getAlbumDetail(String mbid) async {

    final Map<String, dynamic>? response = await dbClient.get(kAlbumsdb, mbid);

    if(response != null){
      return AlbumDetailModel.fromJson(response);
    }

    return null;
  }
  
  @override
  Future<void> saveAlbum(AlbumDetailModel albumDetailModel) async{  
    await dbClient.add(
      boxName: kAlbumsdb, 
      key: albumDetailModel.mbid!,
      value: albumDetailModel.toJson(),
    );
  }
  
  @override
  Future<void> deleteAlbum(String mbid) async {    
    await dbClient.delete(kAlbumsdb, mbid);
  }
  
  @override
  bool containsAlbum(String mbid) {
    return dbClient.contains(kAlbumsdb, mbid);
  }

  @override
  Stream<AlbumDetailModelBoxEvent> watchStoredAlbum(String? key) {
    return dbClient.watch(kAlbumsdb, key)
    .transform(StreamTransformer
    .fromHandlers(handleData: AlbumDetailModelBoxEvent.handleData));
  }
}

class AlbumDetailModelBoxEvent{
  AlbumDetailModelBoxEvent({
    required this.key,
    required this.value,
    required this.deleted,
  });

  final String key;
  final AlbumDetailModel value;
  final bool deleted;

  static void handleData(DecodedBoxEvent data, EventSink<AlbumDetailModelBoxEvent> sink) {
    final event = AlbumDetailModelBoxEvent(
      key: data.key,
      value: AlbumDetailModel.fromJson(data.value),
      deleted: data.deleted,
    );
    sink.add(event);
  }
}
