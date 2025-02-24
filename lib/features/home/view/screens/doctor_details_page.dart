import 'package:flutter/material.dart';
import 'package:nomotiwa/core/components/custom_appbar.dart';
import 'package:nomotiwa/core/constants/app_theme/app_theme.dart';
import 'package:nomotiwa/features/home/model/doctor_model.dart';
import 'package:nomotiwa/features/home/view/widget/all_appointment_list_widget.dart';
import 'package:nomotiwa/features/home/view/widget/current_token_show_widget.dart';
import 'package:nomotiwa/features/home/view/widget/doctor_details_show_widget.dart';
import 'package:nomotiwa/features/home/view_model/token_provider.dart';

import 'package:provider/provider.dart';

class DoctorDetailsPage extends StatelessWidget {
  final Doctor doctor;
  const DoctorDetailsPage({super.key, required this.doctor});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => TokenProvider(doctor.id),
      child: Scaffold(
        appBar: CustomAppBar(
          title: 'My Appointments',
          backButtonNeeded: true,
          action: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: MyColors.whiteColor,
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              DoctorDetailsShowWidget(doctor: doctor),
              SizedBox(height: 20),
              Text(
                'Appointments:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              AllAppointmentListWidget(doctor: doctor),
              CurrentTokenShowWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
