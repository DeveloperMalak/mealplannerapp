import 'package:daily_recipe/consts/packages.dart';
import 'package:daily_recipe/views/Recipes/recipescategories.dart/allrecipes.dart';
import 'package:daily_recipe/views/Recipes/recipescategories.dart/collectivelikes.dart';
import 'package:daily_recipe/views/Recipes/recipescategories.dart/dislikes.dart';
import 'package:daily_recipe/views/Recipes/recipescategories.dart/favourties.dart';
import 'package:flutter/material.dart';

class FavourteRecipe extends StatefulWidget {
  const FavourteRecipe({super.key});

  @override
  State<FavourteRecipe> createState() => _FavourteRecipeState();
}

class _FavourteRecipeState extends State<FavourteRecipe> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        body:
            Column(
              children: [
                40.heightBox,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    "Recipes".text.capitalize
                        .textStyle(
                          GoogleFonts.poppins(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Colors.pink,
                          ),
                        )
                        .make(),

                    IconButton(onPressed: () {}, icon: Icon(Icons.search)),
                  ],
                ).centered(),
                5.heightBox,
                TabBar(
                  tabs: [
                    Tab(text: "All"),
                    Tab(text: "Favourites"),
                    Tab(text: "disikes"),
                    Tab(text: "Collectivelikes"),
                  ],
                  labelColor: Colors.pink,
                  unselectedLabelColor: Colors.grey,
                  indicatorColor: Colors.pink,
                ),

                Expanded(
                  child: TabBarView(
                    children: [
                      Allrecipes(),
                      Favourties(),
                      Dislikes(),
                      Collectivelikes(),
                    ],
                  ),
                ),
              ],
            ).centered(),
      ),
    );
  }
}
