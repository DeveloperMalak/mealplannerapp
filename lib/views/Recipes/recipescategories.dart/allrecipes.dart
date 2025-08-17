import 'package:daily_recipe/ApiServices/recipes.dart';
import 'package:daily_recipe/Controllers/fav_recipescontroller.dart';
import 'package:daily_recipe/Controllers/recipecontrollers.dart';
import 'package:daily_recipe/consts/packages.dart';
import 'package:daily_recipe/views/Recipes/recipeshome.dart';
import 'package:flutter/material.dart';

class Allrecipes extends StatefulWidget {
  const Allrecipes({super.key});

  @override
  State<Allrecipes> createState() => _AllrecipesState();
}

class _AllrecipesState extends State<Allrecipes> {
  var recipescontroller = Get.put(Recipecontrollers());

  var favrecipecontroller = Get.put(FavRecipescontroller());
  @override
  Widget build(BuildContext context) {
    var recipes = recipescontroller.recipesList;
    return Expanded(
      child: Obx(
        () =>
            recipescontroller.loading.value
                ? "loading".text
                    .textStyle(GoogleFonts.poppins(fontSize: 20))
                    .make()
                    .centered()
                : recipescontroller.recipesList.isEmpty
                ? "loading".text
                    .textStyle(GoogleFonts.poppins(fontSize: 20))
                    .make()
                    .centered()
                : ListView.builder(
                  itemCount: recipescontroller.recipesList.length,
                  itemBuilder: (BuildContext context, index) {
                    return Card(
                      margin: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 8,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      elevation: 3,
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Image
                            ClipRRect(
                              borderRadius: BorderRadius.circular(12),
                              child: Image.network(
                                "https://upload.wikimedia.org/wikipedia/commons/thumb/8/82/Bangladeshi_Biryani.jpg/250px-Bangladeshi_Biryani.jpg",
                                height: 90,
                                width: 90,
                                fit: BoxFit.cover,
                              ),
                            ),

                            const SizedBox(width: 12),

                            // Title + Description + Votes
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  // Title
                                  Text(
                                    "${recipescontroller.recipesList[index].name}",
                                    style: GoogleFonts.poppins(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),

                                  const SizedBox(height: 4),

                                  // Description
                                  Text(
                                    "noor",
                                    style: GoogleFonts.poppins(fontSize: 13),
                                  ),

                                  const SizedBox(height: 10),

                                  // Like/Dislike Row
                                  Obx(
                                    () => Row(
                                      children: [
                                        IconButton(
                                          icon: Icon(Icons.favorite_outline),
                                          color:
                                              favrecipecontroller.isFav(
                                                    recipescontroller
                                                        .recipesList[index]
                                                        .sId,
                                                  )
                                                  ? Colors.red
                                                  : Colors.white,
                                          onPressed: () {
                                            var recipesid =
                                                recipescontroller
                                                    .recipesList[index]
                                                    .sId;
                                            favrecipecontroller.addFav(
                                              recipesid,
                                            );
                                          },
                                        ),
                                        const SizedBox(width: 4),
                                        Text("899"),

                                        const SizedBox(width: 16),

                                        IconButton(
                                          icon: Icon(
                                            Icons.thumb_down_alt_outlined,
                                          ),
                                          color: Colors.grey[700],
                                          onPressed: () {},
                                        ),
                                        const SizedBox(width: 4),
                                        Text("400"),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
      ),
    );
  }
}
