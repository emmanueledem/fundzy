import 'package:flutter/material.dart';
import 'package:fundzy/core/constant/constant.dart';
import 'package:fundzy/core/core.dart';
import 'package:fundzy/injections.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 4), () {
      _handleStartup();
    });

    super.initState();
  }

  void _handleStartup() async {
await  sl<LocalDataStorage>().getToken().then((value) {
      if (value == null || value == '') {
        Navigator.pushReplacementNamed(
          context,
          RouteName.welcome,
        );
      } else {
        Navigator.pushReplacementNamed(
          context,
          RouteName.appTab,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Image(image: AssetImage(AppAsset.splahImage)),
      ),
    );
  }
}
