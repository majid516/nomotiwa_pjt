import 'package:flutter/material.dart';
import 'package:nomotiwa/core/constants/app_theme/app_theme.dart';
import 'package:nomotiwa/core/constants/spaces/space.dart';
import 'package:nomotiwa/features/home/model/doctor_model.dart';
import 'package:nomotiwa/features/home/view/widget/doctor_info_widget.dart';
import 'package:nomotiwa/features/home/view/widget/doctor_view_profile_button.dart';
import 'package:nomotiwa/features/home/view/widget/hero_animated_sec_widget.dart';

class DoctorBasicDetailsWidget extends StatelessWidget {
  const DoctorBasicDetailsWidget({super.key, required this.doctor});

  final Doctor doctor;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(16),
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
                child: HeroAnimatedSecWidget(doctor: doctor),
              ),
              Space.wSpace15,
              DoctorInfoWidget(doctor: doctor),
            ],
          ),
        ),

        const Divider(height: 1),
        DoctorViewProfileButton(doctor: doctor),
      ],
    );
  }
}
