import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';
import '../../widgets/gallery_grid.dart';

class GallerySection extends StatelessWidget {
  const GallerySection({super.key});

  static const List<String> _items = [
    '📷', '📷', '🎬', '📷',
    '📷', '📷', '📷', '📷',
  ];

  static const List<String> _captions = [
    'Workspace', 'Coding', 'App Demo', 'Team',
    'Event', 'Setup', 'Design', 'Nature',
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _badge('✦ Moments'),
          const SizedBox(height: 20),
          ShaderMask(
            shaderCallback: (bounds) => const LinearGradient(
              colors: [Colors.white, AppTheme.primary, AppTheme.secondary],
            ).createShader(bounds),
            child: const Text(
              'Gallery',
              style: TextStyle(
                color: Colors.white,
                fontSize: 48,
                fontWeight: FontWeight.w900,
              ),
            ),
          ),
          const SizedBox(height: 40),
          GalleryGrid(items: _items, captions: _captions),
        ],
      ),
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
}