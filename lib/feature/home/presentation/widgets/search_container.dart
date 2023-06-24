import 'package:DishDash/config/theme/colors.dart';
import 'package:DishDash/core/presentation/widgets/text/small_text.dart';
import 'package:DishDash/feature/search/presentation/pages/search_page.dart';
import 'package:flutter/material.dart';

class SearchContainer extends StatelessWidget {
  const SearchContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return Container(
      margin: const EdgeInsets.only(top: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: (){
              showSearch(context: context, delegate: SearchPage());
            },
            child: Container(
              margin: const EdgeInsets.only(left: 20),
              width: MediaQuery.of(context).size.width * 0.85,
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: isDarkMode ? AppColors.darkColorScheme.onSurface : AppColors.lightColorScheme.onSurface,
              ),
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Container(
                      margin: const EdgeInsets.only(left: 10),
                      child:  Icon(
                        Icons.search,
                        color: isDarkMode ? AppColors.darkColorScheme.onPrimary : AppColors.lightColorScheme.onPrimary,
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 5,
                    child: Container(
                      margin: const EdgeInsets.only(left: 10),
                      child: SmallText(
                        text:  "Search",
                        color: isDarkMode ? AppColors.darkColorScheme.onPrimary : AppColors.lightColorScheme.onPrimary,
                        size: 15,
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(right: 10),
                    child:  Icon(
                      Icons.filter_alt,
                      color: isDarkMode ? AppColors.darkColorScheme.onPrimary : AppColors.lightColorScheme.onPrimary,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
