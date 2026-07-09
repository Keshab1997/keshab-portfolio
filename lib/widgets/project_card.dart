import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';
import '../../models/project_model.dart';

class ProjectCard extends StatelessWidget {
  final Project project;
  const ProjectCard({super.key, required this.project});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.02),
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: Colors.white.withOpacity(0.06)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Media placeholder
          Container(
            height: 200,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
              gradient: LinearGradient(
                colors: [
                  AppTheme.primary.withOpacity(0.12),
                  AppTheme.secondary.withOpacity(0.08),
                ],
              ),
            ),
            child: const Center(
              child: Text('🎥', style: TextStyle(fontSize: 48)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  project.title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  project.description,
                  style: const TextStyle(
                    color: Color(0xFF8888CC),
                    fontSize: 14,
                    height: 1.6,
                  ),
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 16),
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: project.tags.map((tag) {
                    return Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12, vertical: 5,
                      ),
                      decoration: BoxDecoration(
                        color: AppTheme.primary.withOpacity(0.08),
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: AppTheme.primary.withOpacity(0.15),
                        ),
                      ),
                      child: Text(
                        tag,
                        style: const TextStyle(
                          color: AppTheme.primary,
                          fontSize: 11,
                        ),
                      ),
                    );
                  }).toList(),
                ),
                if (project.liveUrl != null) ...[
                  const SizedBox(height: 16),
                  const Row(
                    children: [
                      Text(
                        '🔗 Live →',
                        style: TextStyle(
                          color: Color(0xFF6666AA),
                          fontSize: 13,
                        ),
                      ),
                      SizedBox(width: 20),
                      Text(
                        '🐙 Source',
                        style: TextStyle(
                          color: Color(0xFF6666AA),
                          fontSize: 13,
                        ),
                      ),
                    ],
                  ),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }
}