import 'package:flutter/material.dart';
import 'package:nomotiwa/features/authentication/services/auth_services.dart';
import 'package:nomotiwa/features/home/view/widget/doctor_card.dart';
import 'package:provider/provider.dart';
import 'package:nomotiwa/core/components/custom_appbar.dart';
import 'package:nomotiwa/core/constants/app_theme/app_theme.dart';
import 'package:nomotiwa/features/home/view_model/doctor_provider.dart';

class HomeScreen extends StatelessWidget {
  final String email;

  const HomeScreen({super.key, required this.email});

  @override
  Widget build(BuildContext context) {
    final doctorProvider = Provider.of<DoctorProvider>(context, listen: false);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      doctorProvider.fetchAllDoctors(email);
    });

    return Scaffold(
      appBar: CustomAppBar(
        title: 'Home Screen',
        backButtonNeeded: false,
        action: () {},
        widget: IconButton(
          onPressed: () {
            AuthServices().logout(context);
          },
          icon: Icon(Icons.logout, color: MyColors.whiteColor),
        ),
      ),
      backgroundColor: MyColors.whiteColor,
      body: Consumer<DoctorProvider>(
        builder: (context, provider, child) {
          if (provider.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (provider.doctorsList.isEmpty) {
            return const Center(child: Text('No doctors available.'));
          }

          return ListView.separated(
            separatorBuilder:
                (context, index) => Divider(
                  thickness: 10,
                  color: MyColors.lightColor.withValues(alpha: 0.2),
                ),
            itemCount: provider.doctorsList.length,
            itemBuilder: (context, index) {
              final doctor = provider.doctorsList[index];

              return DoctorCard(doctor: doctor);
            },
          );
        },
      ),
    );
  }
}
