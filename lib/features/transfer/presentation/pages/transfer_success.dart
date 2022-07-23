import 'package:flutter/material.dart';
import 'package:fundzy/app/app.dart';
import 'package:fundzy/core/constant/constant.dart';
import 'package:fundzy/core/core.dart';
import 'package:logger/logger.dart';

class TransferSucess extends StatefulWidget {
  const TransferSucess({Key? key, required this.successparams})
      : super(key: key);

  final TransferSuccesParams? successparams;
  @override
  State<TransferSucess> createState() => _TransferSucessState();
}

class _TransferSucessState extends State<TransferSucess> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10),
        child: SafeArea(
          child: Center(
            child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Image(
                    image: AssetImage(AppIcon.checkCircle),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 50),
                    child: Text(widget.successparams!.message!.toString(),
                        style: const TextStyle(
                            fontStyle: FontStyle.normal,
                            fontSize: 34,
                            color: AppColors.black,
                            fontFamily: AppFont.montserratBold)),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 50),
                    child: Text(
                        'Your order for ${AmountUtil.formatAmount(widget.successparams!.amount!.toDouble())} transfer was placed successfully!',
                        style: const TextStyle(
                            fontFamily: AppFont.montserrat,
                            color: AppColors.black,
                            fontSize: 18)),
                  ),
                  const Spacer(),
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          color: AppColors.primaryColor,
                          borderRadius: BorderRadius.circular(8)),
                      height: 50,
                      width: double.infinity,
                      child: const Center(
                          child: Text(
                        'Close',
                        style: TextStyle(
                            color: AppColors.white,
                            fontFamily: AppFont.montserratBold,
                            fontSize: 15),
                      )),
                    ),
                  )
                ]),
          ),
        ),
      ),
    );
  }
}

class TransferSuccesParams {
  final String? message;
  final int? amount;

  TransferSuccesParams({required this.message, required this.amount});
}
