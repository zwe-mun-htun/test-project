import 'package:go_router/go_router.dart';
import 'package:test_project/src/config/router/route_path.dart';

import '../../presentation/screens/screens.dart';

final appRouter = GoRouter(
  routes: [
    // Define your routes here
    GoRoute(
      path: RoutePaths.homeRoute,
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      path: RoutePaths.loginRoute,
      builder: (context, state) => const LoginScreen(),
    ),
  ],
);
