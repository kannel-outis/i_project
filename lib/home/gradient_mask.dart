import 'package:flutter/material.dart';
import 'package:i_project/utils.dart';

class GradientMask extends StatelessWidget {
  final Gradient? gradient;
  final Widget? child;
  const GradientMask({Key? key, this.child, this.gradient}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (bounds) =>
          (gradient ?? Utils.borderGradient).createShader(bounds),
      child: child,
    );
  }
}
