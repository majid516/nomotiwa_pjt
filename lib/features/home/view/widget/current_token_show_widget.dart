import 'package:flutter/material.dart';
import 'package:nomotiwa/core/constants/app_theme/app_theme.dart';
import 'package:nomotiwa/core/constants/spaces/space.dart';
import 'package:nomotiwa/features/home/view_model/token_provider.dart';
import 'package:provider/provider.dart';


class CurrentTokenShowWidget extends StatelessWidget {
  const CurrentTokenShowWidget({super.key});
static int currentDoctorToken = 0;

  @override
  Widget build(BuildContext context) {
    return Consumer<TokenProvider>(
      builder: (context, value, child) {
        String displayText = "Consultaion not started";
        RegExp regExp = RegExp(r'currentToken:\s*(\d+)');
        Match? match = regExp.firstMatch(value.tokenMessage);
       
        if (match != null) {
          int token = int.parse(match.group(1)!);
          displayText = "Current Token : ";
          currentDoctorToken = token;
         
        }

        return Container(
          margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: MyColors.whiteColor,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 6,
                spreadRadius: 2,
                offset: Offset(2, 4),
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(
                    Icons.confirmation_number,
                    color: MyColors.primaryColor,
                    size: 30,
                  ),
                  Space.wSpace15,
                  Text(
                    displayText,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: MyColors.primaryColor,
                    ),
                  ),
                ],
              ),
                  Text(
                 currentDoctorToken.toString(),
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: MyColors.primaryColor,
                    ),
                  ),
            ],
          ),
        );
      },
    );
  }
}
