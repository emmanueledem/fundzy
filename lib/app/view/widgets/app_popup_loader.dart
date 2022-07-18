import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fundzy/core/constant/constant.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class AppPopups {
  static Future<dynamic> showLoader(BuildContext context) {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return Center(
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            color: AppColors.primaryColor,
            child: Container(
              width: 100,
              height: 100,
              decoration: const BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.all(
                  Radius.circular(20),
                ),
              ),
              child: const Center(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 10,
                  ),
                  child: SpinKitRing(
                    color: Colors.white,
                    lineWidth: 3,
                    size: 27,
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
