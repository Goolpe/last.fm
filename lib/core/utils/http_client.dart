import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:appsfactory_test/core/core.dart';
import 'package:http/http.dart' as http;

abstract class HttpClient {
  Future<dynamic> get(String path);
}

class HttpClientImpl implements HttpClient {
  @override
  Future<dynamic> get(String path) async {
    try {
      final Uri url = Uri.parse(Api.fullPath(path));

      final response = await http.get(url);
    
      if (response.statusCode == 200) {
        return jsonDecode(utf8.decode(response.bodyBytes));
      } else if (response.statusCode == 404) {
        throw ServerException('Page not found');
      } else{
        throw ServerException(response.body);
      }
    } on TimeoutException catch (_) {
      throw ServerException('Timeout of request');
    } on SocketException catch(_){
      throw ClientException('No Internet connection :(');
    } on ServerException catch(error){
      throw ServerException(error.message.toString());
    } on Exception catch(error){
      throw ServerException(error.toString());
    }
  }
}
