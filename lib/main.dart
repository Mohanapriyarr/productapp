import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:logging/logging.dart';
import 'package:palestine_console/palestine_console.dart';

import 'app/routes/app_pages.dart';

final log = Logger("");

void main() {
  //? Log everything in debug builds.  Log severe (and up) in release builds.
  Logger.root.level = kDebugMode ? Level.ALL : Level.SEVERE;
  Logger.root.onRecord.listen((record) {
    record.level.name.contains('INFO') ? Print.yellow('''
  --🚀 ${record.time}
|
  --${record.message}
''') : Print.red('🚀 ${record.time}\n~ ${record.message}');
  });
  runApp(
    GetMaterialApp(
      title: "Application",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      debugShowCheckedModeBanner: false,
    ),
  );
}
