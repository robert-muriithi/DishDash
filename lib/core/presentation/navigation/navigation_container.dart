import 'package:DishDash/feature/settings/presentation/page/settings_page.dart';
import 'package:flutter/material.dart';
import '../../../config/theme/colors.dart';
import '../../../feature/home/presentation/page/home_page.dart';
import '../../../feature/saved/presentation/page/saved_page.dart';

class BottomNavigationContainer extends StatefulWidget {
  const BottomNavigationContainer({Key? key}) : super(key: key);

  @override
  State<BottomNavigationContainer> createState() =>
      _BottomNavigationContainerState();
}

class _BottomNavigationContainerState extends State<BottomNavigationContainer> {
  int currentIndex = 0;

  final List<Widget> _screens = <Widget>[
    const HomePage(),
    const SavedPage(),
    const SettingsPage()
  ];

  void _updateIndex(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      body: _screens[currentIndex],
      bottomNavigationBar: NavigationBar(
        surfaceTintColor: isDarkMode ? AppColors.darkColorScheme.onSurface : AppColors.lightColorScheme.onSurface,
        selectedIndex: currentIndex,
        animationDuration: const Duration(milliseconds: 200),
        labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
        onDestinationSelected: _updateIndex,
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home_outlined),
            label: 'Home',
            selectedIcon: Icon(Icons.home_filled),
          ),
          NavigationDestination(
            icon: Icon(Icons.bookmark_border),
            label: 'Saved',
            selectedIcon: Icon(Icons.bookmark),
          ),
          NavigationDestination(
            icon: Icon(Icons.settings_outlined),
            label: 'Settings',
            selectedIcon: Icon(Icons.settings),
          ),
        ],
      ),
    );
  }
}
