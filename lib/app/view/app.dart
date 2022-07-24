import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:fundzy/core/constant/constant.dart';
import 'package:fundzy/features/auth/presentation/provider/auth_provider.dart';
import 'package:fundzy/features/home/presentation/provider/transaction_provider.dart';
import 'package:fundzy/features/transfer/presentation/presentation.dart';
import 'package:fundzy/features/withdraw/presentation/presentation.dart';
import 'package:fundzy/injections.dart';
import 'package:provider/provider.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => sl<AuthProvider>(),
        ),
        ChangeNotifierProvider(
          create: (_) => sl<TransactionProvider>(),
        ),
        ChangeNotifierProvider(
          create: (_) => sl<TransferProvider>(),
        ),
        ChangeNotifierProvider(create: (_) => sl<WithdrawProvider>())
      ],
      child: MaterialApp(
        useInheritedMediaQuery: true,
        builder: DevicePreview.appBuilder,
        onGenerateRoute: generateRoute,
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          // appBarTheme: const AppBarTheme(
          //   color: AppColors.primaryColor,
          // ),
          primaryColor: AppColors.primaryColor,
          // colorScheme: ColorScheme.fromSwatch(
          //   accentColor: AppColors.primaryColor,
          // ),

          scaffoldBackgroundColor: AppColors.white,
        ),
        initialRoute: RouteName.splash,
      ),
    );
  }
}
