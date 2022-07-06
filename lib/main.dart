import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:fundzy/bootstrap.dart';
import 'app/view/view.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await dotenv.load();
  // configureDependencies();
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
