import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sunnyrichman/pages/aboutme_page.dart';
import 'package:sunnyrichman/pages/irproject_page.dart';
import 'package:sunnyrichman/pages/webproject_page.dart';

void main() {runApp(const MyApp());}

final GoRouter _router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const AboutmePage();
      },
      routes: <RouteBase>[
        GoRoute(
          path: '/ir_project',
          builder: (BuildContext context, GoRouterState state) {
            return const IRprojectPage();
          },
        ),
        GoRoute(
          path: '/web_project',
          builder: (BuildContext context, GoRouterState state) {
            return const FESTAprojectPage();
          },
        ),
        // GoRoute(
        //   path: 'details',
        //   builder: (BuildContext context, GoRouterState state) {
        //     return const IRprojectPage();
        //   },
        // ),
      ],
      
    ),
  ],
);
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _router,
    );
  }
}