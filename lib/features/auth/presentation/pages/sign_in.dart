import 'package:flutter/material.dart';
import 'package:fundzy/app/app.dart';
import 'package:fundzy/core/constant/constant.dart';
import 'package:gap/gap.dart';
import '../widget/widget.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  FocusNode focusNode = FocusNode();
  String phoneNumberHintText = 'xx123344444';
  String passwordHintText = '********';
  @override
  void initState() {
    super.initState();
    focusNode.addListener(() {
      if (focusNode.hasFocus) {
        phoneNumberHintText = '';
        passwordHintText = '';
      } else {
        phoneNumberHintText = 'xx123344444';
        passwordHintText = '********';
      }
      setState(() {});
    });
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
              child: Form(
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
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Phone Number',
                          style: TextStyle(
                              color: Color(0xffBABABA),
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              fontFamily: AppFont.montserrat,
                              fontStyle: FontStyle.normal),
                        ),
                        const Gap(16),
                        TextFormField(
                          style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black87,
                              fontFamily: 'poppins',
                              height: 1.3),
                          decoration: kinputdecorationStyle.copyWith(
                            hintText: phoneNumberHintText,
                          ),
                        ),
                      ],
                    ),
                    const Gap(24),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Password',
                          style: TextStyle(
                              color: Color(0xffBABABA),
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              fontFamily: AppFont.montserrat,
                              fontStyle: FontStyle.normal),
                        ),
                        const Gap(16),
                        TextFormField(
                          obscureText: true,
                          style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black87,
                              fontFamily: 'poppins',
                              height: 1.3),
                          decoration: kinputdecorationStyle.copyWith(
                            hintText: passwordHintText,
                            suffixIcon: const Icon(Icons.remove_red_eye_sharp),
                          ),
                        )
                      ],
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
                    AppBusyButton(
                      title: 'Sign in',
                      onPress: () {
                        Navigator.pushNamed(context, RouteName.appTab);
                      },
                    ),
                    const Gap(16),
                  ],
                ),
              ),
            ),
            const Gap(65)
          ],
        ),
      ),
    );
  }
}
