import 'dart:async';
import 'package:flutter/material.dart';
import 'package:fundzy/app/app.dart';
import 'package:fundzy/core/constant/constant.dart';
import 'package:fundzy/core/core.dart';
import 'package:fundzy/features/auth/presentation/provider/auth_provider.dart';
import 'package:fundzy/injections.dart';
import 'package:gap/gap.dart';

import '../widget/widget.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final _phoneNumberFocus = FocusNode();
  final _passwordFocus = FocusNode();

  late StreamController<String> phoneNumberStreamController;
  late StreamController<String> passwordStreamController;
  final ValueNotifier<bool> _canSubmit = ValueNotifier(false);

  @override
  void initState() {
    phoneNumberStreamController = StreamController.broadcast();
    passwordStreamController = StreamController.broadcast();

    _phoneNumberController.addListener(() {
      phoneNumberStreamController.sink.add(_phoneNumberController.text.trim());
      validateInputs();
    });

    _passwordController.addListener(() {
      passwordStreamController.sink.add(_passwordController.text.trim());
      validateInputs();
    });

    super.initState();
  }

  void validateInputs() {
    var canSumit = true;
    final phoneNumberError = CustomFormValidation.errorMessagePhoneNumber(
      _phoneNumberController.text.trim(),
      'Phone Number is required',
    );
    final passwordError = CustomFormValidation.errorMessagePassword(
      _passwordController.text.trim(),
      'Password is required',
    );
    if (phoneNumberError != '' || passwordError != '') {
      canSumit = false;
    }
    _canSubmit.value = canSumit;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const AuthAnimation(),
            const Gap(30),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                children: [
                  Row(children: const [
                    Text(
                      'Sign up',
                      style: TextStyle(
                        fontFamily: AppFont.montserratBold,
                        fontWeight: FontWeight.w700,
                        color: Color.fromARGB(255, 12, 8, 8),
                        fontSize: 28,
                      ),
                    ),
                  ]),
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
                          CustomFormValidation.errorMessagePassword(
                            snapshot.data,
                            'Phone Number is required ',
                          ),
                        ),
                      );
                    },
                  ),
                  const Gap(24),
                  StreamBuilder<String>(
                    stream: passwordStreamController.stream,
                    builder: (context, snapshot) {
                      return InputField(
                        textInputType: TextInputType.text,
                        controller: _passwordController,
                        placeholder: 'Enter Password',
                        label: 'Password',
                        password: true,
                        fieldFocusNode: _passwordFocus,
                        suffix: true,
                        validationMessage:
                            CustomFormValidation.errorMessagePassword(
                          snapshot.data,
                          'Password is required',
                        ),
                        validationColor: CustomFormValidation.getColor(
                          snapshot.data,
                          _passwordFocus,
                          CustomFormValidation.errorMessagePassword(
                            snapshot.data,
                            'Password is required ',
                          ),
                        ),
                      );
                    },
                  ),
                  const Gap(24),
                  Row(
                    children: const [
                      Text(
                        'Forgot Password ?',
                        style: TextStyle(
                            fontSize: 14,
                            fontFamily: AppFont.montserrat,
                            fontWeight: FontWeight.w400,
                            color: AppColors.primaryColor),
                      ),
                    ],
                  ),
                  const Gap(109),
                  ValueListenableBuilder<bool>(
                      valueListenable: _canSubmit,
                      builder: (context, canSubmit, child) {
                        return AppBusyButton(
                          title: 'Sign Up',
                          disabled: !canSubmit,
                          onPress: () async {
                            final res = await sl<AuthProvider>().signUp(
                              context,
                              phoneNumber: _phoneNumberController.text.trim(),
                              password: _passwordController.text.trim(),
                            );
                            if (res) {
                              // ignore: use_build_context_synchronously
                              Future.delayed(const Duration(seconds: 4), () {
                                Navigator.of(context).pushReplacementNamed(
                                  RouteName.signIn,
                                );
                                // _phoneNumberController.clear();
                                // _passwordController.clear();
                              });
                            }
                          },
                        );
                      }),
                  const Gap(16),
                ],
              ),
            ),
            const Gap(65)
          ],
        ),
      ),
    );
  }
}
