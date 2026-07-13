import 'package:flutter/material.dart';

class InterestsSectionWidget extends StatelessWidget {
  const InterestsSectionWidget({super.key});

  static const List<Map<String, dynamic>> _interests = [
    {
      'label': 'Game Development',
      'icon': Icons.sports_esports_rounded,
      'color': 0xFF6C63FF,
    },
    {
      'label': 'Travelling',
      'icon': Icons.flight_takeoff_rounded,
      'color': 0xFF2ECC71,
    },
    {
      'label': 'Problem Solving',
      'icon': Icons.extension_rounded,
      'color': 0xFFFF6B6B,
    },
    {'label': 'Open Source', 'icon': Icons.code_rounded, 'color': 0xFFFFBF00},
    {
      'label': 'AI Research',
      'icon': Icons.auto_awesome_rounded,
      'color': 0xFF3776AB,
    },
    {
      'label': 'Photography',
      'icon': Icons.camera_alt_rounded,
      'color': 0xFFE91E63,
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
                'Interests',
                style: theme.textTheme.headlineSmall?.copyWith(
                  color: theme.colorScheme.onSurface,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
          const SizedBox(height: 14),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: _interests.map((item) {
              final color = Color(item['color'] as int);
              return Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 14,
                  vertical: 9,
                ),
                decoration: BoxDecoration(
                  color: color.withAlpha(26),
                  borderRadius: BorderRadius.circular(24),
                  border: Border.all(color: color.withAlpha(77)),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(item['icon'] as IconData, size: 15, color: color),
                    const SizedBox(width: 7),
                    Text(
                      item['label'] as String,
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: theme.colorScheme.onSurface,
                      ),
                    ),
                  ],
                ),
              );
            }).toList(),
          ),
          const SizedBox(height: 8),
        ],
      ),
    );
  }
}
