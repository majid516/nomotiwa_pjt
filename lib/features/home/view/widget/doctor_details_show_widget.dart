import 'package:flutter/material.dart';
import 'package:nomotiwa/core/constants/app_theme/app_theme.dart';
import 'package:nomotiwa/features/home/model/doctor_model.dart';
import 'package:nomotiwa/features/home/view/widget/hero_animated_widget.dart';

class DoctorDetailsShowWidget extends StatelessWidget {
  const DoctorDetailsShowWidget({super.key, required this.doctor});

  final Doctor doctor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Row(
        children: [
          Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: MyColors.primaryColor.withValues(alpha: 0.1),
                width: 2,
              ),
            ),
            child: HeroAnimatedWidget(doctor: doctor),
          ),
          SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                doctor.name,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Text(doctor.specialization, style: TextStyle(fontSize: 16)),
              Text(
                doctor.availability ? 'Available' : 'Not Available',
                style: TextStyle(
                  color: doctor.availability ? Colors.green : Colors.red,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
