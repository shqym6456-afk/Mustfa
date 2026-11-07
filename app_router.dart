import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../features/shell/main_shell.dart';
import '../../features/shell/placeholder_page.dart';
import '../../features/splash/splash_page.dart';
import '../../l10n/app_localizations.dart';

abstract final class Routes {
  static const splash = '/splash';
  static const home = '/home';
  static const goals = '/goals';
  static const tasks = '/tasks';
  static const challenges = '/challenges';
  static const progress = '/progress';
}

final routerProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    initialLocation: Routes.splash,
    routes: [
      GoRoute(
        path: Routes.splash,
        builder: (context, state) => const SplashPage(),
      ),
      StatefulShellRoute.indexedStack(
        builder: (context, state, shell) => MainShell(shell: shell),
        branches: [
          _branch(Routes.home, (l) => l.navHome),
          _branch(Routes.goals, (l) => l.navGoals),
          _branch(Routes.tasks, (l) => l.navTasks),
          _branch(Routes.challenges, (l) => l.navChallenges),
          _branch(Routes.progress, (l) => l.navProgress),
        ],
      ),
    ],
  );
});

StatefulShellBranch _branch(
  String path,
  String Function(AppLocalizations) title,
) {
  return StatefulShellBranch(
    routes: [
      GoRoute(
        path: path,
        builder: (BuildContext context, GoRouterState state) =>
            PlaceholderPage(title: title(AppLocalizations.of(context))),
      ),
    ],
  );
}
