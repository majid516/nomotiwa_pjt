import 'package:flutter/material.dart';
import 'package:nomotiwa/core/components/custom_snackbar.dart';
import 'package:nomotiwa/core/constants/app_theme/app_theme.dart';
import 'package:nomotiwa/core/screen_size/screen_size.dart';
import 'package:nomotiwa/features/authentication/services/auth_services.dart';
import 'package:nomotiwa/features/authentication/view_model/otp_state_provider.dart';
import 'package:nomotiwa/features/home/view/screens/home_screen.dart';
import 'package:provider/provider.dart';

class SendOTPandLoginButton extends StatelessWidget {
  const SendOTPandLoginButton({
    super.key,
    required this.formKey,
    required this.emailController,
    required this.otpController,
    required this.otpState,
  });
  final OtpState otpState;
  final GlobalKey<FormState> formKey;
  final TextEditingController emailController;
  final TextEditingController otpController;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap:
          otpState.isLoading
              ? null
              : () async {
                if (formKey.currentState!.validate()) {
                  if (!otpState.isOtpSent) {
                    await context.read<OtpState>().sendOtp(
                      emailController.text,
                    );
                  } else {
                    final success = await context.read<OtpState>().verifyOtp(
                      emailController.text,
                      otpController.text,
                    );
                    if (success) {
                      AuthServices().login(emailController.text.trim());
                      if (context.mounted) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder:
                                (ctx) => HomeScreen(
                                  email: emailController.text.trim(),
                                ),
                          ),
                        );
                      }
                    } else {
                      if (context.mounted) {
                        showCustomSnackBar(context, 'enter valid OTP', true);
                      }
                    }
                  }
                }
              },
      child: Container(
        width: ScreenSize.width * 0.9,
        height: 45,
        decoration: BoxDecoration(
          gradient: MyColors.themeGradient,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Center(
          child: Text(
            otpState.isOtpSent ? 'Login' : 'Send OTP',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w700,
              color: MyColors.whiteColor,
            ),
          ),
        ),
      ),
    );
  }
}
