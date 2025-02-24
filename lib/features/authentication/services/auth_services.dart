
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:nomotiwa/features/authentication/view/screen/login_screen.dart';

class AuthServices {
  final Box authBox = Hive.box('authBox');
   void login(String userEmail) {
    authBox.put('userEmail', userEmail); 
    
  }
 void logout(BuildContext context) {
    authBox.delete('userEmail'); 
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => LoginScreen()),
    );
  }
}
