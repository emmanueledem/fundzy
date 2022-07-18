import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import '../../../core/constant/constant.dart';

class AppBusyButton extends StatelessWidget {
  const AppBusyButton({Key? key, required this.title,  required this.onPress,
    this.disabled = false,}) : super(key: key);

  final String title;
  final VoidCallback onPress;
  final bool disabled;
  
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: disabled ? null  : onPress,
      child: Container(
        height: 72,
        decoration: BoxDecoration(
            color: AppColors.primaryColor,
            borderRadius: BorderRadius.circular(20),
            boxShadow: const [
              BoxShadow(
                  color: Color(0x331B39FF),
                  offset: Offset(0, 8),
                  blurRadius: 16,
                  spreadRadius: 0)
            ]),
        child: Stack(
          alignment: AlignmentDirectional.center,
          children: [
            const Positioned(
                right: 0.0,
                top: 0.0,
                child: ClipRRect(
                  borderRadius: BorderRadius.only(topRight: Radius.circular(18)),
                  child: Image(
                      fit: BoxFit.cover,
                      image: AssetImage(AppAsset.buttonEllipse1)),
                )),
            const Positioned(
                right: 0.0,
                top: 0.0,
                child: ClipRRect(
                  borderRadius: BorderRadius.only(topRight: Radius.circular(18)),
                  child: Image(
                      fit: BoxFit.cover,
                      image: AssetImage(AppAsset.buttonEllipse2)),
                )),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Text(
                title,
                style: const TextStyle(
                    fontFamily: AppFont.montserrat,
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                    color: AppColors.white),
              ),
              const Gap(197),
              const Image(
                image: AssetImage(AppIcon.rightArrow),
              ),
            ])
          ],
        ),
      ),
    );
  }
}
