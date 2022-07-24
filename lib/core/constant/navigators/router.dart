import 'package:flutter/material.dart';
import 'package:fundzy/core/constant/navigators/navigators.dart';
import 'package:fundzy/features/features.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case RouteName.splash:
      return _getPageRoute(
        routeName: settings.name!,
        viewToShow: const SplashScreen(),
      );

    case RouteName.welcome:
      return _getPageRoute(
        routeName: settings.name!,
        viewToShow: const WelcomeScreen(),
      );

    case RouteName.signIn:
      return _getPageRoute(
        routeName: settings.name!,
        viewToShow: const SignIn(),
      );

    case RouteName.signUp:
      return _getPageRoute(
        routeName: settings.name!,
        viewToShow: const SignUp(),
      );

    case RouteName.appTab:
      return _getPageRoute(
        routeName: settings.name!,
        viewToShow: const AppTabScreen(),
      );

    case RouteName.transfer:
      return _getPageRoute(
        routeName: settings.name!,
        viewToShow: const TransferScreen(),
      );

    case RouteName.transferSuccess:
      final args = settings.arguments as TransferSuccesParams;
      return _getPageRoute(
        routeName: settings.name!,
        viewToShow: TransferSucess(
          successparams: args,
        ),
      );

    case RouteName.withdraw:
      return _getPageRoute(
        routeName: settings.name!,
        viewToShow: const WithdrawScreen(),
      );

    case RouteName.withdrawSucess:
      final args = settings.arguments as WithdrawSuccesParams;
      return _getPageRoute(
        routeName: settings.name!,
        viewToShow: WithdrawSuccess(
          withdrawParams: args,
        ),
      );

    default:
      return MaterialPageRoute<dynamic>(
        builder: (_) => Scaffold(
          body: Center(
            child: Text('No route defined for ${settings.name}'),
          ),
        ),
      );
  }
}

Route<dynamic> _getPageRoute({
  required String routeName,
  required Widget viewToShow,
}) {
  return MaterialPageRoute(
    settings: RouteSettings(
      name: routeName,
    ),
    builder: (_) => viewToShow,
  );
}
