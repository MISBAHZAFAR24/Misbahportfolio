import 'package:flutter/material.dart';

class CertificationsStripWidget extends StatelessWidget {
  const CertificationsStripWidget({super.key});

  static const List<Map<String, dynamic>> _certs = [
    {
      'title': 'Computer Training',
      'issuer': 'Government Certified',
      'icon': Icons.computer_rounded,
      'color': 0xFF6C63FF,
      'year': '2023',
    },
    {
      'title': 'Hacksphere',
      'issuer': 'Copy Code',
      'icon': Icons.emoji_events_rounded,
      'color': 0xFFFFBF00,
      'year': '2024',
    },
    {
      'title': 'AR Lenses',
      'issuer': 'Snapchat',
      'icon': Icons.filter_rounded,
      'color': 0xFFFFFC00,
      'year': '2025',
    },
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.only(top: 24),
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
                'Certifications',
                style: theme.textTheme.headlineSmall?.copyWith(
                  color: theme.colorScheme.onSurface,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
          const SizedBox(height: 14),
          SizedBox(
            height: 145,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.only(right: 8),
              itemCount: _certs.length,
              separatorBuilder: (_, __) => const SizedBox(width: 12),
              itemBuilder: (context, i) {
                final c = _certs[i];
                final color = Color(c['color'] as int);
                return Container(
                  width: 160,
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: color.withAlpha(20),
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: color.withAlpha(64)),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: color.withAlpha(38),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Icon(
                          c['icon'] as IconData,
                          size: 20,
                          color: color,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        c['title'] as String,
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w700,
                          color: theme.colorScheme.onSurface,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 3),
                      Text(
                        c['issuer'] as String,
                        style: TextStyle(
                          fontSize: 11,
                          color: theme.colorScheme.onSurfaceVariant,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 8),
                      Text(
                        c['year'] as String,
                        style: TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.w600,
                          color: color,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
