import 'package:flutter/material.dart';
import 'package:avatar_glow/avatar_glow.dart';

class GlowingAvatar extends StatefulWidget {
  const GlowingAvatar({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _GlowingAvatarState createState() => _GlowingAvatarState();
}

class _GlowingAvatarState extends State<GlowingAvatar>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Color?> _colorTween;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(duration: const Duration(seconds: 2), vsync: this)
          ..repeat(reverse: true);
    _colorTween =
        ColorTween(begin: Colors.grey, end: Colors.white).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _colorTween,
      builder: (context, child) {
        return AvatarGlow(
          duration: const Duration(seconds: 2),
          glowColor: _colorTween.value!,
          repeat: true,
          startDelay: const Duration(seconds: 1),
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(style: BorderStyle.none),
              shape: BoxShape.circle,
            ),
            child: const CircleAvatar(
              radius: 80,
              backgroundImage: AssetImage('assests/tic tac toe (1).jpg'),
            ),
          ),
        );
      },
    );
  }
}
