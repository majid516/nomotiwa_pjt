import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:nomotiwa/core/screen_size/screen_size.dart';
import 'package:nomotiwa/features/authentication/view/screen/login_screen.dart';
import 'package:nomotiwa/features/authentication/view_model/otp_state_provider.dart';
import 'package:nomotiwa/features/home/view/screens/home_screen.dart';
import 'package:nomotiwa/features/home/view_model/doctor_provider.dart';
import 'package:provider/provider.dart';

void main() async {
   WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Hive.openBox('authBox'); 
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    ScreenSize.initializeScreenSize(context);
    final authBox = Hive.box('authBox');
    String? userEmail = authBox.get('userEmail'); 
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => DoctorProvider()),
        ChangeNotifierProvider(create: (context) => OtpState()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
         home: userEmail != null ? HomeScreen(email:  userEmail) : LoginScreen(),
      ),
    );
  }
}
