import 'package:DishDash/config/theme/colors.dart';
import 'package:DishDash/feature/auth/presentation/pages/auth_options_page.dart';
import 'package:DishDash/feature/onboarding/presentation/widgets/circle_shape.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration:  BoxDecoration(
          image: const DecorationImage(
              image: AssetImage('assets/images/wallpaper.jpg'),
              fit: BoxFit.cover,
              opacity: 0.4
          ),
          gradient: LinearGradient(
            end: Alignment.topCenter,
            begin: Alignment.bottomCenter,
            colors: [
              Colors.black.withOpacity(1),
              Colors.black.withOpacity(0.9),
              Colors.black.withOpacity(0.9),
              Colors.black.withOpacity(0.9),
              Colors.black.withOpacity(1),
            ],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            SizedBox(
              height: 140,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 50),
                child: Column(
                  children: const [
                    Expanded(
                      child: Text(
                        'Cooking Experience like a Chef',
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                        maxLines: 2,
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Expanded(
                      child: Text(
                        'Lets make a delicious meal with the best recipe for the family',
                        style: TextStyle(
                          fontSize: 14,
                          fontStyle: FontStyle.italic,
                          color: Colors.white,
                        ),
                        maxLines: 2,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const AuthOptionsPage(),
                  ),
                );
              },
              child: Container(
                height: 70,
                margin: const EdgeInsets.only(
                    top: 20, left: 50, right: 50, bottom: 40),
                decoration: BoxDecoration(
                  color: AppColors.lightColorScheme.inversePrimary.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(60),

                  /*gradient: LinearGradient(
                    colors: [
                      AppColors.lightColorScheme.inversePrimary.withOpacity(0.2),
                      AppColors.lightColorScheme.inversePrimary.withOpacity(0.2),
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.topCenter,
                  ),*/
                ),
                child: Row(
                  children: const [
                    SizedBox(
                      width: 5,
                    ),
                    CircleIcon(),
                    SizedBox(
                      width: 25,
                    ),
                    Expanded(
                      flex: 1,
                      child: Text(
                        'Get Started',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
