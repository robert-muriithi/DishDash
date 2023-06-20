import 'package:DishDash/config/theme/colors.dart';
import 'package:DishDash/core/di/injector_container.dart';
import 'package:DishDash/core/presentation/widgets/text/small_text.dart';
import 'package:DishDash/core/utils/utils.dart';
import 'package:DishDash/feature/home/presentation/cubits/categories/categories_cubit.dart';
import 'package:DishDash/feature/home/presentation/cubits/meals/meals_cubit.dart';
import 'package:DishDash/feature/home/presentation/page/meal_details_page.dart';
import 'package:DishDash/feature/home/presentation/widgets/categories_header_delegate.dart';
import 'package:DishDash/feature/home/presentation/widgets/heading_widget.dart';
import 'package:DishDash/feature/home/presentation/widgets/search_container.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  BuildContext? blocContext;
  late ScrollController _scrollController;
  bool _showTitle = false;
  int? itemCount;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController()
      ..addListener(() {
        setState(() {
          _showTitle = _isSliverAppBarExpanded;
        });
      });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  bool get _isSliverAppBarExpanded {
    return _scrollController.hasClients &&
        _scrollController.offset > (200 - kToolbarHeight);
  }

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return MultiBlocProvider(
        providers: [
          BlocProvider<CategoriesCubit>(
            create: (_) => sl<CategoriesCubit>()..fetchFoodCategories(),
          ),
          BlocProvider<MealsCubit>(create: (context) => sl<MealsCubit>())
        ],
        child: Scaffold(
          body: RefreshIndicator(
            onRefresh: () async {
             // BlocProvider.of<CategoriesCubit>(context).fetchFoodCategories();
              context.read<CategoriesCubit>().fetchFoodCategories();
            },
            child: CustomScrollView(
              controller: _scrollController,
              slivers: [
                SliverAppBar(
                  actions: [
                    Visibility(
                      visible: _showTitle,
                      child: IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.search),
                      ),
                    )
                  ],
                  flexibleSpace: FlexibleSpaceBar(
                    stretchModes: const [
                      StretchMode.zoomBackground,
                      StretchMode.blurBackground,
                      StretchMode.fadeTitle,
                    ],
                    titlePadding: const EdgeInsets.only(left: 20, bottom: 20),
                    title: _showTitle
                        ? Text(
                            "DishDash",
                            style: TextStyle(
                              color: isDarkMode
                                  ? AppColors.lightColorScheme.onPrimary
                                  : AppColors.darkColorScheme.onPrimary,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                            textScaleFactor: 1,
                          )
                        : null,
                    background: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        HeadingWidget(),
                        SearchContainer(),
                      ],
                    ),
                  ),
                  floating: true,
                  snap: true,
                  pinned: true,
                  expandedHeight: 200,
                  collapsedHeight: 60,
                  backgroundColor: isDarkMode
                      ? AppColors.darkColorScheme.onInverseSurface
                      : AppColors.lightColorScheme.onInverseSurface,
                ),
                SliverPersistentHeader(
                  delegate: ItemCategoriesHeaderDelegate(),
                ),
                SliverGrid(
                    delegate: SliverChildBuilderDelegate(
                      (context, index) {
                        return BlocBuilder<MealsCubit, MealsState>(
                          builder: (context, state) {
                            blocContext = context;
                            if (state.uiState == UIState.initial) {
                              Future.delayed(const Duration(microseconds: 2000));
                              dispatchGetMealsEvent(context, 'Beef');
                            }
                            if (state.uiState == UIState.loading) {
                              return Container(
                                  margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Theme.of(context).cardColor,
                                    boxShadow: [
                                      BoxShadow(
                                        color: isDarkMode ? AppColors.darkColorScheme.primary.withOpacity(0.2) : AppColors.lightColorScheme.primary.withOpacity(0.2),
                                        spreadRadius: 1,
                                        blurRadius: 1,
                                        offset: const Offset(0, 1),
                                      ),
                                    ],
                                  ),
                                child: const Center(
                                  child: CircularProgressIndicator(),
                                ),
                              );
                            } else if (state.uiState == UIState.success) {
                              itemCount = state.meals.length;
                              return Container(
                                  margin: const EdgeInsets.symmetric(horizontal: 8),
                                  child: _buildGridItem(context, state, index));
                            } else if (state.uiState == UIState.error) {
                              return const Center(
                                child: Text("Error"),
                              );
                            } else {
                              return const SizedBox.shrink();
                            }
                          },
                        );
                      },
                      childCount: itemCount,
                    ),
                    gridDelegate:  const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 0,
                      crossAxisSpacing: 0,
                    )
                )
              ],
            ),
          ),
        ));
  }

  void dispatchGetMealsEvent(BuildContext context, String category) {
    BlocProvider.of<MealsCubit>(context).fetchMealsByCategory(category);
  }

  Widget _buildGridItem(BuildContext context, MealsState state, int index) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return GestureDetector(
      onTap: () {
        /*Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => BlocProvider.value(
              value: BlocProvider.of<MealsCubit>(blocContext),
              child: MealDetailsScreen(
                meal: state.meals[index],
              ),
            ),
          ),
        );*/
        Navigator.push(context, MaterialPageRoute(builder: (context) => MealDetailsPage(id: state.meals[index].idMeal,)));
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 3, vertical: 5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Theme.of(context).cardColor,
          boxShadow: [
            BoxShadow(
              color: isDarkMode ? AppColors.darkColorScheme.primary.withOpacity(0.4) : AppColors.lightColorScheme.primary.withOpacity(0.4),
              spreadRadius: 1,
              blurRadius: 1,
              offset:
              const Offset(0, 1), // changes position of shadow
            ),
          ],
        ),
        child: Stack(
          children: [
            Column(
              children: [
                Expanded(
                  flex: 3,
                  child: ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10),
                    ),
                    child: CachedNetworkImage(
                      imageUrl: state.meals[index].strMealThumb,
                      fit: BoxFit.cover,
                      width: double.infinity,
                      height: double.infinity,
                      placeholder: (context, url) => const Center(
                        child: CircularProgressIndicator(),
                      ),
                      errorWidget: (context, url, error) => const Center(
                        child: Icon(Icons.error),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            state.meals[index].strMeal,
                            style: const TextStyle(
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ),
                        const SizedBox(width: 5,),
                        GestureDetector(
                          onTap: () {

                          },
                          child: Icon(
                            Icons.favorite_border,
                            color: AppColors.lightColorScheme.primary,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
