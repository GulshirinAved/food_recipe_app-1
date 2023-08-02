import 'package:food_recipe_app/app/modules/fav_page/views/fav_page_view.dart';
import 'package:food_recipe_app/app/modules/my_own_recipe/views/my_own_recipe_view.dart';
import 'package:food_recipe_app/app/modules/profile_page/views/profile_page_view.dart';

import '../modules/home_page/views/home_page.dart';

List<String> categoryTitle = [
  'Breakfast',
  'Lunch',
  'Meals with beef',
  'Meals with chicken',
  'Meals with fish',
  'Salad',
  'Vegetarian Meals',
  'Fast cooked meals',
  'Dough meals',
  'Soup',
  'Pasta',
  'Desserts',
  'Drinks',
];
List pages = [
  const HomePage(),
  const FavPageView(),
  const MyOwnRecipeView(),
  ProfilePageView(),
];
List userCategoryTitle = ['Liquids', 'Vegetables', 'Main ingredient', 'Fruit', 'Spices', 'Meats'];
