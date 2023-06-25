import 'package:DishDash/config/theme/colors.dart';
import 'package:DishDash/core/di/injector_container.dart';
import 'package:DishDash/feature/onboarding/presentation/pages/onboarding_screen_container.dart';
import 'package:DishDash/feature/saved/presentation/page/saved_page.dart';
import 'package:DishDash/feature/settings/presentation/bloc/theme_cubit.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  /*void toggleTheme(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final theme = isDarkMode ? AppColors.lightColorScheme : AppColors.darkColorScheme;
   // final themeMode = isDarkMode ? ThemeMode.light : ThemeMode.dark;
    final scaffoldMessenger = ScaffoldMessenger.of(context);
    final text = isDarkMode ? 'Light Mode' : 'Dark Mode';
    //final icon = isDarkMode ? FontAwesomeIcons.solidSun : FontAwesomeIcons.solidMoon;
    final snackBar = SnackBar(
      content: Text(text),
      duration: const Duration(milliseconds: 500),
    );
    scaffoldMessenger.showSnackBar(snackBar);
  }*/

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final auth = sl<FirebaseAuth>();
    return BlocProvider(
      create: (context) => sl<ThemeCubit>(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Settings"),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  color:
                      isDarkMode ? Colors.grey.shade900 : Colors.grey.shade300,
                  borderRadius: const BorderRadius.all(
                    Radius.circular(20),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(children: [
                    Column(
                      children: [
                        CircleAvatar(
                          radius: 30,
                          backgroundImage:
                              NetworkImage(auth.currentUser!.photoURL ?? ''),
                        ),
                      ],
                    ),
                    const SizedBox(width: 10),
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            auth.currentUser!.displayName ?? '',
                            style: const TextStyle(fontSize: 16),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            auth.currentUser!.email ?? '',
                            style: const TextStyle(
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ]),
                ),
              ),
              SizedBox(
                height: 40,
                child: Padding(
                  padding: const EdgeInsets.only(left: 10, right: 20),
                  child: Row(children: const [
                    Text(
                      'Manage',
                      style: TextStyle(fontSize: 16),
                    ),
                  ]),
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  color:
                      isDarkMode ? Colors.grey.shade900 : Colors.grey.shade300,
                  borderRadius: const BorderRadius.all(
                    Radius.circular(20),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 0),
                  child: Column(
                    children: [
                      Material(
                        type: MaterialType.transparency,
                        child: ListTile(
                          visualDensity:
                              const VisualDensity(horizontal: 0, vertical: -4),
                          leading: Icon(FontAwesomeIcons.solidSun,
                              color: isDarkMode
                                  ? AppColors.darkColorScheme.primary
                                  : AppColors.lightColorScheme.primary,
                              size: 18),
                          title: const Text(
                            'Theme',
                            style: TextStyle(fontSize: 16),
                          ),
                          subtitle: const Text(
                            'Change theme',
                            style: TextStyle(
                              fontSize: 12,
                            ),
                          ),
                          onTap: () {
                            const lightThemeMode = ThemeMode.light;
                            const darkThemeMode = ThemeMode.dark;
                            showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  title: const Text("Select Theme"),
                                  content: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      ListTile(
                                        title: const Text("Light"),
                                        onTap: () {
                                          Navigator.pop(context);
                                          final isDarkMode =
                                              Theme.of(context).brightness ==
                                                  Brightness.dark;
                                          ThemeCubit()
                                              .changeTheme(lightThemeMode);
                                        },
                                      ),
                                      ListTile(
                                        title: const Text("Dark"),
                                        onTap: () {
                                          Navigator.pop(context);
                                          ThemeCubit()
                                              .changeTheme(darkThemeMode);
                                        },
                                      ),
                                    ],
                                  ),
                                );
                              },
                            );
                          },
                        ),
                      ),
                      const Divider(
                        indent: 20,
                        endIndent: 20,
                      ),
                      Material(
                        type: MaterialType.transparency,
                        child: ListTile(
                          visualDensity:
                              const VisualDensity(horizontal: 0, vertical: -4),
                          leading: Icon(FontAwesomeIcons.bookmark,
                              color: isDarkMode
                                  ? AppColors.darkColorScheme.primary
                                  : AppColors.lightColorScheme.primary,
                              size: 18),
                          title: const Text(
                            'Saved',
                            style: TextStyle(fontSize: 16),
                          ),
                          subtitle: const Text(
                            'View your saved items',
                            style: TextStyle(
                              fontSize: 12,
                            ),
                          ),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const SavedPage(),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 40,
                child: Padding(
                  padding: const EdgeInsets.only(left: 10, right: 20),
                  child: Row(children: const [
                    Text(
                      'Support',
                      style: TextStyle(fontSize: 16),
                    ),
                  ]),
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  color:
                      isDarkMode ? Colors.grey.shade900 : Colors.grey.shade300,
                  borderRadius: const BorderRadius.all(
                    Radius.circular(20),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Column(
                    children: [
                      Material(
                        type: MaterialType.transparency,
                        child: ListTile(
                          visualDensity:
                              const VisualDensity(horizontal: 0, vertical: -3),
                          leading: Icon(FontAwesomeIcons.weixin,
                              color: isDarkMode
                                  ? AppColors.darkColorScheme.primary
                                  : AppColors.lightColorScheme.primary,
                              size: 18),
                          title: const Text(
                            'Feedback',
                            style: TextStyle(fontSize: 16),
                          ),
                          subtitle: const Text(
                            'Talk to us today',
                            style: TextStyle(
                              fontSize: 12,
                            ),
                          ),
                          onTap: () {},
                        ),
                      ),
                      const Divider(
                        indent: 20,
                        endIndent: 20,
                      ),
                      Material(
                        type: MaterialType.transparency,
                        child: ListTile(
                          visualDensity:
                              const VisualDensity(horizontal: 0, vertical: -3),
                          leading: Icon(FontAwesomeIcons.circleInfo,
                              color: isDarkMode
                                  ? AppColors.darkColorScheme.primary
                                  : AppColors.lightColorScheme.primary,
                              size: 18),
                          title: const Text(
                            'About Us',
                            style: TextStyle(fontSize: 16),
                          ),
                          subtitle: const Text(
                            'Learn and know more about us',
                            style: TextStyle(
                              fontSize: 12,
                            ),
                          ),
                          onTap: () {},
                        ),
                      ),
                      const Divider(
                        indent: 20,
                        endIndent: 20,
                      ),
                      Material(
                        type: MaterialType.transparency,
                        child: ListTile(
                          leading: Icon(FontAwesomeIcons.arrowRightFromBracket,
                              color: isDarkMode
                                  ? AppColors.darkColorScheme.primary
                                  : AppColors.lightColorScheme.primary,
                              size: 18),
                          title: const Text(
                            'Logout',
                            style: TextStyle(fontSize: 16, color: Colors.red),
                          ),
                          subtitle: const Text(
                            'Logout from your account',
                            style: TextStyle(
                              fontSize: 12,
                            ),
                          ),
                          onTap: () {
                            auth.signOut();
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const OnBoardingScreen()));
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Column(
                      children: const [
                        Text(
                            style: TextStyle(
                              fontSize: 12,
                            ),
                            'Version 1.0.0'),
                        Text(
                            style: TextStyle(
                              fontSize: 12,
                            ),
                            'DishDash © 2023'),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _toggleTheme(BuildContext context, ThemeMode themeMode) {
    BlocProvider.of<ThemeCubit>(context).changeTheme(themeMode);
  }
}
