import 'package:flutter/material.dart';

class EducationSectionWidget extends StatelessWidget {
  const EducationSectionWidget({super.key});

  static const List<Map<String, dynamic>> _educationMaps = [
    {
      'institution': 'Jamia Hamdard',
      'degree': 'B.Tech Computer Science',
      'period': '2023 – 2027',
      'grade': 'Pursuing',
      'color': 0xFF6C63FF,
      'icon': Icons.school_rounded,
      'location': 'New Delhi',
    },
    {
      'institution': 'Victoria Public SR Sec School',
      'degree': '12th Class — CBSE',
      'period': '2021 – 2022',
      'grade': '76.8%',
      'color': 0xFF2ECC71,
      'icon': Icons.menu_book_rounded,
      'location': 'India',
    },
    {
      'institution': 'Victoria Public SR Sec School',
      'degree': '10th Class — CBSE',
      'period': '2019 – 2020',
      'grade': '70%',
      'color': 0xFFFFBF00,
      'icon': Icons.auto_stories_rounded,
      'location': 'India',
    },
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final cardBg = isDark ? theme.colorScheme.surface : Colors.white;
    final titleColor = theme.colorScheme.onSurface;
    final subtitleColor = theme.colorScheme.onSurfaceVariant;
    final periodColor = theme.colorScheme.onSurfaceVariant.withAlpha(153);

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
                'Education',
                style: theme.textTheme.headlineSmall?.copyWith(
                  color: titleColor,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
          const SizedBox(height: 14),
          ...List.generate(_educationMaps.length, (i) {
            final edu = _educationMaps[i];
            final color = Color(edu['color'] as int);
            final isLast = i == _educationMaps.length - 1;
            return Padding(
              padding: EdgeInsets.only(bottom: isLast ? 0 : 12),
              child: Container(
                padding: const EdgeInsets.all(18),
                decoration: BoxDecoration(
                  color: cardBg,
                  borderRadius: BorderRadius.circular(20),
                  border: Border(left: BorderSide(color: color, width: 4)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withAlpha(isDark ? 30 : 13),
                      blurRadius: 10,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: color.withAlpha(26),
                        borderRadius: BorderRadius.circular(14),
                      ),
                      child: Icon(
                        edu['icon'] as IconData,
                        color: color,
                        size: 20,
                      ),
                    ),
                    const SizedBox(width: 14),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            edu['institution'] as String,
                            style: theme.textTheme.titleSmall?.copyWith(
                              color: titleColor,
                              fontWeight: FontWeight.w700,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          const SizedBox(height: 2),
                          Text(
                            edu['degree'] as String,
                            style: theme.textTheme.bodySmall?.copyWith(
                              color: subtitleColor,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          const SizedBox(height: 4),
                          Text(
                            edu['period'] as String,
                            style: TextStyle(fontSize: 11, color: periodColor),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 6,
                      ),
                      decoration: BoxDecoration(
                        color: color.withAlpha(26),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        edu['grade'] as String,
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w700,
                          color: color,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
        ],
      ),
    );
  }
}
