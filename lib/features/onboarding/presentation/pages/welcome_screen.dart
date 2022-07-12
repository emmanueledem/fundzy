import 'package:flutter/material.dart';
import 'package:fundzy/app/app.dart';
import 'package:fundzy/core/constant/constant.dart';
import 'package:gap/gap.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(children: [
              const Positioned(
                  child: Image(
                      fit: BoxFit.cover,
                      image: AssetImage(AppAsset.welcomeEl1))),
              const Positioned(
                  child: Image(
                      fit: BoxFit.cover,
                      image: AssetImage(AppAsset.welcomeEl2))),
              Positioned(
                child: Image(
                    width: MediaQuery.of(context).size.width,
                    fit: BoxFit.cover,
                    image: const AssetImage(AppAsset.welcomeEl3)),
              ),
              const Positioned(top: 64, left: 52, child: Salutation()),
            ]),
            const Gap(30),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, RouteName.signIn);
                    },
                    child: const AppBusyButton(
                      title: 'Sign in',
                    ),
                  ),
                  const Gap(16),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, RouteName.signUp);
                      
                    },
                    child: Container(
                      height: 72,
                      decoration: BoxDecoration(
                          color: AppColors.white,
                          border: Border.all(color: AppColors.primaryColor),
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: const [
                            BoxShadow(
                                color: Color(0x331B39FF),
                                offset: Offset(31, 675),
                                blurRadius: 16,
                                spreadRadius: 0)
                          ]),
                      child: Stack(
                        alignment: AlignmentDirectional.center,
                        children: [
                          Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Text(
                                  'Sign Up',
                                  style: TextStyle(
                                      fontFamily: AppFont.montserrat,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 14,
                                      color: AppColors.primaryColor),
                                ),
                                Gap(197),
                                Image(
                                  color: AppColors.primaryColor,
                                  image: AssetImage(AppIcon.rightArrow),
                                ),
                              ])
                        ],
                      ),
                    ),
                  ),
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
