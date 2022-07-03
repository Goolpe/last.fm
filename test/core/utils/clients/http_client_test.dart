import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:appsfactory_test/core/clients/http_client.dart';
import 'package:appsfactory_test/core/config/api.dart';
import 'package:appsfactory_test/core/exceptions/exceptions.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'http_client_test.mocks.dart';

@GenerateMocks([http.Client])
void main() {

  late MockClient mockClient;
  late HttpClient client;

  const path = 'test';
  final url = Uri.parse(Api.fullPath(path));

  setUp((){
    mockClient = MockClient();
    client = HttpClientImpl(mockClient);
  });

  group('get', () {

    test('should return mockJson', () async { 
      const mockJson = '{}';

      when(mockClient.get(url)).thenAnswer((_) async => http.Response(mockJson, 200));

      expect(await client.get(path), jsonDecode(mockJson));
    });

    test('should throw ServerException on 404 status code', () async { 
      when(mockClient.get(url)).thenAnswer((_) async => http.Response('', 404));

      expect(client.get(path), throwsA(const TypeMatcher<ServerException>()));
    });

    test('should throw ServerException on 500 status code', () async { 
      when(mockClient.get(url)).thenAnswer((_) async => http.Response('', 500));

      expect(client.get(path), throwsA(const TypeMatcher<ServerException>()));
    });
    
    test('should throw ServerException on timeout', () async { 
      when(mockClient.get(url)).thenThrow(TimeoutException('timeout'));

      expect(client.get(path), throwsA(const TypeMatcher<ServerException>()));
    });

    test('should throw ClientException on socket exception', () async { 
      when(mockClient.get(url)).thenThrow(const SocketException('socket'));

      expect(client.get(path), throwsA(const TypeMatcher<ClientException>()));
    });

    test('should throw ServerException on exception', () async { 
      when(mockClient.get(url)).thenThrow(Exception());

      expect(client.get(path), throwsA(const TypeMatcher<ServerException>()));
    });
  });
}
