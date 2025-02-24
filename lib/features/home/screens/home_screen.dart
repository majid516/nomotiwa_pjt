// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:nomotiwa/features/authentication/services/auth_services.dart';
import 'package:provider/provider.dart';

import 'package:nomotiwa/core/components/custom_appbar.dart';
import 'package:nomotiwa/core/constants/app_theme/app_theme.dart';
import 'package:nomotiwa/core/constants/spaces/space.dart';
import 'package:nomotiwa/core/constants/text_styles/common_styles.dart';
import 'package:nomotiwa/core/screen_size/screen_size.dart';
import 'package:nomotiwa/features/home/model/doctor_model.dart';
import 'package:nomotiwa/features/home/screens/doctor_details_page.dart';
import 'package:nomotiwa/features/home/view_model/doctor_provider.dart';

class HomeScreen extends StatelessWidget {
  final String email;

  const HomeScreen({
    super.key,
    required this.email,
  });

  @override
  Widget build(BuildContext context) {
    final doctorProvider = Provider.of<DoctorProvider>(context, listen: false);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      doctorProvider.fetchAllDoctors(email);
    });

    return Scaffold(
      appBar: CustomAppBar(
        title: 'Home Screen',
        backButtonNeeded: false,
        action: () {},
        widget: IconButton(onPressed: (){
          AuthServices().logout(context);
        }, icon: Icon(Icons.logout,color: MyColors.whiteColor,)),
      ),
      backgroundColor: MyColors.whiteColor,
      body: Consumer<DoctorProvider>(
        builder: (context, provider, child) {
          if (provider.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (provider.doctorsList.isEmpty) {
            return const Center(child: Text('No doctors available.'));
          }

          return ListView.separated(
            separatorBuilder:
                (context, index) => Divider(
                  thickness: 10,
                  color: MyColors.lightColor.withValues(alpha: 0.2),
                ),
            itemCount: provider.doctorsList.length,
            itemBuilder: (context, index) {
              final doctor = provider.doctorsList[index];

              return DoctorCard(doctor: doctor);
            },
          );
        },
      ),
    );
  }
}

class DoctorCard extends StatelessWidget {
  final Doctor doctor;

  const DoctorCard({super.key, required this.doctor});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 2,
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                // Doctor Image
                Container(
                    width: 80,
                    height: 80,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: MyColors.primaryColor.withOpacity(0.1),
                        width: 2,
                      ),
                    ),
                    child:
                     Hero(
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
                  ),
                ),
                const SizedBox(width: 16),

                // Doctor Info
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Dr. ${doctor.name}',
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        "specialization : ${doctor.specialization}",
                        style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 4,
                            ),
                            decoration: BoxDecoration(
                              color:
                                  doctor.availability
                                      ? Colors.green.withOpacity(0.1)
                                      : Colors.red.withOpacity(0.1),
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
                                            ? Colors.green
                                            : Colors.red,
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
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          const Divider(height: 1),

          // Action Buttons
          Padding(
            padding: const EdgeInsets.all(12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
               
                  
                  InkWell(
                 onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (ctx) => DoctorDetailsPage(doctor: doctor),
                      ),
                    );
                  },
                  child: Container(
                    width: ScreenSize.width*0.8,
                    height: 35,
                    decoration: BoxDecoration(
                      color: MyColors.whiteColor,
                      border: Border.all(color: MyColors.primaryColor),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Center(
                      child: Text(
                        'View Profile',
                        style: CommonStyles.commonButtonBlackTextStyle,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
