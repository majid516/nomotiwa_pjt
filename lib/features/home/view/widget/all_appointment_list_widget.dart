import 'package:flutter/material.dart';
import 'package:nomotiwa/features/home/model/doctor_model.dart';
import 'package:nomotiwa/features/home/view/widget/appointment_list_tile_widget.dart';

class AllAppointmentListWidget extends StatelessWidget {
  const AllAppointmentListWidget({super.key, required this.doctor});

  final Doctor doctor;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child:
          doctor.slots.isNotEmpty
              ? ListView.builder(
                padding: const EdgeInsets.symmetric(vertical: 10),
                itemCount: doctor.slots.length,
                itemBuilder: (context, index) {
                  final slot = doctor.slots[index];
                  return AppointmentListTileWidget(slot: slot);
                },
              )
              : Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.event_busy, size: 64, color: Colors.grey[400]),
                    const SizedBox(height: 16),
                    Text(
                      'No appointments available',
                      style: TextStyle(fontSize: 16, color: Colors.grey[600]),
                    ),
                  ],
                ),
              ),
    );
  }
}
