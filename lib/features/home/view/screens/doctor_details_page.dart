import 'package:flutter/material.dart';
import 'package:nomotiwa/core/components/custom_appbar.dart';
import 'package:nomotiwa/core/constants/app_theme/app_theme.dart';
import 'package:nomotiwa/core/constants/spaces/space.dart';
import 'package:nomotiwa/core/screen_size/screen_size.dart';
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
    int patientsAhead = 2;

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
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    DoctorDetailsShowWidget(doctor: doctor),
                   Space.hSpace20,
                    // Container(
                    //   width: ScreenSize.width * 95,
                    //   height: 100,
                    //   decoration: BoxDecoration(
                    //     color: MyColors.primaryColor.withValues(alpha: 0.2),
                    //     borderRadius: BorderRadius.circular(15),
                    //   ),
                    //   child: Padding(
                    //     padding: const EdgeInsets.all(16.0),
                    //     child: Column(
                    //       mainAxisAlignment: MainAxisAlignment.center,
                    //       children: [
                    //         Row(
                    //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //           children: [
                    //             Row(
                    //               children: [
                    //                 Icon(
                    //                   Icons.people,
                    //                   color: MyColors.primaryColor,
                    //                   size: 28,
                    //                 ),
                    //                 Space.wSpace10,
                    //                 Text(
                    //                   'Patients Ahead: ',
                    //                   style: TextStyle(
                    //                     fontSize: 17,
                    //                     fontWeight: FontWeight.bold,
                    //                     color: MyColors.primaryColor,
                    //                   ),
                    //                 ),
                    //               ],
                    //             ),
                    //             Text(
                    //               patientsAhead.toString(),
                    //               style: TextStyle(
                    //                 fontSize: 17,
                    //                 fontWeight: FontWeight.bold,
                    //                 color: MyColors.primaryColor,
                    //               ),
                    //             ),
                    //           ],
                    //         ),
                    //         Space.hSpace10,
                    //         Row(
                    //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //           children: [
                    //             Row(
                    //               children: [
                    //                 Icon(
                    //                   Icons.timer,
                    //                   color: MyColors.primaryColor,
                    //                   size: 28,
                    //                 ),
                    //                 Space.wSpace10,
                    //                 Text(
                    //                   'Est. Wait Time: ',
                    //                   style: TextStyle(
                    //                     fontSize: 17,
                    //                     fontWeight: FontWeight.bold,
                    //                     color: MyColors.primaryColor,
                    //                   ),
                    //                 ),
                    //               ],
                    //             ),

                    //             Text(
                    //               formatWaitingTime(patientsAhead),

                    //               style: TextStyle(
                    //                 fontSize: 17,
                    //                 fontWeight: FontWeight.bold,
                    //                 color: MyColors.primaryColor,
                    //               ),
                    //             ),
                    //           ],
                    //         ),
                    //       ],
                    //     ),
                    //   ),
                    // ),
                    Text(
                      'Appointments:',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    AllAppointmentListWidget(doctor: doctor),
                    Space.hSpace500,
                  ],
                ),
              ),
              Positioned(
                left: 0,
                right: 0,
                bottom: 15,
                child: CurrentTokenShowWidget(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

