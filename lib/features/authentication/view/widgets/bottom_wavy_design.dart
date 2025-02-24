import 'package:flutter/material.dart';
import 'package:nomotiwa/core/constants/app_theme/app_theme.dart';
import 'package:nomotiwa/features/authentication/view/widgets/bottom_wave_clipper.dart';

class BottomWavyDesign extends StatelessWidget {
  const BottomWavyDesign({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      child: ClipPath(
        clipper: BottomWaveClipper(),
        child: Container(
          height: 220,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            color: MyColors.secondaryColor.withValues(alpha: 0.3),
          ),
        ),
      ),
    );
  }
}
