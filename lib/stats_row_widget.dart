import 'package:flutter/material.dart';

class StatsRowWidget extends StatelessWidget {
  const StatsRowWidget({super.key});

  // Anatomy locked: 3-column horizontal stats, label above number
  static const List<Map<String, dynamic>> _stats = [
    {
      'label': 'Projects',
      'value': '2',
      'icon': Icons.work_rounded,
      'color': 0xFF6C63FF,
    },
    {
      'label': 'Skills',
      'value': '11',
      'icon': Icons.psychology_rounded,
      'color': 0xFFFF6B6B,
    },
    {
      'label': 'Certificates',
      'value': '3',
      'icon': Icons.emoji_events_rounded,
      'color': 0xFFFFBF00,
    },
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
        decoration: BoxDecoration(
          color: theme.cardColor,
          borderRadius: BorderRadius.circular(24),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withAlpha(theme.brightness == Brightness.dark ? 50 : 15),
              blurRadius: 16,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          children: List.generate(_stats.length * 2 - 1, (index) {
            if (index.isOdd) {
              return Container(
                width: 1,
                height: 40,
                color: theme.dividerColor.withAlpha(50),
              );
            }
            final i = index ~/ 2;
            final s = _stats[i];
            final color = Color(s['color'] as int);
            return Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    padding: const EdgeInsets.all(6),
                    decoration: BoxDecoration(
                      color: color.withAlpha(26),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(s['icon'] as IconData, color: color, size: 16),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    s['value'] as String,
                    style: theme.textTheme.headlineSmall?.copyWith(
                      color: theme.colorScheme.onSurface,
                      fontWeight: FontWeight.w800,
                      fontFeatures: [const FontFeature.tabularFigures()],
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 2),
                  Text(
                    s['label'] as String,
                    style: theme.textTheme.labelSmall?.copyWith(
                      color: theme.colorScheme.onSurfaceVariant,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            );
          }),
        ),
      ),
    );
  }
}
