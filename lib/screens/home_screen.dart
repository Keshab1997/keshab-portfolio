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

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final _scrollController = ScrollController();

  void _scrollToSection(int index) {
    const offsets = [0.0, 700.0, 1400.0, 2200.0, 3100.0, 3900.0, 4700.0];
    if (index < offsets.length) {
      _scrollController.animateTo(
        offsets[index],
        duration: const Duration(milliseconds: 800),
        curve: Curves.easeInOutCubic,
      );
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
            child: SingleChildScrollView(
              controller: _scrollController,
              child: Column(
                children: [
                  NavbarSection(onNavTap: _scrollToSection),
                  const HeroSection(),
                  const AboutSection(),
                  const SkillsSection(),
                  const ProjectsSection(),
                  const GallerySection(),
                  const TimelineSection(),
                  const ContactSection(),
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
        );

        if (useCustomCursor) {
          content = CustomCursor(child: content);
        }
        return content;
      },
    );
  }
}
