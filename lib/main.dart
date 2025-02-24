import 'package:ewa_store/data/repositories/authentication/authentication_repository.dart';
import 'package:flutter/material.dart';
import 'package:ewa_store/app.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

Future<void> main() async {
  final WidgetsBinding widgetsBinding =
      WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  
  Get.put(AuthenticationRepository());
  runApp(const App());
}
