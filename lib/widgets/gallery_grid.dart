import 'package:flutter/material.dart';

class GalleryGrid extends StatelessWidget {
  final List<String> items;
  final List<String> captions;

  const GalleryGrid({
    super.key,
    required this.items,
    required this.captions,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final crossAxisCount = constraints.maxWidth > 900 ? 4
            : constraints.maxWidth > 600 ? 3 : 2;
        return GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: crossAxisCount,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: 1,
          ),
          itemCount: items.length,
          itemBuilder: (context, index) {
            return Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                gradient: LinearGradient(
                  colors: [
                    const Color(0xFF6C5CE7).withOpacity(0.08),
                    const Color(0xFF00CEC9).withOpacity(0.06),
                  ],
                ),
                border: Border.all(
                  color: Colors.white.withOpacity(0.04),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(items[index], style: const TextStyle(fontSize: 36)),
                  if (captions.length > index) ...[
                    const SizedBox(height: 8),
                    Text(
                      captions[index],
                      style: const TextStyle(
                        color: Color(0xFFAAAADD),
                        fontSize: 11,
                        letterSpacing: 1,
                      ),
                    ),
                  ],
                ],
              ),
            );
          },
        );
      },
    );
  }
}