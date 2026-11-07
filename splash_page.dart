import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../core/router/app_router.dart';
import '../../core/theme/app_colors.dart';
import '../../core/widgets/vyora_logo.dart';
import '../../l10n/app_localizations.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    // Phase 2C replaces this with a session check (signed in -> home,
    // otherwise -> sign-in).
    _timer = Timer(const Duration(milliseconds: 1200), () {
      if (mounted) context.go(Routes.home);
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final text = Theme.of(context).textTheme;
    final colors = Theme.of(context).extension<VyoraColors>()!;
    final l = AppLocalizations.of(context);

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const VyoraLogo(size: 112),
            const SizedBox(height: 28),
            Text(
              l.appName,
              style: text.displaySmall?.copyWith(
                fontWeight: FontWeight.w700,
                letterSpacing: 8,
              ),
            ),
            const SizedBox(height: 12),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 48),
              child: Text(
                l.tagline,
                textAlign: TextAlign.center,
                style: text.titleMedium?.copyWith(color: colors.muted),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
