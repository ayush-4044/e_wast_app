import 'package:flutter/material.dart';

class BouncingElevatedWrapper extends StatefulWidget {
  final Widget child;

  const BouncingElevatedWrapper({super.key, required this.child});

  @override
  State<BouncingElevatedWrapper> createState() =>
      _BouncingElevatedWrapperState();
}

class _BouncingElevatedWrapperState extends State<BouncingElevatedWrapper> {
  double _scale = 1.0;

  @override
  Widget build(BuildContext context) {
    return Listener(
      onPointerDown: (_) => setState(() => _scale = 0.95),

      onPointerUp: (_) => setState(() => _scale = 1.0),

      onPointerCancel: (_) => setState(() => _scale = 1.0),

      child: AnimatedScale(
        scale: _scale,
        duration: const Duration(milliseconds: 100),
        curve: Curves.easeInOut,
        child: widget.child,
      ),
    );
  }
}
