import 'dart:async';
import 'package:flutter/material.dart';
import 'package:fundzy/app/app.dart';
import 'package:fundzy/core/constant/constant.dart';
import 'package:fundzy/core/core.dart';
import 'package:fundzy/features/withdraw/presentation/presentation.dart';
import 'package:fundzy/injections.dart';
import 'package:gap/gap.dart';
import 'package:logger/logger.dart';

class WithdrawScreen extends StatefulWidget {
  const WithdrawScreen({Key? key}) : super(key: key);

  @override
  State<WithdrawScreen> createState() => _WithdrawScreenState();
}

class _WithdrawScreenState extends State<WithdrawScreen> {
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _amountController = TextEditingController();

  final _phoneNumberFocus = FocusNode();
  final _amountFocus = FocusNode();

  late StreamController<String> phoneNumberStreamController;
  late StreamController<String> amountStreamController;
  final ValueNotifier<bool> _canSubmit = ValueNotifier(false);

  @override
  void initState() {
    Logger().d('hello');
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
    Logger().d(_canSubmit);
    var canSumit = true;
    final phoneNumberError = CustomFormValidation.errorMessagePhoneNumber(
      _phoneNumberController.text,
      'Phone Number is required',
    );
    final amountError = CustomFormValidation.errorMessageAmount(
      _amountController.text,
      'Phone Number is required',
    );
    if (phoneNumberError != '' || amountError != '') {
      canSumit = false;
      Logger().d(_canSubmit);
    
    }
    Logger().d(_canSubmit);
    _canSubmit.value = canSumit;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Withdraw',
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
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
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
                      textInputType: TextInputType.text,
                      controller: _amountController,
                      placeholder: 'Enter Amount',
                      label: 'Amount',
                      fieldFocusNode: _amountFocus,
                      validationMessage:
                          CustomFormValidation.errorMessageAmount(
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
                const Gap(18),
                ValueListenableBuilder<bool>(
                    valueListenable: _canSubmit,
                    builder: (context, canSubmit, child) {
                      return AppBusyButton(
                          title: 'Withdraw',
                          disabled: !canSubmit,
                          onPress: () async {
                            Logger().d(canSubmit);
                            Logger().d("Hello4");
                            var res = await sl<WithdrawProvider>().withdraw(
                                context,
                                phoneNumber: _phoneNumberController.text.trim(),
                                amount: int.parse(_amountController.text.trim()));
                            if (res) {
                              Logger().d('HEy');
                            // var data = sl<WithdrawProvider>().transferEntity;
                            // // ignore: use_build_context_synchronously
                            // Navigator.pushReplacementNamed(
                            //     context, RouteName.transferSuccess,
                            //     arguments: WithdrawSuccesParams(
                            //         message: data!.message,
                            //         amount: data.data!.sent));
                          }
                          },
                          );
                    }),
                const Gap(20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
