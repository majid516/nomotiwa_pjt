import 'package:flutter/material.dart';
import 'package:nomotiwa/core/constants/app_theme/app_theme.dart';
import 'package:nomotiwa/features/authentication/view/widgets/top_wave_clipper.dart';

class TopWavyDesign extends StatelessWidget {
  const TopWavyDesign({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: TopWaveClipper(),
      child: Container(
        height: 280,
        decoration: BoxDecoration(gradient: MyColors.themeGradient),
      ),
    );
  }
}
