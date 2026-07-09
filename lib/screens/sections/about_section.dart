import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _badge('✦ Who I Am'),
          const SizedBox(height: 20),
          ShaderMask(
            shaderCallback: (bounds) => const LinearGradient(
              colors: [Colors.white, AppTheme.primary, AppTheme.secondary],
            ).createShader(bounds),
            child: const Text(
              'About Me',
              style: TextStyle(
                color: Colors.white,
                fontSize: 48,
                fontWeight: FontWeight.w900,
              ),
            ),
          ),
          const SizedBox(height: 40),
          LayoutBuilder(
            builder: (context, constraints) {
              if (constraints.maxWidth < 700) {
                return _buildMobileLayout();
              }
              return _buildDesktopLayout();
            },
          ),
        ],
      ),
    );
  }

  Widget _buildDesktopLayout() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: Container(
            height: 400,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24),
              border: Border.all(
                color: AppTheme.primary.withOpacity(0.3),
                width: 2,
              ),
              color: AppTheme.primary.withOpacity(0.05),
            ),
            child: const Center(
              child: Text(
                '📸 Your Photo Here',
                style: TextStyle(fontSize: 48),
              ),
            ),
          ),
        ),
        const SizedBox(width: 60),
        Expanded(child: _buildAboutText()),
      ],
    );
  }

  Widget _buildMobileLayout() {
    return Column(
      children: [
        Container(
          height: 300,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24),
            border: Border.all(
              color: AppTheme.primary.withOpacity(0.3),
              width: 2,
            ),
            color: AppTheme.primary.withOpacity(0.05),
          ),
          child: const Center(
            child: Text(
              '📸 Your Photo Here',
              style: TextStyle(fontSize: 48),
            ),
          ),
        ),
        const SizedBox(height: 40),
        _buildAboutText(),
      ],
    );
  }

  Widget _buildAboutText() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Code · Design · Create',
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.w700,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 16),
        const Text(
          "I'm a Flutter developer & creative technologist. "
          "I build futuristic digital experiences — from cross-platform "
          "apps to interactive web portfolios. Every pixel tells a story.",
          style: TextStyle(
            color: Color(0xFF8888CC),
            fontSize: 16,
            height: 1.8,
          ),
        ),
        const SizedBox(height: 16),
        const Text(
          'Currently exploring the intersection of UI engineering, '
          'motion design, and creative coding.',
          style: TextStyle(
            color: Color(0xFF8888CC),
            fontSize: 16,
            height: 1.8,
          ),
        ),
        const SizedBox(height: 20),
        Wrap(
          spacing: 12,
          runSpacing: 12,
          children: [
            _highlight('🎯', '50+ Apps Built'),
            _highlight('🏆', '3 Awards'),
            _highlight('💡', '100% Satisfaction'),
          ],
        ),
        const SizedBox(height: 30),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            gradient: const LinearGradient(
              colors: [AppTheme.primary, AppTheme.secondary],
            ),
          ),
          child: const Text(
            '▶ Play Intro Video',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }

  Widget _badge(String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 6),
      decoration: BoxDecoration(
        color: AppTheme.primary.withOpacity(0.1),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppTheme.primary.withOpacity(0.2)),
      ),
      child: Text(
        text,
        style: const TextStyle(
          color: AppTheme.primary,
          fontSize: 12,
          letterSpacing: 2,
        ),
      ),
    );
  }

  Widget _highlight(String emoji, String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
      decoration: BoxDecoration(
        color: AppTheme.primary.withOpacity(0.06),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppTheme.primary.withOpacity(0.12)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(emoji, style: const TextStyle(fontSize: 16)),
          const SizedBox(width: 6),
          Text(
            text,
            style: const TextStyle(
              color: Color(0xFFAAAADD),
              fontSize: 13,
            ),
          ),
        ],
      ),
    );
  }
}
