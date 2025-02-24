import 'package:flutter/material.dart';
import 'package:nomotiwa/core/constants/app_theme/app_theme.dart';
import 'package:nomotiwa/core/constants/text_styles/common_styles.dart';
import 'package:nomotiwa/core/screen_size/screen_size.dart';
import 'package:nomotiwa/features/home/model/doctor_model.dart';
import 'package:nomotiwa/features/home/view/screens/doctor_details_page.dart';

class DoctorViewProfileButton extends StatelessWidget {
  const DoctorViewProfileButton({
    super.key,
    required this.doctor,
  });

  final Doctor doctor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
         
            
            InkWell(
           onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (ctx) => DoctorDetailsPage(doctor: doctor),
                ),
              );
            },
            child: Container(
              width: ScreenSize.width*0.8,
              height: 35,
              decoration: BoxDecoration(
                color: MyColors.whiteColor,
                border: Border.all(color: MyColors.primaryColor),
                borderRadius: BorderRadius.circular(5),
              ),
              child: Center(
                child: Text(
                  'View Profile',
                  style: CommonStyles.commonButtonBlackTextStyle,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
