import 'dart:io';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

class Helpers{

  static String durationToMinutes(int totalSeconds) {
    if(totalSeconds < 0){
      return '00:00';
    }

    final Duration duration = Duration(seconds: totalSeconds);
    final int minutes = duration.inMinutes;
    final int seconds = totalSeconds % 60;

    final String minutesString = '$minutes'.padLeft(2, '0');
    final String secondsString = '$seconds'.padLeft(2, '0');

    return '$minutesString:$secondsString';
  }

  static Future<File> getAppFile(String path) async {
    final Directory documentDirectory = await getApplicationDocumentsDirectory();

    return File(join(documentDirectory.path, path));
  }
}
