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

    // case RouteName.appTab:
    //   return _getPageRoute(
    //     routeName: settings.name!,
    //     viewToShow: const AppTabView(),
    //   );

    // case RouteName.readNews:
    //   // ignore: cast_nullable_to_non_nullable
    //   final args = settings.arguments as ReadNewsScreenParams;
    //   return _getPageRoute(
    //     routeName: settings.name!,
    //     viewToShow: ReadNewsScreen(
    //       params: args,
    //     ),
    //   );

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
