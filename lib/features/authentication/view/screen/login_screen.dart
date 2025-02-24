import 'package:flutter/material.dart';
import 'package:nomotiwa/core/constants/app_theme/app_theme.dart';
import 'package:nomotiwa/core/constants/spaces/space.dart';
import 'package:nomotiwa/core/exceptions/form_validator/form_validators.dart';
import 'package:nomotiwa/core/screen_size/screen_size.dart';
import 'package:nomotiwa/features/authentication/view/widgets/bottom_wave_clipper.dart';
import 'package:nomotiwa/features/authentication/view/widgets/send_o_t_pand_login_button.dart';
import 'package:nomotiwa/features/authentication/view/widgets/top_wave_clipper.dart';
import 'package:nomotiwa/features/authentication/view_model/otp_state_provider.dart';
import 'package:nomotiwa/features/home/screens/home_screen.dart';
import 'package:provider/provider.dart';

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
          ClipPath(
            clipper: TopWaveClipper(),
            child: Container(
              height: 280,
              decoration: BoxDecoration(gradient: MyColors.themeGradient),
            ),
          ),
          Positioned(
            bottom: 0,
            child: ClipPath(
              clipper: BottomWaveClipper(),
              child: Container(
                height: 220,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: MyColors.secondaryColor.withOpacity(0.3),
                ),
              ),
            ),
          ),
          Positioned(
            top: 70,
            left: -30,
            child: Icon(
              Icons.local_pharmacy,
              size: 100,
              color: MyColors.whiteColor.withOpacity(0.5),
            ),
          ),
          Positioned(
            top: 140,
            right: 32,
            child: Icon(
              Icons.healing,
              size: 80,
              color: MyColors.whiteColor.withOpacity(0.4),
            ),
          ),
          Positioned(
            bottom: 30,
            left: 50,
            child: Icon(
              Icons.medical_services,
              size: 90,
              color: MyColors.secondaryColor.withOpacity(0.3),
            ),
          ),
          Center(
         //   alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Consumer<OtpState>(
                builder: (context, otpState, child) {
                  return Column(
                    spacing: 20,
                 mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "Nomotiwa",
                        style: TextStyle(
                          fontSize: 35,
                          fontWeight: FontWeight.bold,
                          color: MyColors.secondaryColor,
                        ),
                      ),
                    Space.hSpace10,
                      Form(
                        key: formKey,
                        child: Column(
                          children: [
                            Container(
                              decoration: boxDecoration(),
                              child: TextFormField(
                                controller: emailController,
                                decoration: inputDecoration("Enter your email"),
                                validator: FormValidators.validateEmail,
                                enabled: !otpState.isOtpSent,
                              ),
                            ),
                            if (otpState.isOtpSent) ...[
                            Space.hSpace15,
                              
                              Container(
                                decoration: boxDecoration(),
                                child: TextFormField(
                                  controller: otpController,
                                  decoration: inputDecoration("Enter OTP"),
                                  keyboardType: TextInputType.number,
                                  validator: (value) {
                                    if (value?.isEmpty ?? true) {
                                      return 'Please enter OTP';
                                    }
                                    return null;
                                  },
                                ),
                              ),
                            ],
                            
                          ],
                        ),
                      ),
                            SendOTPandLoginButton(formKey: formKey, emailController: emailController, otpController: otpController, otpState: otpState)
                    ],
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// class LoginScreen extends StatelessWidget {
//   LoginScreen({super.key});

//   final TextEditingController emailController = TextEditingController();
//   final TextEditingController otpController = TextEditingController();
//   final formKey = GlobalKey<FormState>();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: MyColors.whiteColor,
//       body: Stack(
//         children: [
//           ClipPath(
//             clipper: TopWaveClipper(),
//             child: Container(
//               height: 280,
//               decoration: BoxDecoration(gradient: MyColors.themeGradient),
//             ),
//           ),
//           Positioned(
//             bottom: 0,
//             child: ClipPath(
//               clipper: BottomWaveClipper(),
//               child: Container(
//                 height: 220,
//                 width: MediaQuery.of(context).size.width,
//                 decoration: BoxDecoration(
//                   color: MyColors.secondaryColor.withValues(alpha: 0.3),
//                 ),
//               ),
//             ),
//           ),
//           Positioned(
//             top: 70,
//             left: -30,
//             child: Icon(
//               Icons.local_pharmacy,
//               size: 100,
//               color: MyColors.whiteColor.withValues(alpha: 0.5),
//             ),
//           ),
//           Positioned(
//             top: 140,
//             right: 32,
//             child: Icon(
//               Icons.healing,
//               size: 80,
//               color: MyColors.whiteColor.withValues(alpha: 0.4),
//             ),
//           ),
//           Positioned(
//             bottom: 30,
//             left: 50,
//             child: Icon(
//               Icons.medical_services,
//               size: 90,
//               color: MyColors.secondaryColor.withValues(alpha: 0.3),
//             ),
//           ),

//           Align(
//             alignment: Alignment.center,
//             child: Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 30),
//               child:Consumer<OtpState>(
//   builder: (context, otpState, child) {
//     return Column(
//       children: [
//         Text(
//           "Nomotiwa",
//           style: TextStyle(
//             fontSize: 35,
//             fontWeight: FontWeight.bold,
//             color: MyColors.secondaryColor,
//           ),
//         ),
//         SizedBox(height: 40),
//         Form(
//           key: formKey,
//           child: Column(
//             children: [
//               Container(
//                 decoration: boxDecoration(),
//                 child: Consumer<OtpState>(
//                   builder: (context, otpState, child) {
//                     return TextFormField(
//                       controller: emailController,
//                       decoration: inputDecoration("Enter your email"),
//                       validator: FormValidators.validateEmail,
//                       enabled: !otpState.isOtpSent,
//                     );
//                   },
//                 ),
//               ),
//               if (otpState.isOtpSent) ...[
//                 SizedBox(height: 20),
//                 Container(
//                   decoration: boxDecoration(),
//                   child: TextFormField(
//                     controller: otpController,
//                     decoration: inputDecoration("Enter OTP"),
//                     keyboardType: TextInputType.number,
//                     validator: (value) {
//                       if (value?.isEmpty ?? true) {
//                         return 'Please enter OTP';
//                       }
//                       return null;
//                     },
//                   ),
//                 ),
//               ],
//             ],
//           ),
//         ),
//       ],
//     );
//   },
// ),

//             ),
//           ),
//         ],
//       ),
//     );
//   }

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

