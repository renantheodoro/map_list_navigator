import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:map_navigation/designsystem/colors.dart';
import 'package:map_navigation/di/data_layer_factory.dart';
import 'package:map_navigation/presentation/routes.dart';
import 'package:map_navigation/presentation/routes_paths.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(const MapApp(
      key: Key('appKey'),
    ));
  });
}

class MapApp extends StatelessWidget {
  const MapApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (context) => getOriginsResultViewModel(context),
      builder: (context, child) => const App(),
    );
  }
}

class App extends StatelessWidget {
  const App({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Palette.pink100,
      statusBarBrightness: Brightness.dark,
    ));
    return const MaterialApp(
      title: 'Map App',
      debugShowCheckedModeBanner: false,
      initialRoute: RoutePaths.mapScreen,
      onGenerateRoute: AppRouter.generateRoute,
    );
  }
}
