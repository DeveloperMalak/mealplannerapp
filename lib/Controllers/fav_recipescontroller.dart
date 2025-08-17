import 'package:daily_recipe/ApiServices/fav_recipes.dart';
import 'package:daily_recipe/consts/packages.dart';

class FavRecipescontroller extends GetxController {
  void onInit() {
    super.onInit();
  }

  var favMap = <String, bool>{}.obs;
  RxBool favtoggle = false.obs;
  Future<void> addFav(recipeid) async {
    if (favMap.containsKey(recipeid)) {
      favMap[recipeid] = !favMap[recipeid]!;
    } else {
      favMap[recipeid] = true;
    }
    favtoggle.value = true;
    await FavRecipes.addfav(recipeid);
  }

  bool isFav(String recipeId) {
    return favMap[recipeId] ?? false;
  }
}
