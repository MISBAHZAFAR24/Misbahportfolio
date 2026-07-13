import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class SocialLinksWidget extends StatelessWidget {
  const SocialLinksWidget({super.key});

  static const List<Map<String, dynamic>> _links = [
    {
      'title': 'GitHub',
      'subtitle': 'View repositories & code',
      'url': 'https://github.com/MISBAH-ZAFAR24',
      'color': 0xFF1A1A2E,
      'bg': 0xFFF0F0F8,
      'icon': Icons.merge_type_rounded,
    },
    {
      'title': 'LinkedIn',
      'subtitle': 'Professional network profile',
      'url': 'https://www.linkedin.com/in/misbah-zafar-5a3985323?utm_source=share_via&utm_content=profile&utm_medium=member_android',
      'color': 0xFF0A66C2,
      'bg': 0xFFE8F0FB,
      'icon': Icons.work_outline_rounded,
    },
    {
      'title': 'LeetCode',
      'subtitle': '75+ problems solved',
      'url': 'https://leetcode.com/u/MISBAHZAFAR24/',
      'color': 0xFFFFA116,
      'bg': 0xFFFFF8E8,
      'icon': Icons.code_rounded,
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

    return Padding(
      padding: const EdgeInsets.only(bottom: 24),
      child: Column(
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
                'Connect',
                style: theme.textTheme.headlineSmall?.copyWith(
                  color: theme.colorScheme.onSurface,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          ...List.generate(_links.length, (i) {
            final link = _links[i];
            final color = Color(link['color'] as int);
            final bg = Color(link['bg'] as int);
            final isLast = i == _links.length - 1;
            return Padding(
              padding: EdgeInsets.only(bottom: isLast ? 0 : 12),
              child: GestureDetector(
                onTap: () => _launch(link['url'] as String),
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 12),
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
                          link['icon'] as IconData,
                          color: isDark ? theme.colorScheme.primary : color,
                          size: 18,
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              link['title'] as String,
                              style: theme.textTheme.titleSmall?.copyWith(
                                color: theme.colorScheme.onSurface,
                                fontWeight: FontWeight.w700,
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            const SizedBox(height: 1),
                            Text(
                              link['subtitle'] as String,
                              style: theme.textTheme.bodySmall?.copyWith(
                                color: theme.colorScheme.onSurfaceVariant,
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 6),
                      Container(
                        padding: const EdgeInsets.all(6),
                        decoration: BoxDecoration(
                          color: isDark ? theme.colorScheme.primary : color,
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.arrow_outward_rounded,
                          color: Colors.white,
                          size: 12,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }),
        ],
      ),
    );
  }
}
