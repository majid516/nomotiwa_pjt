import 'package:flutter/material.dart';
import 'package:nomotiwa/core/constants/app_theme/app_theme.dart';
import 'package:nomotiwa/core/constants/spaces/space.dart';
import 'package:nomotiwa/features/home/model/doctor_model.dart';
import 'package:nomotiwa/features/home/view/widget/current_token_show_widget.dart';

class AppointmentCardElements extends StatelessWidget {
  const AppointmentCardElements({super.key, required this.slot});

  final Slot slot;

  @override
  Widget build(BuildContext context) {
    int remainingPatients =  findPatientAhead(slot.tokenNumber,CurrentTokenShowWidget.currentDoctorToken);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: MyColors.primaryColor.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(20),
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
              slot.date.toLocal().toString().split(' ')[0],
              style: TextStyle(color: Colors.grey[600], fontSize: 14),
            ),
          ],
        ),
        Text(
          slot.patientInfo.name,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        Row(
          children: [
            Icon(Icons.phone_outlined, size: 18, color: Colors.grey[600]),
            Text(
              slot.patientInfo.phone,
              style: TextStyle(color: Colors.grey[600], fontSize: 14),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(Icons.people, color: MyColors.primaryColor, size: 25),
                Space.wSpace10,
                Text(
                  'Patients Ahead: ',
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w600,
                    color: MyColors.primaryColor,
                  ),
                ),
              ],
            ),
            Text(
            remainingPatients ==0 ? 'not started' : remainingPatients.toString(),
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w500,
                color: MyColors.primaryColor,
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(Icons.timer, color: MyColors.primaryColor, size: 25),
                Space.wSpace10,
                Text(
                  'Est. Wait Time: ',
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w600,
                    color: MyColors.primaryColor,
                  ),
                ),
              ],
            ),

            Text(
            remainingPatients == 0? '~' :  formatWaitingTime(remainingPatients),

              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w500,
                color: MyColors.primaryColor,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

int findPatientAhead(int myToken, int currentToken) {
  if(currentToken == 0){
    return 0;
  }else if (myToken < currentToken) {
    return currentToken - myToken;
  } else {
    return -1;
  }
}

String formatWaitingTime(int remainingPatients) {
  int totalMinutes = remainingPatients * 10;
  if (totalMinutes <= 59) {
    return '$totalMinutes min';
  } else {
    int hours = totalMinutes ~/ 60;
    int minutes = totalMinutes % 60;
    return '$hours hr $minutes min';
  }
}
