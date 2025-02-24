import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:nomotiwa/core/components/custom_appbar.dart';
import 'package:nomotiwa/core/constants/app_theme/app_theme.dart';
import 'package:nomotiwa/core/constants/spaces/space.dart';
import 'package:nomotiwa/core/screen_size/screen_size.dart';
import 'package:nomotiwa/features/home/model/doctor_model.dart';
import 'package:nomotiwa/features/home/view_model/doctor_provider.dart';
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
              Padding(
                padding: const EdgeInsets.symmetric(horizontal:  8.0),
                child: Row(
                  children: [
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
                    SizedBox(width: 16),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          doctor.name,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          doctor.specialization,
                          style: TextStyle(fontSize: 16),
                        ),
                        Text(
                          doctor.availability ? 'Available' : 'Not Available',
                          style: TextStyle(
                            color:
                                doctor.availability ? Colors.green : Colors.red,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Text(
                'Appointments:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Expanded(
  child: doctor.slots.isNotEmpty
    ? ListView.builder(
        padding: const EdgeInsets.symmetric( vertical: 10),
        itemCount: doctor.slots.length,
        itemBuilder: (context, index) {
          final slot = doctor.slots[index];
          return Container(
            margin: const EdgeInsets.only(bottom: 5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
             
            ),
            child: Card(
              color: MyColors.whiteColor,
             
             // colo r: MyColors.primaryColor.withValues(alpha: 0.1),
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
                side: BorderSide(width: 0.5,color: MyColors.darkGreyColor)
              ),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 6,
                          ),
                          decoration: BoxDecoration(
                            color: MyColors.primaryColor.withOpacity(0.1),
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
                ),
              ),
            ),
          );
        },
      )
    : Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.event_busy,
              size: 64,
              color: Colors.grey[400],
            ),
            const SizedBox(height: 16),
            Text(
              'No appointments available',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey[600],
              ),
            ),
          ],
        ),
      ),
),
            Consumer<TokenProvider>(
  builder: (context, value, child) {
    String displayText = "Consultaion not started"; // Default text
    
    // Extract token if a valid message is received
    RegExp regExp = RegExp(r'currentToken:\s*(\d+)');
    Match? match = regExp.firstMatch(value.tokenMessage);

    if (match != null) {
      int token = int.parse(match.group(1)!);
      displayText = "Current Token: $token"; // Display token with label
    }

    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: MyColors.whiteColor,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 6,
            spreadRadius: 2,
            offset: Offset(2, 4),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(
                Icons.confirmation_number,
                color: MyColors.primaryColor,
                size: 30,
              ),
              Space.wSpace15,
              Text(
                displayText, // Shows "Not Started" or "Current Token: [Token]"
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: MyColors.primaryColor,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  },
),


            
            ],
          ),
        ),
      ),
    );
  }
}
