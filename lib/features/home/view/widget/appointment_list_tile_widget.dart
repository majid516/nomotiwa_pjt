import 'package:flutter/material.dart';
import 'package:nomotiwa/core/constants/app_theme/app_theme.dart';
import 'package:nomotiwa/features/home/model/doctor_model.dart';
import 'package:nomotiwa/features/home/view/widget/appointment_card_elements.dart';

class AppointmentListTileWidget extends StatelessWidget {
  const AppointmentListTileWidget({
    super.key,
    required this.slot,
  });

  final Slot slot;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Card(
        color: MyColors.whiteColor,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
          side: BorderSide(
            width: 0.5,
            color: MyColors.darkGreyColor,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: AppointmentCardElements(slot: slot),
        ),
      ),
    );
  }
}
