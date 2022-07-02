import 'dart:async';

import 'package:appsfactory_test/core/core.dart';

abstract class ImageLocalDataSource {
  Future<String?> getPath(String imageUrl);
  Future<void> save(String? imageUrl);
  Future<void> delete(String? imageUrl);
}

class ImageLocalDataSourceImpl implements ImageLocalDataSource {
  ImageLocalDataSourceImpl(this.imageClient);

  final ImageClient imageClient;
  
  @override
  Future<void> delete(String? imageUrl) async {
    await imageClient.delete(imageUrl);
  }
  
  @override
  Future<String?> getPath(String imageUrl) async {
    return imageClient.filePath(imageUrl);
  }
  
  @override
  Future<void> save(String? imageUrl) async {
    await imageClient.save(imageUrl);
  }
}
