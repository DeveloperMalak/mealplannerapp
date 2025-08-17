import 'package:daily_recipe/ApiServices/recipes.dart';
import 'package:daily_recipe/consts/packages.dart';
import 'package:flutter/foundation.dart';

class Recipecontrollers extends GetxController {
  @override
  void onInit() {
    super.onInit();
    getAllRecipes();
  }

  RxList recipesList = [].obs;
  RxBool loading = false.obs;
  Future<void> getAllRecipes() async {
    try {
      loading.value = true;
      var result = await Recipes.getAllRecipes();
      recipesList.value = result.data!;
    } catch (e) {
      loading.value = false;
      if (kDebugMode) {
        print("error fetching users $e");
      }
    } finally {
      loading.value = false;
    }
  }

  Future<void> addRecipe(String name, desc) async {
    try {
      var result = Recipes.addrecipes(name, desc).then((value) {
        getAllRecipes();
      });
    } catch (e) {
      if (kDebugMode) {
        print("error adding users $e");
      }
    }
  }
}
