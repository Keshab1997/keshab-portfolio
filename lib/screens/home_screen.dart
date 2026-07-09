import 'package:flutter/material.dart';
import '../widgets/particle_background.dart';
import '../widgets/custom_cursor.dart';
import 'sections/navbar_section.dart';
import 'sections/hero_section.dart';
import 'sections/about_section.dart';
import 'sections/skills_section.dart';
import 'sections/projects_section.dart';
import 'sections/gallery_section.dart';
import 'sections/timeline_section.dart';
import 'sections/contact_section.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late final ScrollController _scrollController;

  final _heroKey = GlobalKey();
  final _aboutKey = GlobalKey();
  final _skillsKey = GlobalKey();
  final _projectsKey = GlobalKey();
  final _galleryKey = GlobalKey();
  final _timelineKey = GlobalKey();
  final _contactKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollToSection(int index) {
    final keys = [
      _heroKey,
      _aboutKey,
      _skillsKey,
      _projectsKey,
      _galleryKey,
      _timelineKey,
      _contactKey,
    ];
    if (index < keys.length) {
      final context = keys[index].currentContext;
      if (context != null) {
        Scrollable.ensureVisible(
          context,
          duration: const Duration(milliseconds: 800),
          curve: Curves.easeInOutCubic,
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        // Don't use custom cursor on mobile
        final useCustomCursor = constraints.maxWidth > 768;
Widget content = Scaffold(
  body: ParticleBackground(
    child: Scrollbar(
      controller: _scrollController,
      thumbVisibility: true,
      child: SingleChildScrollView(
        controller: _scrollController,
        child: Column(
          children: [
            NavbarSection(onNavTap: _scrollToSection),
            HeroSection(key: _heroKey),
            AboutSection(key: _aboutKey),
            SkillsSection(key: _skillsKey),
            ProjectsSection(key: _projectsKey),
            GallerySection(key: _galleryKey),
            TimelineSection(key: _timelineKey),
            ContactSection(key: _contactKey),
            // Footer
            Container(
              padding: const EdgeInsets.all(40),
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(
                    color: Colors.white.withOpacity(0.04),
                  ),
                ),
              ),
              child: const Center(
                child: Text(
                  '✦ 2026 Keshab Sarkar — Built with Flutter & ❤️',
                  style: TextStyle(
                    color: Color(0xFF444488),
                    fontSize: 13,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    ),
  ),
);

        if (useCustomCursor) {
          content = CustomCursor(child: content);
        }
        return content;
      },
    );
  }
}
