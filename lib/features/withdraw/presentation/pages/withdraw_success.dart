import 'package:flutter/material.dart';
import 'package:fundzy/core/constant/constant.dart';
import 'package:fundzy/core/core.dart';

class WithdrawSuccess extends StatefulWidget {
  const WithdrawSuccess({Key? key, required this.withdrawParams})
      : super(key: key);
  final WithdrawSuccesParams? withdrawParams;

  @override
  State<WithdrawSuccess> createState() => _WithdrawSuccessState();
}

class _WithdrawSuccessState extends State<WithdrawSuccess> {
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
                    child: Text(widget.withdrawParams!.message!.toString(),
                        style: const TextStyle(
                            fontStyle: FontStyle.normal,
                            fontSize: 34,
                            color: AppColors.black,
                            fontFamily: AppFont.montserratBold)),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 50),
                    child: Text(
                        'Your order for ${AmountUtil.formatAmount(widget.withdrawParams!.amount!.toDouble())} withdrawal was placed successfully!',
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

class WithdrawSuccesParams {
  final String? message;
  final int? amount;

  WithdrawSuccesParams({required this.message, required this.amount});
}
