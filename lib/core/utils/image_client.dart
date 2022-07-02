import 'dart:io';
import 'package:appsfactory_test/core/core.dart';
import 'package:http/http.dart' as http;
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

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
      final File file = await _getFile(imageUrl);
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
      final File file = await _getFile(imageUrl);

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
      final File file = await _getFile(imageUrl);

      if(file.existsSync()){
        return file.path;
      }

      return null;
    } on Exception catch(error){
      throw DBException(error.toString());
    }
  }

  Future<File> _getFile(String imageUrl) async {
    final Directory documentDirectory = await getApplicationDocumentsDirectory();

    return File(join(documentDirectory.path, basename(imageUrl)));
  }
}
