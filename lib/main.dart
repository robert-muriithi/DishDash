import 'package:DishDash/config/theme/colors.dart';
import 'package:flutter/material.dart';
import 'core/presentation/navigation/navigation_container.dart';
import 'core/di/injector_container.dart' as di;
import 'firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';



void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true, colorScheme: AppColors.lightColorScheme),
      darkTheme: ThemeData(useMaterial3: true, colorScheme: AppColors.darkColorScheme),
      themeMode: ThemeMode.system,
      home: const BottomNavigationContainer(),
      //home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}


