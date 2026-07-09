import 'dart:async';
import 'package:flutter/material.dart';

class TypewriterText extends StatefulWidget {
  final List<String> words;
  final TextStyle style;

  const TypewriterText({
    super.key,
    required this.words,
    required this.style,
  });

  @override
  State<TypewriterText> createState() => _TypewriterTextState();
}

class _TypewriterTextState extends State<TypewriterText> {
  int _wordIndex = 0;
  int _charIndex = 0;
  bool _isDeleting = false;
  late Timer _timer;
  String _displayText = '';

  @override
  void initState() {
    super.initState();
    _startTyping();
  }

  void _startTyping() {
    _timer = Timer.periodic(const Duration(milliseconds: 100), (timer) {
      setState(() {
        final current = widget.words[_wordIndex];
        if (!_isDeleting) {
          if (_charIndex < current.length) {
            _charIndex++;
            _displayText = current.substring(0, _charIndex);
          } else {
            _isDeleting = true;
            timer.cancel();
            Future.delayed(const Duration(seconds: 2), _startTyping);
            return;
          }
        } else {
          if (_charIndex > 0) {
            _charIndex--;
            _displayText = current.substring(0, _charIndex);
          } else {
            _isDeleting = false;
            _wordIndex = (_wordIndex + 1) % widget.words.length;
            timer.cancel();
            Future.delayed(const Duration(milliseconds: 500), _startTyping);
            return;
          }
        }
      });
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(_displayText, style: widget.style),
        Container(
          width: 3,
          height: 22,
          color: const Color(0xFF6C5CE7),
          margin: const EdgeInsets.only(left: 4),
        ),
      ],
    );
  }
}