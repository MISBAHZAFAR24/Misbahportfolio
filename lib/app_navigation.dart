import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'main.dart';

class _TabSpec {
  final IconData icon;
  final IconData selectedIcon;
  final String label;
  final int? branchIndex;
  const _TabSpec({
    required this.icon,
    required this.selectedIcon,
    required this.label,
    required this.branchIndex,
  });
}

// V2 Floating Pill — detached bar floating above content
class AppNavigation extends StatefulWidget {
  final StatefulNavigationShell navigationShell;
  const AppNavigation({required this.navigationShell, super.key});

  @override
  State<AppNavigation> createState() => _AppNavigationState();
}

class _AppNavigationState extends State<AppNavigation> {
  int _selectedVisualIndex = 0;

  static const List<_TabSpec> _tabs = [
    _TabSpec(
      icon: Icons.home_outlined,
      selectedIcon: Icons.home_rounded,
      label: 'Home',
      branchIndex: 0,
    ),
    _TabSpec(
      icon: Icons.work_outline_rounded,
      selectedIcon: Icons.work_rounded,
      label: 'Projects',
      branchIndex: 1,
    ),
    _TabSpec(
      icon: Icons.person_outline_rounded,
      selectedIcon: Icons.person_rounded,
      label: 'Profile',
      branchIndex: 2,
    ),
    _TabSpec(
      icon: Icons.contact_mail_outlined,
      selectedIcon: Icons.contact_mail_rounded,
      label: 'Contact',
      branchIndex: 3,
    ),
  ];

  void _onTap(int visualIndex) {
    final tab = _tabs[visualIndex];
    if (tab.branchIndex == null) return;
    setState(() => _selectedVisualIndex = visualIndex);
    widget.navigationShell.goBranch(
      tab.branchIndex!,
      initialLocation: tab.branchIndex == widget.navigationShell.currentIndex,
    );
  }

  @override
  Widget build(BuildContext context) {
    final shellIndex = widget.navigationShell.currentIndex;
    for (int i = 0; i < _tabs.length; i++) {
      if (_tabs[i].branchIndex == shellIndex) {
        _selectedVisualIndex = i;
        break;
      }
    }

    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 24),
      child: ValueListenableBuilder<ThemeMode>(
        valueListenable: themeModeNotifier,
        builder: (context, themeMode, _) {
          final theme = Theme.of(context);
          final isDark = themeMode == ThemeMode.dark;
          return Container(
            height: 68,
            decoration: BoxDecoration(
              color: isDark ? theme.colorScheme.surface : theme.colorScheme.primary,
              borderRadius: BorderRadius.circular(36),
              boxShadow: [
                BoxShadow(
                  color: (isDark ? Colors.black : theme.colorScheme.primary).withAlpha(89),
                  blurRadius: 24,
                  offset: const Offset(0, 10),
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ...List.generate(_tabs.length, (i) {
                  final tab = _tabs[i];
                  final isActive = i == _selectedVisualIndex;
                  final isStub = tab.branchIndex == null;
                  return GestureDetector(
                    onTap: () => _onTap(i),
                    behavior: HitTestBehavior.opaque,
                    child: Opacity(
                      opacity: isStub ? 0.4 : 1.0,
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 250),
                        curve: Curves.easeOutCubic,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 14,
                          vertical: 10,
                        ),
                        decoration: BoxDecoration(
                          color: isActive
                              ? Colors.white.withAlpha(38)
                              : Colors.transparent,
                          borderRadius: BorderRadius.circular(28),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              isActive ? tab.selectedIcon : tab.icon,
                              color: isActive
                                  ? Colors.white
                                  : Colors.white.withAlpha(128),
                              size: 22,
                            ),
                            AnimatedSize(
                              duration: const Duration(milliseconds: 200),
                              curve: Curves.easeOutCubic,
                              child: isActive
                                  ? Padding(
                                padding: const EdgeInsets.only(left: 6),
                                child: Text(
                                  tab.label,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              )
                                  : const SizedBox.shrink(),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                }),
                // Dark mode toggle
                GestureDetector(
                  onTap: () {
                    themeModeNotifier.value = isDark
                        ? ThemeMode.light
                        : ThemeMode.dark;
                  },
                  behavior: HitTestBehavior.opaque,
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 250),
                    curve: Curves.easeOutCubic,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 10,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white.withAlpha(20),
                      borderRadius: BorderRadius.circular(28),
                    ),
                    child: Icon(
                      isDark
                          ? Icons.light_mode_rounded
                          : Icons.dark_mode_rounded,
                      color: Colors.white.withAlpha(200),
                      size: 20,
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
