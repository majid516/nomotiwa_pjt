import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:nomotiwa/features/home/model/doctor_model.dart';


 class DoctorServices {
  Future<List<Doctor>> getDoctorByEmail(String email) async {
      final url = 'https://nomotiwa-backend.onrender.com/api/user/getUser/$email';

 //   final url = 'http://localhost:8080/api/user/getUser/$email';
    try {
      final response = await Dio().get(url);
      if (response.statusCode == 200) {
        final data = response.data;
        if (data['success'] == true && data['appointments'] != null) {
          final appointments = data['appointments'] as List<dynamic>;
          final doctors = appointments.map((appointment) {
            try {
              return Doctor.fromAppointmentJson(appointment as Map<String, dynamic>);
            } catch (e) {
              log("Error parsing doctor from appointment: $appointment, Error: $e");
              return null;
            }
          }).whereType<Doctor>().toList();
          log(doctors.toString());
          return doctors;
        } else {
          // No appointments found; return an empty list
          return [];
        }
      } else {
        log('Error while fetching doctor details');
        throw Exception('Failed to load doctor details');
      }
    } catch (e, s) {
      log("Exception: $e\nStackTrace: $s");
      throw Exception('Exception while fetching doctor details: $e');
    }
  }
}
