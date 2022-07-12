import 'package:flutter/material.dart';
import 'package:fundzy/core/constant/constant.dart';
import 'package:gap/gap.dart';

class ActionContainers extends StatelessWidget {
  const ActionContainers(
      {Key? key, required this.color, required this.icon, required this.text})
      : super(key: key);
  final Color color;
  final String icon;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 60,
        decoration: BoxDecoration(
            color: color,
            borderRadius: const BorderRadius.all(Radius.circular(8))),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              Image(image: AssetImage(icon)),
              const Gap(16),
              Text(text,
                  style: const TextStyle(
                      fontFamily: AppFont.montserratBold,
                      fontWeight: FontWeight.w400,
                      color: Color(
                        0xff5E5E5E,
                      ),
                      fontSize: 17))
            ],
          ),
        ));
  }
}
