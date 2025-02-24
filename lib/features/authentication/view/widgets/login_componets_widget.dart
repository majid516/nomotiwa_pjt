import 'package:flutter/material.dart';
import 'package:nomotiwa/core/constants/app_theme/app_theme.dart';
import 'package:nomotiwa/core/constants/spaces/space.dart';
import 'package:nomotiwa/core/exceptions/form_validator/form_validators.dart';
import 'package:nomotiwa/features/authentication/view/screen/login_screen.dart';
import 'package:nomotiwa/features/authentication/view/widgets/send_o_t_pand_login_button.dart';
import 'package:nomotiwa/features/authentication/view_model/otp_state_provider.dart';
import 'package:provider/provider.dart';

class LoginComponetsWidget extends StatelessWidget {
  const LoginComponetsWidget({
    super.key,
    required this.formKey,
    required this.emailController,
    required this.otpController,
  });

  final GlobalKey<FormState> formKey;
  final TextEditingController emailController;
  final TextEditingController otpController;

  @override
  Widget build(BuildContext context) {
    return Center(
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
                SendOTPandLoginButton(
                  formKey: formKey,
                  emailController: emailController,
                  otpController: otpController,
                  otpState: otpState,
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
