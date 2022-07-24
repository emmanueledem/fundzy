import 'package:flutter/material.dart';
import 'package:fundzy/core/constant/constant.dart';
import 'package:fundzy/core/core.dart';

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
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10),
          child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Image(
                  image: AssetImage(AppIcon.checkCircle),
                ),
                Text(widget.successparams!.message!.toString(),
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        fontStyle: FontStyle.normal,
                        fontSize: 34,
                        color: AppColors.black,
                        fontFamily: AppFont.montserratBold)),
                Text(
                    textAlign: TextAlign.center,
                    'Your order for ${AmountUtil.formatAmount(widget.successparams!.amount!.toDouble())} transfer was placed successfully!',
                    style: const TextStyle(
                        fontFamily: AppFont.montserrat,
                        color: AppColors.black,
                        fontSize: 18)),
                // const Spacer(),
                Expanded(
                  child: Align(
                    alignment: FractionalOffset.bottomCenter,
                    child: GestureDetector(
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
                    ),
                  ),
                )
              ]),
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
