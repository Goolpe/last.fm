
import 'dart:async';
import 'dart:convert';

import 'package:hive_flutter/hive_flutter.dart';

abstract class DBClient{
  Future<Map<String, dynamic>?> get(String boxName, String key);
  Future<List<Map<String, dynamic>>> getAll(String boxName);
  Future<void> delete(String boxName, String key);
  Future<void> add({
    required String boxName, 
    required String key, 
    required Map<String, dynamic> value,
  });
  void listen(String boxName, Function() onUpdate);
  bool contains(String boxName, String key);
  Stream<DecodedBoxEvent> watch(String boxName, String? key);
}

class DBClientImpl implements DBClient{

  @override
  Future<Map<String, dynamic>?> get(String boxName, String key) async {
    final Box<String> box = Hive.box<String>(boxName);
    final String? json = box.get(key);

    if(json != null){
      return jsonDecode(json);
    }

    return null;
  }

  @override
  Future<List<Map<String, dynamic>>> getAll(String boxName) async {
    final Box<String> box = Hive.box<String>(boxName);

    return box.values.map((String e) => jsonDecode(e)).cast<Map<String, dynamic>>().toList();
  }

  @override
  Future<void> add({
    required String boxName, 
    required String key, 
    required Map<String, dynamic> value,
  }) async {
    final String json = jsonEncode(value);
    final Box<String> box = Hive.box<String>(boxName);
    await box.put(key, json);
  }

  @override
  Future<void> delete(String boxName, String key) async {
    final Box<String> box = Hive.box<String>(boxName);
    await box.delete(key);
  }

  @override
  void listen(String boxName, Function() onUpdate) {
    final Box<String> box = Hive.box<String>(boxName);
    box.listenable().addListener(() {
      onUpdate();
    });
  }

  @override
  bool contains(String boxName, String key){
    final Box<String> box = Hive.box<String>(boxName);

    return box.containsKey(key);
  }

  @override
  Stream<DecodedBoxEvent> watch(
    String boxName, 
    String? key,
  ) {
    final Box<String> box = Hive.box<String>(boxName);

    return box.watch(key: key)
    .transform(StreamTransformer.fromHandlers(handleData: DecodedBoxEvent.handleData));
  }
}

class DecodedBoxEvent{
  DecodedBoxEvent({
    required this.key,
    required this.value,
    required this.deleted,
  });

  final String key;
  final Map<String, dynamic> value;
  final bool deleted;

  static void handleData(BoxEvent data, EventSink<DecodedBoxEvent> sink) {
    final event = DecodedBoxEvent(
      key: data.key as String? ?? '',
      value: data.value != null
      ? jsonDecode(data.value) as Map<String, dynamic>
      : {},
      deleted: data.deleted,
    );
    sink.add(event);
  }
}
