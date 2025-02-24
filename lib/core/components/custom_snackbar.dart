import 'package:flutter/material.dart';
import 'package:nomotiwa/core/constants/app_theme/app_theme.dart';

void showCustomSnackBar(BuildContext context, String message, bool isError ) {
  final snackBar = SnackBar(
    content: Row(
      children: [
        Icon(
          isError ? Icons.error_outline : Icons.check_circle_outline,
          color: Colors.white,
        ),
        SizedBox(width: 12),
        Expanded(
          child: Text(
            message,
            style: TextStyle(fontSize: 16, color: Colors.white),
          ),
        ),
      ],
    ),
    backgroundColor: isError ? Colors.red : MyColors.appGreenColor,
    behavior: SnackBarBehavior.floating,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12),
    ),
    duration: Duration(seconds: 3),
    action: SnackBarAction(
      label: 'Dismiss',
      textColor: Colors.white,
      onPressed: () {
      },
    ),
  );

  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
