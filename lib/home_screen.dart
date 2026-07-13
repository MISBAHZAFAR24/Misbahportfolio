import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'certifications_strip_widget.dart';
import 'hero_header_widget.dart';
import 'interests_section_widget.dart';
import 'internship_card_widget.dart';
import 'skills_chart_widget.dart';
import 'skills_section_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  late AnimationController _entranceController;
  late List<Animation<double>> _sectionAnimations;

  @override
  void initState() {
    super.initState();
    // TODO: Replace with [Riverpod/Bloc] for production
    _entranceController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 900),
    );
    _sectionAnimations = List.generate(6, (i) {
      final start = i * 0.12;
      final end = (start + 0.4).clamp(0.0, 1.0);
      return CurvedAnimation(
        parent: _entranceController,
        curve: Interval(start, end, curve: Curves.easeOutCubic),
      );
    });
    _entranceController.forward();
  }

  @override
  void dispose() {
    _entranceController.dispose();
    super.dispose();
  }

  Widget _animated(int index, Widget child) {
    return FadeTransition(
      opacity: _sectionAnimations[index],
      child: SlideTransition(
        position: Tween<Offset>(
          begin: const Offset(0, 0.06),
          end: Offset.zero,
        ).animate(_sectionAnimations[index]),
        child: child,
      ),
    );
  }

  bool get _isTablet => MediaQuery.of(context).size.width >= 600;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      body: SafeArea(
        bottom: false,
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(child: _animated(0, const HeroHeaderWidget())),
            SliverPadding(
              padding: EdgeInsets.fromLTRB(4.w, 0, 4.w, 0),
              sliver: SliverToBoxAdapter(
                child: _isTablet
                    ? Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 6,
                      child: Column(
                        children: [
                          _animated(1, const SkillsSectionWidget()),
                          _animated(2, const InternshipCardWidget()),
                          _animated(3, const CertificationsStripWidget()),
                        ],
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      flex: 4,
                      child: Column(
                        children: [
                          _animated(4, const SkillsChartWidget()),
                          _animated(5, const InterestsSectionWidget()),
                        ],
                      ),
                    ),
                  ],
                )
                    : Column(
                  children: [
                    _animated(1, const SkillsSectionWidget()),
                    _animated(2, const InternshipCardWidget()),
                    _animated(3, const SkillsChartWidget()),
                    _animated(4, const CertificationsStripWidget()),
                    _animated(5, const InterestsSectionWidget()),
                  ],
                ),
              ),
            ),
            const SliverToBoxAdapter(child: SizedBox(height: 120)),
          ],
        ),
      ),
    );
  }
}
