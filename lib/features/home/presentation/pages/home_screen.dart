import 'dart:async';

import 'package:flutter/material.dart';
import 'package:fundzy/app/app.dart';
import 'package:fundzy/core/constant/constant.dart';
import 'package:fundzy/core/core.dart';
import 'package:fundzy/features/home/presentation/presentation.dart';
import 'package:gap/gap.dart';
import 'package:fundzy/injections.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  Container(
                    width: double.infinity,
                    height: 278,
                    decoration: const BoxDecoration(
                        color: AppColors.primaryColor,
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(100),
                            bottomRight: Radius.circular(100))),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 60, top: 12),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 24, right: 30),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                const Image(
                                    image: AssetImage(AppAsset.prrofileImage)),
                                GestureDetector(
                                  onTap: () async {
                                    unawaited(AppPopups.showLoader(context));
                                    var res = await sl<LocalDataStorage>()
                                        .clearToken();
                                    if (res) {
                                      // ignore: use_build_context_synchronously
                                      Future.delayed(const Duration(seconds: 3),
                                          () {
                                        Navigator.of(context)
                                            .pushNamedAndRemoveUntil(
                                          RouteName.welcome,
                                          (route) => false,
                                        );
                                      });
                                    }
                                  },
                                  child: Container(
                                    height: 40,
                                    width: 40,
                                    decoration: BoxDecoration(
                                        color: AppColors.white,
                                        borderRadius: BorderRadius.circular(7)),
                                    child: const Icon(
                                      Icons.logout_sharp,
                                      color: AppColors.primaryColor,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          Row(
                            children: const [
                              Expanded(
                                child: Text('Good Morning, Alpha',
                                    style: TextStyle(
                                      color: AppColors.white,
                                      fontSize: 24,
                                      fontWeight: FontWeight.w400,
                                      fontFamily: AppFont.montserrat,
                                    )),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 190),
                      child: Container(
                          height: 321,
                          width: 321,
                          decoration: BoxDecoration(
                              color: AppColors.white,
                              borderRadius: BorderRadius.circular(40),
                              boxShadow: const [
                                BoxShadow(
                                    color: Color(0x1A000000),
                                    offset: Offset(0, 9),
                                    blurRadius: 50,
                                    spreadRadius: 0)
                              ]),
                          child: Padding(
                            padding: const EdgeInsets.all(32.0),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: const [
                                      Expanded(
                                        child: Text('Your total balance',
                                            style: TextStyle(
                                                fontFamily: AppFont.montserrat,
                                                fontSize: 16,
                                                color: Color(0xff3A3A3A))),
                                      ),
                                      Gap(90),
                                      Icon(Icons.more_horiz)
                                    ],
                                  ),
                                  const Gap(8),
                                  const Text(
                                    '5000.00',
                                    style: TextStyle(
                                        fontFamily: AppFont.montserratBold,
                                        fontSize: 30,
                                        color: Color(0xff2D99FF),
                                        fontWeight: FontWeight.w700),
                                  ),
                                  const Gap(26),
                                  const Expanded(
                                    child: Image(
                                        image: AssetImage(
                                            AppAsset.dashboardColumns)),
                                  )
                                ]),
                          )),
                    ),
                  )
                ],
              ),
              const Gap(50),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  GestureDetector(
                    onTap: () {},
                    child: const ActionContainers(
                      text: 'Transfer',
                      icon: AppAsset.tranferLogo,
                      color: Color(0xff36C4A2),
                    ),
                  ),
                  const Gap(22),
                  GestureDetector(
                    onTap: () {},
                    child: const ActionContainers(
                      text: 'Withdraw',
                      icon: AppAsset.witdraw,
                      color: Color(0xffFFF1D1),
                    ),
                  ),
                ],
              ),
              const Gap(70),
            ],
          ),
        ),
      ),
    );
  }
}
