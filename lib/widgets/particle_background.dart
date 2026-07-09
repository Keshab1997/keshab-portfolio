import 'dart:math';
import 'package:flutter/material.dart';

class ParticleBackground extends StatefulWidget {
  final Widget child;
  const ParticleBackground({super.key, required this.child});

  @override
  State<ParticleBackground> createState() => _ParticleBackgroundState();
}

class _ParticleBackgroundState extends State<ParticleBackground>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  final List<_Particle> _particles = [];
  final Random _random = Random();

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    )..repeat();
    _initParticles();
  }

  void _initParticles() {
    _particles.clear();
    for (int i = 0; i < 60; i++) {
      _particles.add(_Particle(
        x: _random.nextDouble(),
        y: _random.nextDouble(),
        size: _random.nextDouble() * 2 + 0.5,
        speedX: (_random.nextDouble() - 0.5) * 0.3,
        speedY: (_random.nextDouble() - 0.5) * 0.3,
        opacity: _random.nextDouble() * 0.4 + 0.1,
      ));
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return CustomPaint(
          painter: _ParticlePainter(_particles, MediaQuery.of(context).size),
          child: child,
        );
      },
      child: widget.child,
    );
  }
}

class _Particle {
  double x, y;
  final double size, speedX, speedY, opacity;
  _Particle({
    required this.x,
    required this.y,
    required this.size,
    required this.speedX,
    required this.speedY,
    required this.opacity,
  });
}

class _ParticlePainter extends CustomPainter {
  final List<_Particle> particles;
  final Size canvasSize;

  _ParticlePainter(this.particles, this.canvasSize);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color(0xFF6C5CE7).withOpacity(0.08)
      ..strokeWidth = 0.5;

    // Draw grid
    final gridPaint = Paint()
      ..color = const Color(0xFF6C5CE7).withOpacity(0.03)
      ..strokeWidth = 0.5;
    const step = 60.0;
    for (double x = 0; x < size.width; x += step) {
      canvas.drawLine(Offset(x, 0), Offset(x, size.height), gridPaint);
    }
    for (double y = 0; y < size.height; y += step) {
      canvas.drawLine(Offset(0, y), Offset(size.width, y), gridPaint);
    }

    // Update and draw particles
    for (final p in particles) {
      p.x += p.speedX * 0.01;
      p.y += p.speedY * 0.01;
      if (p.x < 0 || p.x > 1) p.speedX *= -1;
      if (p.y < 0 || p.y > 1) p.speedY *= -1;

      final px = p.x * size.width;
      final py = p.y * size.height;

      canvas.drawCircle(
        Offset(px, py),
        p.size,
        Paint()..color = const Color(0xFF6C5CE7).withOpacity(p.opacity),
      );

      // Draw connections
      for (final other in particles) {
        final ox = other.x * size.width;
        final oy = other.y * size.height;
        final dist = sqrt(pow(px - ox, 2) + pow(py - oy, 2));
        if (dist < 120) {
          canvas.drawLine(
            Offset(px, py),
            Offset(ox, oy),
            paint..color = const Color(0xFF6C5CE7).withOpacity(0.06 * (1 - dist / 120)),
          );
        }
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}