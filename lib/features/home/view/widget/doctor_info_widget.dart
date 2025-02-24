import 'package:flutter/material.dart';
import 'package:nomotiwa/features/home/model/doctor_model.dart';
import 'package:nomotiwa/features/home/view/widget/doctor_availability_show_widget.dart';

class DoctorInfoWidget extends StatelessWidget {
  const DoctorInfoWidget({
    super.key,
    required this.doctor,
  });

  final Doctor doctor;

  @override
  Widget build(BuildContext context) {
    return Expanded(
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
              DoctorAvailabilityShowWidget(doctor: doctor),
            ],
          ),
        ],
      ),
    );
  }
}
