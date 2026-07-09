import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';

class NavbarSection extends StatelessWidget {
  final void Function(int index) onNavTap;
  const NavbarSection({super.key, required this.onNavTap});

  static const List<String> _navItems = [
    'Home', 'About', 'Skills', 'Work', 'Gallery', 'Contact'
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 20),
      decoration: BoxDecoration(
        color: AppTheme.bg.withOpacity(0.6),
        border: Border(
          bottom: BorderSide(
            color: AppTheme.primary.withOpacity(0.08),
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ShaderMask(
            shaderCallback: (bounds) => const LinearGradient(
              colors: [AppTheme.primary, AppTheme.secondary, AppTheme.accent],
            ).createShader(bounds),
            child: const Text(
              '✦ KESHAB',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.w900,
                letterSpacing: 2,
              ),
            ),
          ),
          Row(
            children: _navItems.asMap().entries.map((entry) {
              return GestureDetector(
                onTap: () => onNavTap(entry.key),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18),
                  child: Text(
                    entry.value,
                    style: const TextStyle(
                      color: Color(0xFF6666AA),
                      fontSize: 13,
                      letterSpacing: 1.5,
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
