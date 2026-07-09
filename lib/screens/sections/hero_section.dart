import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';
import '../../widgets/typewriter_text.dart';

class HeroSection extends StatelessWidget {
  const HeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(minHeight: 600),
      padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 60),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Badge
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
            decoration: BoxDecoration(
              color: AppTheme.primary.withOpacity(0.08),
              borderRadius: BorderRadius.circular(30),
              border: Border.all(color: AppTheme.primary.withOpacity(0.2)),
            ),
            child: const Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('✦', style: TextStyle(color: AppTheme.primary)),
                SizedBox(width: 8),
                Text(
                  'NEXT-GEN DEVELOPER',
                  style: TextStyle(
                    color: AppTheme.primary,
                    fontSize: 12,
                    letterSpacing: 3,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 30),
          // Name
          ShaderMask(
            shaderCallback: (bounds) => const LinearGradient(
              colors: [Colors.white, AppTheme.primary, AppTheme.secondary],
              stops: [0.2, 0.5, 0.8],
            ).createShader(bounds),
            child: const Text(
              'Keshab Sarkar',
              style: TextStyle(
                color: Colors.white,
                fontSize: 72,
                fontWeight: FontWeight.w900,
                height: 1.05,
              ),
            ),
          ),
          const SizedBox(height: 20),
          // Typewriter
          const TypewriterText(
            words: [
              'Flutter Developer',
              'Creative Technologist',
              'UI Engineer',
              'Problem Solver',
            ],
            style: TextStyle(
              color: Color(0xFF8888CC),
              fontSize: 24,
            ),
          ),
          const SizedBox(height: 50),
          // Stats
          const Row(
            children: [
              _Stat(number: '5+', label: 'Years Exp'),
              SizedBox(width: 50),
              _Stat(number: '20+', label: 'Projects'),
              SizedBox(width: 50),
              _Stat(number: '10+', label: 'Clients'),
            ],
          ),
          const SizedBox(height: 50),
          // CTA Buttons
          Row(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 18),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  gradient: const LinearGradient(
                    colors: [AppTheme.primary, AppTheme.secondary],
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: AppTheme.primary.withOpacity(0.3),
                      blurRadius: 30,
                      spreadRadius: 2,
                    ),
                  ],
                ),
                child: const Text(
                  '🚀 Explore My Work',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                  ),
                ),
              ),
              const SizedBox(width: 20),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 18),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  border: Border.all(color: AppTheme.primary.withOpacity(0.3)),
                ),
                child: const Text(
                  '📄 Resume →',
                  style: TextStyle(
                    color: AppTheme.primary,
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _Stat extends StatelessWidget {
  final String number;
  final String label;
  const _Stat({required this.number, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ShaderMask(
          shaderCallback: (bounds) => const LinearGradient(
            colors: [AppTheme.primary, AppTheme.secondary],
          ).createShader(bounds),
          child: Text(
            number,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 36,
              fontWeight: FontWeight.w900,
            ),
          ),
        ),
        Text(
          label,
          style: const TextStyle(
            color: Color(0xFF8888CC),
            fontSize: 13,
            letterSpacing: 1,
          ),
        ),
      ],
    );
  }
}
