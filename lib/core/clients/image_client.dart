import 'dart:io';
import 'package:appsfactory_test/core/core.dart';
import 'package:http/http.dart' as http;
import 'package:path/path.dart';

abstract class ImageClient{
  Future<void> save(String? imageUrl);
  Future<void> delete(String? imageUrl);
  Future<String?> filePath(String imageUrl);
}

class ImageClientImpl implements ImageClient{

  @override
  Future<void> save(String? imageUrl) async{
    if(imageUrl == null || imageUrl.isEmpty){
      return;
    }

    try{
      final http.Response response = await http.get(Uri.parse(imageUrl));
      final File file = await Helpers.getAppFile(basename(imageUrl));
      file.writeAsBytesSync(response.bodyBytes);
    } on Exception catch(error){
      throw DBException(error.toString());
    }
  }
  
  @override
  Future<void> delete(String? imageUrl) async {
    if(imageUrl == null || imageUrl.isEmpty){
      return;
    }

    try{
      final File file = await Helpers.getAppFile(basename(imageUrl));

      if(file.existsSync()){
        file.deleteSync();
      }
    } on Exception catch(error){
      throw DBException(error.toString());
    }
  }

  @override
  Future<String?> filePath(String imageUrl) async {
    try{
      final File file = await Helpers.getAppFile(basename(imageUrl));

      if(file.existsSync()){
        return file.path;
      }

      return null;
    } on Exception catch(error){
      throw DBException(error.toString());
    }
  }
}
