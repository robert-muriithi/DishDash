import 'package:DishDash/config/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Settings"),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        physics: const AlwaysScrollableScrollPhysics(),
        child: Column(
          children: [
            Container(
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(children: [
                  Column(
                    children: const [
                      CircleAvatar(
                        backgroundColor: Colors.transparent,
                        radius: 30,
                        child: Image(
                          image: AssetImage(
                            'assets/images/wallpaper.jpg',
                          ),
                          width: 50,
                          height: 50,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(width: 10),
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'John Doe',
                          style: TextStyle(fontSize: 16),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          '+254677834389',
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.black.withOpacity(0.5),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Spacer(),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(FontAwesomeIcons.penToSquare,
                        color: AppColors.lightColorScheme.primary, size: 18),
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
                    'Account',
                    style: TextStyle(fontSize: 16, color: Colors.black),
                  ),
                ]),
              ),
            ),
            Container(
              decoration: const BoxDecoration(
                color: Colors.white,
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
                        leading: Icon(FontAwesomeIcons.wallet,
                            color: AppColors.lightColorScheme.primary,
                            size: 18),
                        title: const Text(
                          'Wallet',
                          style: TextStyle(fontSize: 16, color: Colors.black),
                        ),
                        subtitle: Text(
                          'My earnings',
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.black.withOpacity(0.5),
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
                            const VisualDensity(horizontal: 0, vertical: -4),
                        leading: Icon(FontAwesomeIcons.clockRotateLeft,
                            color: AppColors.lightColorScheme.primary,
                            size: 18),
                        title: const Text(
                          'History',
                          style: TextStyle(fontSize: 16, color: Colors.black),
                        ),
                        subtitle: Text(
                          'View history',
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.black.withOpacity(0.5),
                          ),
                        ),
                        onTap: () {},
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
                    style: TextStyle(fontSize: 16, color: Colors.black),
                  ),
                ]),
              ),
            ),
            Container(
              decoration: const BoxDecoration(
                color: Colors.white,
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
                            color: AppColors.lightColorScheme.primary,
                            size: 18),
                        title: const Text(
                          'Feedback',
                          style: TextStyle(fontSize: 16, color: Colors.black),
                        ),
                        subtitle: Text(
                          'Tal to us today',
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.black.withOpacity(0.5),
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
                            color: AppColors.lightColorScheme.primary,
                            size: 18),
                        title: const Text(
                          'About Us',
                          style: TextStyle(fontSize: 16, color: Colors.black),
                        ),
                        subtitle: Text(
                          'Learn and know more about us',
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.black.withOpacity(0.5),
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
                            color: AppColors.lightColorScheme.primary,
                            size: 18),
                        title: const Text(
                          'Logout',
                          style: TextStyle(fontSize: 16, color: Colors.red),
                        ),
                        subtitle: Text(
                          'Logout from your account',
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.black.withOpacity(0.5),
                          ),
                        ),
                        onTap: () {},
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: Column(
                            children: [
                              Text(
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.black.withOpacity(0.5),
                                  ),
                                  'Version 1.0.0'),
                              Text(
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.black.withOpacity(0.5),
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
          ],
        ),
      ),
    );
  }
}
