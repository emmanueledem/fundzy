import 'dart:async';
import 'package:flutter/material.dart';
import 'package:fundzy/app/app.dart';
import 'package:fundzy/core/constant/constant.dart';
import 'package:fundzy/core/core.dart';
import 'package:fundzy/features/auth/presentation/provider/auth_provider.dart';
import 'package:gap/gap.dart';
import '../widget/widget.dart';
import 'package:fundzy/injections.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  
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
      _phoneNumberController.text,
      'Phone Number is required',
    );
    final passwordError = CustomFormValidation.errorMessagePassword(
      _passwordController.text,
      'Phone Number is required',
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
                      'Sign in',
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
                          CustomFormValidation.errorMessagePhoneNumber(
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
                      )
                    ],
                  ),
                  const Gap(109),
                  ValueListenableBuilder<bool>(
                      valueListenable: _canSubmit,
                      builder: (context, canSubmit, child) {
                        return AppBusyButton(
                          title: 'Sign In',
                          disabled: !canSubmit,
                          onPress: () async {
                            var navigator = Navigator.of(context);
                            final res = await sl<AuthProvider>().login(context,
                                phoneNumber: _phoneNumberController.text.trim(),
                                password: _passwordController.text.trim());
                            if (res) {
                              navigator.pushNamedAndRemoveUntil(
                                RouteName.appTab,
                                (route) => false,
                              );
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
