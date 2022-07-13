import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fundzy/bootstrap.dart';
import 'package:fundzy/core/constant/colors.dart';
import 'app/view/view.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await dotenv.load(fileName: '.env');
  // configureDependencies();
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: AppColors.white,
    statusBarIconBrightness: Brightness.dark, // status bar icon color
    systemNavigationBarIconBrightness:
        Brightness.dark, // color of navigation controls
  ));

  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitDown,
    DeviceOrientation.portraitUp,
  ]);

  await bootstrap(
    () => DevicePreview(
        // ignore: avoid_redundant_argument_values
        enabled: !kReleaseMode,
        builder: (context) {
          return const App();
        }),
  );
}
