import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:nomotiwa/core/strings/strings.dart';

class OtpState extends ChangeNotifier {
  bool isOtpSent = false;
  bool isLoading = false;
  String? error;

  Future<void> sendOtp(String email) async {
    log('otp send');
    try {
      isLoading = true;
      error = null;
      notifyListeners();

      final response = await http.post(
        Uri.parse('$baseUrl/api/user/authanticate'),

        headers: {'Content-Type': 'application/json'},
        body: json.encode({'email': email}),
      );
      log('Response status: ${response.statusCode}');
      log('Response body: ${response.body}');

      if (response.statusCode == 200) {
        isOtpSent = true;
      } else {
        log(error.toString());
        error = 'Failed to send OTP';
      }
    } catch (e) {
      error = 'Network error occurred';
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  Future<bool> verifyOtp(String email, String otp) async {
    try {
      isLoading = true;
      error = null;
      notifyListeners();

      final response = await http.post(
        Uri.parse('$baseUrl/api/user/verify-otp'),
        headers: {'Content-Type': 'application/json'},
        body: json.encode({'email': email, 'otp': otp}),
      );
       log('Response status: ${response.statusCode}');
      log('Response body: ${response.body}');
      if (response.statusCode == 200) {
        return true;
      } else {
        error = 'Invalid OTP';
        return false;
      }
    } catch (e) {
      error = 'Network error occurred';
      return false;
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  void reset() {
    isOtpSent = false;
    isLoading = false;
    error = null;
    notifyListeners();
  }
}
