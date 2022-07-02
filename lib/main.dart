import 'dart:async';
import 'dart:developer';

import 'package:appsfactory_test/application.dart';
import 'package:appsfactory_test/core/core.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();
  await Hive.openBox<String>(kAlbumsdb);

  ServiceLocator.init();

  runZonedGuarded(() async {
    runApp(const Application());
   },(Object error, StackTrace stackTrace) {
    log('Error :  $error');
    log('StackTrace :  $stackTrace');
  },);
}
