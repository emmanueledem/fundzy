import 'package:flutter/material.dart';
import 'package:fundzy/app/app.dart';
import 'package:fundzy/core/constant/constant.dart';

class AuthAnimation extends StatelessWidget {
  const AuthAnimation({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(children:  const [
      Positioned(
          child: Image(
              fit: BoxFit.cover,
              image: AssetImage(AppAsset.authEllipse1))),
      Positioned(
          child: Image(
              fit: BoxFit.cover,
              image: AssetImage(AppAsset.authEllipse2))),
      Positioned(
        child: Image(
            fit: BoxFit.cover,
            image: AssetImage(AppAsset.authEllipse3)),
      ),
      Positioned(top: 64, left: 52, child: Salutation()),
    ]);
  }
}
