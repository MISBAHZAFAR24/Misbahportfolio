import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class CodingProfilesWidget extends StatelessWidget {
  const CodingProfilesWidget({super.key});

  // TODO: Replace with [Riverpod/Bloc] for production
  static const List<Map<String, dynamic>> _profiles = [
    {
      'name': 'LeetCode',
      'handle': 'MISBAHZAFAR24',
      'url': 'https://leetcode.com/u/MISBAHZAFAR24/',
      'color': 0xFFFFA116,
      'bg': 0xFFFFF8E8,
      'icon': Icons.code_rounded,
      'stat': '75+ problems',
    },
    {
      'name': 'GitHub',
      'handle': 'MISBAH-ZAFAR24',
      'url': 'https://github.com/MISBAH-ZAFAR24',
      'color': 0xFF1A1A2E,
      'bg': 0xFFF0F0F8,
      'icon': Icons.merge_type_rounded,
      'stat': 'Open Source',
    },
    {
      'name': 'LinkedIn',
      'handle': 'misbah',
      'url': 'https://www.linkedin.com/in/misbah',
      'color': 0xFF0A66C2,
      'bg': 0xFFE8F0FB,
      'icon': Icons.work_outline_rounded,
      'stat': 'Connect',
    },
  ];

  Future<void> _launch(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(
              width: 4,
              height: 20,
              decoration: BoxDecoration(
                color: theme.colorScheme.secondary,
                borderRadius: BorderRadius.circular(4),
              ),
            ),
            const SizedBox(width: 10),
            Text(
              'Coding Profiles',
              style: theme.textTheme.headlineSmall?.copyWith(
                color: theme.colorScheme.onSurface,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
        const SizedBox(height: 14),
        ...List.generate(_profiles.length, (i) {
          final p = _profiles[i];
          final color = Color(p['color'] as int);
          final bg = Color(p['bg'] as int);
          return Padding(
            padding: EdgeInsets.only(bottom: i < _profiles.length - 1 ? 12 : 0),
            child: GestureDetector(
              onTap: () => _launch(p['url'] as String),
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                decoration: BoxDecoration(
                  color: isDark ? theme.colorScheme.surface : bg,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: isDark
                        ? theme.colorScheme.outlineVariant
                        : color.withAlpha(51),
                  ),
                ),
                child: Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: isDark
                            ? theme.colorScheme.primaryContainer.withAlpha(50)
                            : color.withAlpha(38),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Icon(
                        p['icon'] as IconData,
                        color: isDark ? theme.colorScheme.primary : color,
                        size: 18,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            p['name'] as String,
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                              color: theme.colorScheme.onSurface,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          const SizedBox(height: 1),
                          Text(
                            '@${p['handle']}',
                            style: TextStyle(
                              fontSize: 11,
                              color: theme.colorScheme.onSurfaceVariant,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 5,
                      ),
                      decoration: BoxDecoration(
                        color: isDark
                            ? theme.colorScheme.primaryContainer.withAlpha(100)
                            : color.withAlpha(26),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        p['stat'] as String,
                        style: TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.w600,
                          color: isDark ? theme.colorScheme.primary : color,
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Container(
                      padding: const EdgeInsets.all(6),
                      decoration: BoxDecoration(
                        color: isDark ? theme.colorScheme.primary : color,
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.arrow_outward_rounded,
                        color: Colors.white,
                        size: 14,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        }),
      ],
    );
  }
}
