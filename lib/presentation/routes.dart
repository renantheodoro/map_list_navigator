import 'package:flutter/material.dart';
import 'package:map_navigation/presentation/routes_paths.dart';
import 'package:map_navigation/presentation/views/result_page.dart';

import '../designsystem/custom_appbar.dart';

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutePaths.mapScreen:
        return MaterialPageRoute<dynamic>(
          settings: settings,
          builder: (_) => const ResultPage(),
        );

      default:
        return MaterialPageRoute<dynamic>(
          builder: (_) => Scaffold(
            appBar: DesignSystemAppBar(),
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
}
