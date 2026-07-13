import 'package:flutter/material.dart';

import 'coding_profiles_widget.dart';
import 'project_card_widget.dart';
import 'projects_header_widget.dart';

class ProjectsScreen extends StatefulWidget {
  const ProjectsScreen({super.key});

  @override
  State<ProjectsScreen> createState() => _ProjectsScreenState();
}

class _ProjectsScreenState extends State<ProjectsScreen>
    with TickerProviderStateMixin {
  late AnimationController _entranceController;
  late List<Animation<double>> _itemAnimations;

  @override
  void initState() {
    super.initState();
    // TODO: Replace with [Riverpod/Bloc] for production
    _entranceController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );
    _itemAnimations = List.generate(5, (i) {
      final start = i * 0.1;
      return CurvedAnimation(
        parent: _entranceController,
        curve: Interval(
          start,
          (start + 0.5).clamp(0.0, 1.0),
          curve: Curves.easeOutCubic,
        ),
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
      opacity: _itemAnimations[index],
      child: SlideTransition(
        position: Tween<Offset>(
          begin: const Offset(0, 0.08),
          end: Offset.zero,
        ).animate(_itemAnimations[index]),
        child: child,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SafeArea(
        bottom: false,
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: _animated(0, const ProjectsHeaderWidget()),
            ),
            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              sliver: SliverList(
                delegate: SliverChildListDelegate([
                  _animated(
                    1,
                    const ProjectCardWidget(
                      title: 'MEDCARE PLUS',
                      description:
                      'A comprehensive healthcare management app built with Flutter. Features include patient appointment booking, medical records, prescription tracking, and doctor consultation via chat.',
                      techStack: ['Flutter', 'Dart', 'Firebase', 'REST API'],
                      cardColor: Color(0xFF6C63FF),
                      icon: Icons.local_hospital_rounded,
                      status: 'Completed',
                      year: '2024',
                      projectUrl: 'https://medcare-app-2304.web.app',
                    ),
                  ),
                  const SizedBox(height: 16),
                  _animated(
                    2,
                    const ProjectCardWidget(
                      title: 'EMOTION DETECTION SYSTEM',
                      description:
                      'An AI-powered real-time emotion recognition system using computer vision and deep learning. Detects 7 emotions from facial expressions with 87% accuracy using CNN models.',
                      techStack: ['Python', 'TensorFlow', 'OpenCV', 'CNN'],
                      cardColor: Color(0xFFFF6B6B),
                      icon: Icons.face_retouching_natural_rounded,
                      status: 'Completed',
                      year: '2024',
                    ),
                  ),
                  const SizedBox(height: 28),
                  _animated(3, const CodingProfilesWidget()),
                  const SizedBox(height: 120),
                ]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
