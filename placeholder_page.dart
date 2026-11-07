import 'package:flutter/material.dart';

import '../../core/theme/app_colors.dart';
import '../../l10n/app_localizations.dart';

/// Honest empty state for screens that are built in later phases.
/// It shows no fake data.
class PlaceholderPage extends StatelessWidget {
  const PlaceholderPage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    final text = Theme.of(context).textTheme;
    final colors = Theme.of(context).extension<VyoraColors>()!;

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: text.headlineMedium?.copyWith(fontWeight: FontWeight.w700)),
            const Spacer(),
            Center(
              child: Text(
                AppLocalizations.of(context).comingSoon,
                style: text.bodyLarge?.copyWith(color: colors.muted),
                textAlign: TextAlign.center,
              ),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
