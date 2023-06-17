import 'package:DishDash/config/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return  Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children:  [
        SpinKitThreeInOut(
          color: isDarkMode ? AppColors.darkColorScheme.surfaceTint : AppColors.lightColorScheme.surfaceTint,
          duration: const Duration(milliseconds: 400),
        ),
      ],
    );
  }
}