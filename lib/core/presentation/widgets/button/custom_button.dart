import 'package:DishDash/config/theme/colors.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({Key? key, required this.text}) : super(key: key);
  final double size = 20;
  final String text;
  final width = 100.0;

  @override
  Widget build(BuildContext context) {
    //final width = MediaQuery.of(context).size.width;
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: isDarkMode ? AppColors.darkColorScheme.primary : AppColors.lightColorScheme.primary,
      ),
      width: width,
      child: TextButton(
        onPressed: () {},
        child: Text(
            text,
          style: TextStyle(
            color: isDarkMode ? AppColors.darkColorScheme.onPrimary : AppColors.lightColorScheme.onPrimary,
          ),
        ),
      ),
    );
  }
}
