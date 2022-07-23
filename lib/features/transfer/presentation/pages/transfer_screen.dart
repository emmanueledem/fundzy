import 'dart:async';
import 'package:flutter/material.dart';
import 'package:fundzy/app/app.dart';
import 'package:fundzy/core/constant/constant.dart';
import 'package:fundzy/core/core.dart';
import 'package:fundzy/injections.dart';
import 'package:gap/gap.dart';
import 'package:logger/logger.dart';

import '../presentation.dart';

class TransferScreen extends StatefulWidget {
  const TransferScreen({Key? key}) : super(key: key);

  @override
  State<TransferScreen> createState() => _TransferScreenState();
}

class _TransferScreenState extends State<TransferScreen> {
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _amountController = TextEditingController();

  final _phoneNumberFocus = FocusNode();
  final _amountFocus = FocusNode();

  late StreamController<String> phoneNumberStreamController;
  late StreamController<String> amountStreamController;
  final ValueNotifier<bool> _canSubmit = ValueNotifier(false);

  @override
  void initState() {
    phoneNumberStreamController = StreamController.broadcast();
    amountStreamController = StreamController.broadcast();

    _phoneNumberController.addListener(() {
      phoneNumberStreamController.sink.add(_phoneNumberController.text.trim());
      validateInputs();
    });

    _amountController.addListener(() {
      amountStreamController.sink.add(_amountController.text.trim());
      validateInputs();
    });
    super.initState();
  }

  void validateInputs() {
    var canSumit = true;

    final phoneNumberError = CustomFormValidation.errorMessagePhoneNumber(
      _phoneNumberController.text,
      'Phone Number is required',
    );
    final amountError = CustomFormValidation.errorMessageAmount(
      _amountController.text,
      'Amount is required',
    );
    if (phoneNumberError != '' || amountError != '') {
      canSumit = false;
    }
    _canSubmit.value = canSumit;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Transfer',
          style: TextStyle(
            fontFamily: AppFont.montserratBold,
            fontWeight: FontWeight.w500,
            color: Color.fromARGB(255, 12, 8, 8),
            fontSize: 20,
          ),
        ),
        backgroundColor: AppColors.white,
        foregroundColor: AppColors.primaryColor,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Gap(17),
            StreamBuilder<String>(
              stream: phoneNumberStreamController.stream,
              builder: (context, snapshot) {
                return InputField(
                  textInputType: TextInputType.text,
                  controller: _phoneNumberController,
                  placeholder: 'Enter PhoneNumber',
                  label: 'Phone Number',
                  fieldFocusNode: _phoneNumberFocus,
                  validationMessage:
                      CustomFormValidation.errorMessagePhoneNumber(
                    snapshot.data,
                    'Phone Number is required',
                  ),
                  validationColor: CustomFormValidation.getColor(
                    snapshot.data,
                    _phoneNumberFocus,
                    CustomFormValidation.errorMessagePhoneNumber(
                      snapshot.data,
                      'Phone Number is required ',
                    ),
                  ),
                );
              },
            ),
            const Gap(20),
            StreamBuilder<String>(
              stream: amountStreamController.stream,
              builder: (context, snapshot) {
                return InputField(
                  textInputType: TextInputType.number,
                  controller: _amountController,
                  placeholder: 'Enter Amount',
                  label: 'Amount',
                  fieldFocusNode: _amountFocus,
                  validationMessage: CustomFormValidation.errorMessageAmount(
                    snapshot.data,
                    'Amount is required',
                  ),
                  validationColor: CustomFormValidation.getColor(
                    snapshot.data,
                    _amountFocus,
                    CustomFormValidation.errorMessageAmount(
                      snapshot.data,
                      'Amount is required ',
                    ),
                  ),
                );
              },
            ),
            const Spacer(),
            ValueListenableBuilder<bool>(
                valueListenable: _canSubmit,
                builder: (context, canSubmit, child) {
                  return AppBusyButton(
                    title: 'Transfer',
                    disabled: !canSubmit,
                    onPress: () async {
                      var res = await sl<TransferProvider>().transfer(context,
                          phoneNumber: _phoneNumberController.text.trim(),
                          amount: int.parse(_amountController.text.trim()));
                      if (res) {
                        var data = sl<TransferProvider>().transferEntity;
                        // ignore: use_build_context_synchronously
                        Navigator.pushReplacementNamed(
                            context, RouteName.transferSuccess,
                            arguments: TransferSuccesParams(
                                message: data!.message,
                                amount: data.data!.sent));
                      }
                    },
                  );
                }),
            const Gap(20),
          ],
        ),
      ),
    );
  }
}
