import 'package:flutter/material.dart';
import 'package:fundzy/core/constant/constant.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _handleStartup();
  }

  void _handleStartup() {
    Future<dynamic>.delayed(const Duration(seconds: 3),
      
      () => Navigator.pushReplacementNamed(
            context,
            RouteName.welcome,
          ),
    );
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
