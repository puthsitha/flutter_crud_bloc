import 'package:crud_api/app/app.dart';
import 'package:crud_api/bootstrap.dart';
import 'package:crud_api/core/di/locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: '.env.prod');
  await setUpLocator();
  await bootstrap(() => const App());
}
