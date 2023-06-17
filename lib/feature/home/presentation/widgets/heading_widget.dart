import 'package:DishDash/config/theme/colors.dart';
import 'package:DishDash/core/presentation/widgets/text/large_text.dart';
import 'package:DishDash/core/presentation/widgets/text/small_text.dart';
import 'package:flutter/material.dart';

class HeadingWidget extends StatelessWidget {
  const HeadingWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.only(top: 50, left: 20),
          child:  LargeText(
            text: "DishDash",
            size: 35,
            fontWeight: FontWeight.bold,
          )
        ),
        Container(
          margin: const EdgeInsets.only(top: 5, left: 20),
          child:  SmallText(
            text: "Find the best recipes for cooking",
            size: 15,
            fontWeight: FontWeight.bold,
            color: isDarkMode ? AppColors.lightColorScheme.onPrimary : AppColors.darkColorScheme.onPrimary,
          ),
        ),
      ],
    );
  }
}
