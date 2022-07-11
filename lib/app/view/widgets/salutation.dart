import 'package:flutter/material.dart';
import 'package:fundzy/core/constant/constant.dart';

class Salutation extends StatelessWidget {
  const Salutation({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children:  const [
          Image(
              fit: BoxFit.cover,
              image: AssetImage(
                AppAsset.appLogoWhite,
              )),
          Text('Welcome',
              style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontStyle: FontStyle.normal,
                  fontSize: 28,
                  color: AppColors.white,
                  fontFamily: AppFont.montserrat)),
          Text('Back',
              style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontStyle: FontStyle.normal,
                  fontSize: 28,
                  color: AppColors.white,
                  fontFamily: AppFont.montserrat))
        ]);
  }
}
