import 'package:flutter/material.dart';
import 'package:nomotiwa/core/constants/app_theme/app_theme.dart';
import 'package:nomotiwa/features/home/model/doctor_model.dart';

class DoctorAvailabilityShowWidget extends StatelessWidget {
  const DoctorAvailabilityShowWidget({
    super.key,
    required this.doctor,
  });

  final Doctor doctor;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 8,
        vertical: 4,
      ),
      decoration: BoxDecoration(
        color:
            doctor.availability
                ? MyColors.appGreenColor.withValues(alpha:0.1)
                :  MyColors.errorRed.withValues(alpha:0.1),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 8,
            height: 8,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color:
                  doctor.availability
                      ? MyColors.appGreenColor
                      : MyColors.errorRed,
            ),
          ),
          const SizedBox(width: 4),
          Text(
            doctor.availability
                ? 'Available'
                : 'Not Available',
            style: TextStyle(
              fontSize: 12,
              color:
                  doctor.availability
                      ? Colors.green
                      : Colors.red,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
