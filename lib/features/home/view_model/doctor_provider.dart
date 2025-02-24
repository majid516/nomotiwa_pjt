import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:nomotiwa/features/home/model/doctor_model.dart';
import 'package:nomotiwa/features/home/services/doctor_services.dart';

class DoctorProvider extends ChangeNotifier {
  bool _isLoading = false;
  List<Doctor> _doctorsList = [];

  bool get isLoading => _isLoading;
  List<Doctor> get doctorsList => _doctorsList;

  Future<void> fetchAllDoctors(String email) async {
    _isLoading = true;
    notifyListeners();

    try {
      _doctorsList = await DoctorServices().getDoctorByEmail(email);
    } catch (e) {
      log('Error fetching doctors: $e');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
