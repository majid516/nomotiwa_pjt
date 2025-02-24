import 'package:flutter/material.dart';
import 'package:nomotiwa/core/constants/app_theme/app_theme.dart';
import 'package:nomotiwa/features/home/model/doctor_model.dart';

class HeroAnimatedWidget extends StatelessWidget {
  const HeroAnimatedWidget({
    super.key,
    required this.doctor,
  });

  final Doctor doctor;

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: 'doctor-${doctor.name}',
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Image.network(
          'https://img.freepik.com/premium-vector/avatar-bearded-doctor-doctor-with-stethoscope-vector-illustrationxa_276184-31.jpg',
          fit: BoxFit.cover,
          loadingBuilder: (context, child, loadingProgress) {
            if (loadingProgress == null) return child;
            return Center(
              child: CircularProgressIndicator(
                color: MyColors.primaryColor,
                value:
                    loadingProgress.expectedTotalBytes != null
                        ? loadingProgress.cumulativeBytesLoaded /
                            loadingProgress.expectedTotalBytes!
                        : null,
              ),
            );
          },
          errorBuilder:
              (context, error, stackTrace) => Container(
                color: Colors.grey[200],
                child: Icon(
                  Icons.person,
                  size: 40,
                  color: Colors.grey[400],
                ),
              ),
        ),
      ),
    );
  }
}
