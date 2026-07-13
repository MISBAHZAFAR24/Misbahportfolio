import 'package:flutter/material.dart';

import 'status_badge_widget.dart';

class ProfilePhotoWidget extends StatelessWidget {
  const ProfilePhotoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final screenWidth = MediaQuery.of(context).size.width;
    return Container(
      width: double.infinity,
      height: screenWidth >= 600 ? 320 : 280,
      decoration: BoxDecoration(
        color: theme.scaffoldBackgroundColor,
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(32),
          bottomRight: Radius.circular(32),
        ),
      ),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          // Decorative abstract shapes
          Positioned(
            top: 20,
            right: 30,
            child: Container(
              width: 110,
              height: 110,
              decoration: BoxDecoration(
                color: theme.colorScheme.secondary.withAlpha(51),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(60),
                  topRight: Radius.circular(60),
                  bottomLeft: Radius.circular(60),
                ),
              ),
            ),
          ),
          Positioned(
            top: 60,
            right: 10,
            child: Container(
              width: 70,
              height: 70,
              decoration: BoxDecoration(
                color: theme.colorScheme.tertiary.withAlpha(51),
                borderRadius: BorderRadius.circular(40),
              ),
            ),
          ),
          Positioned(
            top: 30,
            left: 20,
            child: Container(
              width: 55,
              height: 55,
              decoration: BoxDecoration(
                color: theme.colorScheme.secondary.withAlpha(38),
                shape: BoxShape.circle,
              ),
            ),
          ),
          Positioned(
            top: 10,
            left: 60,
            child: Container(
              width: 30,
              height: 30,
              decoration: BoxDecoration(
                color: theme.colorScheme.secondary.withAlpha(77),
                shape: BoxShape.circle,
              ),
            ),
          ),
          // Portrait photo
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Hero(
                  tag: 'profile-photo',
                  child: Container(
                    width: 130,
                    height: 130,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: isDark ? theme.colorScheme.surface : Colors.white,
                        width: 4,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: theme.colorScheme.secondary.withAlpha(64),
                          blurRadius: 20,
                          offset: const Offset(0, 8),
                        ),
                      ],
                    ),
                    child: ClipOval(
                      child: Image.asset(
                        'assets/images/profile.jpg',
                        width: 130,
                        height: 130,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) => Container(
                          color: theme.colorScheme.surfaceContainerHighest,
                          child: Icon(Icons.person,
                              size: 60, color: theme.colorScheme.onSurfaceVariant),
                        ),
                        semanticLabel: 'Misbah Zafar profile photo',
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  'Misbah Zafar',
                  style: theme.textTheme.displaySmall?.copyWith(
                    color: theme.colorScheme.onSurface,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  'Software Developer & AI Enthusiast',
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: theme.colorScheme.onSurfaceVariant,
                  ),
                ),
                const SizedBox(height: 10),
                StatusBadgeWidget(
                  label: 'Actively Looking',
                  backgroundColor: isDark
                      ? theme.colorScheme.primaryContainer.withAlpha(50)
                      : theme.colorScheme.secondaryContainer,
                  textColor: isDark ? theme.colorScheme.primary : theme.colorScheme.secondary,
                  icon: Icons.check_circle_rounded,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
