import 'package:daily_recipe/consts/packages.dart';
import 'package:flutter/material.dart';

class Collectivelikes extends StatefulWidget {
  const Collectivelikes({super.key});

  @override
  State<Collectivelikes> createState() => _AllrecipesState();
}

class _AllrecipesState extends State<Collectivelikes> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: 10,
        itemBuilder: (BuildContext context, index) {
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
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
                          "Hello",
                          style: GoogleFonts.poppins(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        const SizedBox(height: 4),

                        // Description
                        Text(
                          "This is very sweet and delicious...",
                          style: GoogleFonts.poppins(fontSize: 13),
                        ),

                        const SizedBox(height: 10),

                        // Like/Dislike Row
                        Row(
                          children: [
                            IconButton(
                              icon: Icon(Icons.favorite),
                              color: Colors.red,
                              onPressed: () {},
                            ),
                            const SizedBox(width: 4),
                            Text("899"),

                            const SizedBox(width: 16),

                            IconButton(
                              icon: Icon(Icons.thumb_down_alt_outlined),
                              color: Colors.grey[700],
                              onPressed: () {},
                            ),
                            const SizedBox(width: 4),
                            Text("400"),
                          ],
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
    );
  }
}
