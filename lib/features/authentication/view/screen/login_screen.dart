import 'package:flutter/material.dart';
import 'package:nomotiwa/core/constants/app_theme/app_theme.dart';
import 'package:nomotiwa/features/authentication/view/widgets/bottom_wavy_design.dart';
import 'package:nomotiwa/features/authentication/view/widgets/login_componets_widget.dart';
import 'package:nomotiwa/features/authentication/view/widgets/top_wavy_design.dart';


final GlobalKey<FormState> formkey = GlobalKey<FormState>();

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController otpController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.whiteColor,
      body: Stack(
        children: [
          TopWavyDesign(),
          BottomWavyDesign(),
          Positioned(
            top: 70,
            left: -30,
            child: Icon(
              Icons.local_pharmacy,
              size: 100,
              color: MyColors.whiteColor.withValues(alpha: 0.5),
            ),
          ),
          Positioned(
            top: 140,
            right: 32,
            child: Icon(
              Icons.healing,
              size: 80,
              color: MyColors.whiteColor.withValues(alpha: 0.4),
            ),
          ),
          Positioned(
            bottom: 30,
            left: 50,
            child: Icon(
              Icons.medical_services,
              size: 90,
              color: MyColors.secondaryColor.withValues(alpha: 0.3),
            ),
          ),
          LoginComponetsWidget(formKey: formKey, emailController: emailController, otpController: otpController),
        ],
      ),
    );
  }
}

InputDecoration inputDecoration(String hintText) {
  return InputDecoration(
    hintText: hintText,
    hintStyle: TextStyle(color: MyColors.secondaryColor),
    border: InputBorder.none,
    contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
  );
}

BoxDecoration boxDecoration() {
  return BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(20),
    boxShadow: [
      BoxShadow(color: Colors.black26, blurRadius: 8, offset: Offset(2, 2)),
    ],
  );
}
