import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import 'status_badge_widget.dart';

class HeroHeaderWidget extends StatelessWidget {
  const HeroHeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [theme.colorScheme.primary, theme.colorScheme.primaryContainer],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(32),
          bottomRight: Radius.circular(32),
        ),
      ),
      child: Stack(
        children: [
          // Decorative circles
          Positioned(
            top: -30,
            right: -30,
            child: Container(
              width: 140,
              height: 140,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: theme.colorScheme.secondary.withAlpha(38),
              ),
            ),
          ),
          Positioned(
            bottom: 20,
            right: 60,
            child: Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: theme.colorScheme.tertiary.withAlpha(51),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(5.w, 5.h, 5.w, 4.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Portfolio',
                      style: theme.textTheme.labelLarge?.copyWith(
                        color: Colors.white.withAlpha(179),
                        letterSpacing: 2,
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.white.withAlpha(26),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Icon(
                        Icons.code_rounded,
                        color: Colors.white,
                        size: 20,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Misbah',
                            style: theme.textTheme.displayMedium?.copyWith(
                              color: Colors.white,
                              fontWeight: FontWeight.w800,
                              height: 1.1,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                          Text(
                            'Zafar',
                            style: theme.textTheme.displayMedium?.copyWith(
                              color: theme.colorScheme.onPrimary.withAlpha(230),
                              fontWeight: FontWeight.w800,
                              height: 1.1,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                          const SizedBox(height: 8),
                          Text(
                            'Software Developer & AI/ML Enthusiast',
                            style: theme.textTheme.bodyMedium?.copyWith(
                              color: Colors.white.withAlpha(204),
                            ),
                          ),
                          const SizedBox(height: 12),
                          StatusBadgeWidget(
                            label: 'Open to Work',
                            backgroundColor: theme.colorScheme.tertiary.withAlpha(51),
                            textColor: theme.colorScheme.tertiary,
                            icon: Icons.circle,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 16),
                    // Avatar circle
                    Container(
                      width: 88,
                      height: 88,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Colors.white.withAlpha(77),
                          width: 3,
                        ),
                        color: theme.colorScheme.secondary.withAlpha(77),
                      ),
                      child: ClipOval(
                        child: Image.asset(
                          'assets/images/profile.jpg',
                          width: 88,
                          height: 88,
                          fit: BoxFit.cover,
                          semanticLabel: 'Misbah Zafar profile photo',
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                // Quick info chips
                Wrap(
                  spacing: 8,
                  runSpacing: 6,
                  children: [
                    _infoChip(Icons.school_outlined, 'Jamia Hamdard'),
                    _infoChip(Icons.location_on_outlined, 'New Delhi, India'),
                    _infoChip(
                      Icons.cloud_outlined,
                      'Microsoft AI Azure Intern',
                    ),
                    _infoChip(Icons.phone_outlined, '+91 9990809852'),
                    _infoChip(
                      Icons.email_outlined,
                      'zafarhassan3748@gmail.com',
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _infoChip(IconData icon, String label) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: Colors.white.withAlpha(31),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.white.withAlpha(51)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 12, color: Colors.white.withAlpha(204)),
          const SizedBox(width: 5),
          Text(
            label,
            style: TextStyle(
              fontSize: 11,
              color: Colors.white.withAlpha(230),
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
