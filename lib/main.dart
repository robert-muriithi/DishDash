import 'package:DishDash/config/theme/colors.dart';
import 'package:DishDash/core/di/injector_container.dart';
import 'package:DishDash/feature/onboarding/presentation/pages/onboarding_screen_container.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'core/di/injector_container.dart' as di;
import 'core/presentation/navigation/navigation_container.dart';
import 'firebase_options.dart';



void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await di.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
   MyApp({super.key});
  final sharedPrefs = sl<SharedPreferences>();
  final firebaseAuth = sl<FirebaseAuth>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true, colorScheme: AppColors.lightColorScheme),
      darkTheme: ThemeData(useMaterial3: true, colorScheme: AppColors.darkColorScheme),
      themeMode: ThemeMode.system,
      //home: sharedPrefs.getBool('hasCompletedOnBoarding') ?? false ? const BottomNavigationContainer() : const OnBoardingScreen(),
      home: firebaseAuth.currentUser != null ? const BottomNavigationContainer() : const OnBoardingScreen(),
    );
  }
}


