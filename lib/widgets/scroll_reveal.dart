import 'package:flutter/material.dart';

class ScrollReveal extends StatefulWidget {
  final Widget child;
  final Duration duration;
  final double offset;
  final ScrollRevealDirection direction;

  const ScrollReveal({
    super.key,
    required this.child,
    this.duration = const Duration(milliseconds: 800),
    this.offset = 50,
    this.direction = ScrollRevealDirection.up,
  });

  @override
  State<ScrollReveal> createState() => _ScrollRevealState();
}

enum ScrollRevealDirection { up, left, right, scale }

class _ScrollRevealState extends State<ScrollReveal>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _animation;
  bool _hasRevealed = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: widget.duration,
    );
    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOutCubic,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _onScroll(ScrollNotification notification) {
    if (_hasRevealed) return;
    final renderBox = context.findRenderObject() as RenderBox?;
    if (renderBox == null || !renderBox.attached) return;
    final position = renderBox.localToGlobal(Offset.zero);
    final screenHeight = MediaQuery.of(context).size.height;
    if (position.dy < screenHeight * 0.85) {
      _hasRevealed = true;
      _controller.forward();
    }
  }

  @override
  Widget build(BuildContext context) {
    return NotificationListener<ScrollNotification>(
      onNotification: (notification) {
        _onScroll(notification);
        return false;
      },
      child: AnimatedBuilder(
        animation: _animation,
        builder: (context, child) {
          double opacity = _animation.value;
          double dx = 0, dy = 0;
          double scale = 1;

          switch (widget.direction) {
            case ScrollRevealDirection.up:
              dy = widget.offset * (1 - _animation.value);
            case ScrollRevealDirection.left:
              dx = -widget.offset * (1 - _animation.value);
            case ScrollRevealDirection.right:
              dx = widget.offset * (1 - _animation.value);
            case ScrollRevealDirection.scale:
              scale = 0.85 + 0.15 * _animation.value;
          }

          return Opacity(
            opacity: opacity,
            child: Transform.translate(
              offset: Offset(dx, dy),
              child: Transform.scale(
                scale: scale,
                child: child,
              ),
            ),
          );
        },
        child: widget.child,
      ),
    );
  }
}