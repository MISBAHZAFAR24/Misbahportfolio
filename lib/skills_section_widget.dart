import 'package:flutter/material.dart';

class SkillsSectionWidget extends StatelessWidget {
  const SkillsSectionWidget({super.key});

  static const List<Map<String, dynamic>> _skills = [
    {
      'name': 'Flutter',
      'icon': Icons.phone_android_rounded,
      'color': 0xFF6C63FF,
    },
    {'name': 'Python', 'icon': Icons.terminal_rounded, 'color': 0xFF3776AB},
    {'name': 'Java', 'icon': Icons.coffee_rounded, 'color': 0xFFED8B00},
    {
      'name': 'JavaScript',
      'icon': Icons.javascript_rounded,
      'color': 0xFFF7DF1E,
    },
    {'name': 'SQL', 'icon': Icons.storage_rounded, 'color': 0xFF00758F},
    {'name': 'AI/ML', 'icon': Icons.psychology_rounded, 'color': 0xFFFF6B6B},
    {'name': 'HTML/CSS', 'icon': Icons.web_rounded, 'color': 0xFFE34F26},
    {'name': 'Git', 'icon': Icons.merge_type_rounded, 'color': 0xFFF05032},
    {'name': 'REST API', 'icon': Icons.api_rounded, 'color': 0xFF2ECC71},
    {'name': 'DSA', 'icon': Icons.account_tree_rounded, 'color': 0xFFFFBF00},
    {'name': 'OOPs', 'icon': Icons.layers_rounded, 'color': 0xFF9B59B6},
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 24, 0, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _sectionHeader(theme, 'Tech Skills'),
          const SizedBox(height: 14),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: _skills.map((s) => _skillChip(s)).toList(),
          ),
        ],
      ),
    );
  }

  Widget _sectionHeader(ThemeData theme, String title) {
    return Row(
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
          title,
          style: theme.textTheme.headlineSmall?.copyWith(
            color: theme.colorScheme.onSurface,
            fontWeight: FontWeight.w700,
          ),
        ),
      ],
    );
  }

  Widget _skillChip(Map<String, dynamic> skill) {
    final color = Color(skill['color'] as int);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 7),
      decoration: BoxDecoration(
        color: color.withAlpha(26),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: color.withAlpha(77)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(skill['icon'] as IconData, size: 14, color: color),
          const SizedBox(width: 6),
          Text(
            skill['name'] as String,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: color.withAlpha(230),
            ),
          ),
        ],
      ),
    );
  }
}
