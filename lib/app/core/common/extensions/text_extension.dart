import 'package:flutter/material.dart';

extension Gradient on Widget {
  Widget gradient(LinearGradient gradient) {
    return GradientText(this, gradient: gradient);
  }
}

extension GradientSpan on TextSpan {}

class GradientText extends StatelessWidget {
  const GradientText(
    this.child, {
    super.key,
    required this.gradient,
  });

  final Widget child;
  final LinearGradient gradient;

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      blendMode: BlendMode.srcIn,
      shaderCallback: (bounds) => gradient.createShader(
        Rect.fromLTWH(0, 0, bounds.width, bounds.height),
      ),
      child: child,
    );
  }
}
