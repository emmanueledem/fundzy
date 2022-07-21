// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class NoDataWidget extends StatelessWidget {
  final String text;
  const NoDataWidget({
    Key? key,
    required this.text,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // double vWidth = MediaQuery.of(context).size.width;
    return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
           
            Text(
              text,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 18.5),),
            const Gap(40)
          ],
        ));
  }
}
