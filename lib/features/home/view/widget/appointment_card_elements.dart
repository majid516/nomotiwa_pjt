import 'package:flutter/material.dart';
import 'package:nomotiwa/core/constants/app_theme/app_theme.dart';
import 'package:nomotiwa/features/home/model/doctor_model.dart';

class AppointmentCardElements extends StatelessWidget {
  const AppointmentCardElements({
    super.key,
    required this.slot,
  });

  final Slot slot;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment:
          CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 12,
                vertical: 6,
              ),
              decoration: BoxDecoration(
                color: MyColors.primaryColor
                    .withValues(alpha:  0.1),
                borderRadius:
                    BorderRadius.circular(20),
              ),
              child: Text(
                'Token #${slot.tokenNumber}',
                style: TextStyle(
                  color: MyColors.primaryColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const Spacer(),
            Text(
              slot.date
                  .toLocal()
                  .toString()
                  .split(' ')[0],
              style: TextStyle(
                color: Colors.grey[600],
                fontSize: 14,
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        Text(
          slot.patientInfo.name,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            Icon(
              Icons.email_outlined,
              size: 16,
              color: Colors.grey[600],
            ),
            const SizedBox(width: 8),
            Expanded(
              child: Text(
                slot.patientInfo.email,
                style: TextStyle(
                  color: Colors.grey[600],
                  fontSize: 14,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 4),
        Row(
          children: [
            Icon(
              Icons.phone_outlined,
              size: 16,
              color: Colors.grey[600],
            ),
            const SizedBox(width: 8),
            Text(
              slot.patientInfo.phone,
              style: TextStyle(
                color: Colors.grey[600],
                fontSize: 14,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
