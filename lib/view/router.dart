import 'package:flutter/material.dart';
import 'package:gallery/view/PageNotFound.dart';
import 'package:gallery/view/account.dart';
import 'package:gallery/view/chat.dart';
import 'package:gallery/view/handchecks.dart';
import 'package:gallery/view/home.dart';
import 'package:gallery/view/intro.dart';
import 'package:gallery/view/navbar.dart';
import 'package:go_router/go_router.dart';

final GoRouter router = GoRouter(
  errorPageBuilder: (context, state) => MaterialPage(child: PageNotFound()),
  routes: <RouteBase>[
    GoRoute(
        path: '/',
        builder: (BuildContext context, GoRouterState state) {
          return const Intro();
        },
        routes: <RouteBase>[]),
    ShellRoute(
      builder: (context, state, child) {
        return Scaffold(
          body: child,
          bottomNavigationBar: Navbar(),
          floatingActionButton: Transform.rotate(
            angle: 45,
            child: FloatingActionButton(
              backgroundColor: Colors.black,
              onPressed: () {},
              child: Transform.rotate(
                angle: -45,
                child: Icon(
                  Icons.add_circle_outline_sharp,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
        );
      },
      routes: [
        GoRoute(
          path: '/home',
          builder: (BuildContext context, GoRouterState state) {
            return const Home();
          },
          routes: [
            GoRoute(
              path: '/chat',
              builder: (BuildContext context, GoRouterState state) {
                return const Chat();
              },
            ),
            GoRoute(
              path: '/Handchecks',
              builder: (BuildContext context, GoRouterState state) {
                return const Handchecks();
              },
            ),
            GoRoute(
              path: '/Account',
              builder: (BuildContext context, GoRouterState state) {
                return const Account();
              },
            ),
          ],
        ),
      ],
    ),
  ],
);

class ScreenPaths {
  static String splash = '/';
  static String intro = '/welcome';
  static String home = '/home';
  // static String settings = '/settings';
}
