import 'package:flutter/material.dart';
import 'package:gallery/view/router.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routeInformationProvider: router.routeInformationProvider,
      routeInformationParser: router.routeInformationParser,
      debugShowCheckedModeBanner: false,
      routerDelegate: router.routerDelegate,
      // routerConfig: router,
    );
  }
}
