import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LunchRecipes extends StatelessWidget {
  const LunchRecipes({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: Colors.black,
      navigationBar: CupertinoNavigationBar(
        backgroundColor: Colors.transparent,
        border: Border.all(color: Colors.transparent),
        leading: CupertinoButton(
          padding: EdgeInsets.zero,
          onPressed: () {
            Navigator.pop(context); // Navigate back to HomePage
          },
          child: Icon(
            CupertinoIcons.back,
            color: CupertinoColors.white,
          ),
        ),
        middle: const Text(
          'Lunch Recipes',
          style: TextStyle(color: CupertinoColors.white),
        ),
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              const SizedBox(height: 20),
              // Add a list of lunch recipes here
              Expanded(
                child: ListView.builder(
                  itemCount: lunchRecipes.length,
                  itemBuilder: (context, index) {
                    final recipe = lunchRecipes[index];
                    return _buildRecipeTile(
                      context,
                      recipe['title']!,
                      recipe['imagePath']!,
                      recipe['ingredients']!,
                      recipe['procedure']!,
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Helper function to create recipe tiles
  Widget _buildRecipeTile(BuildContext context, String title, String imagePath, List<String> ingredients, String procedure) {
    return GestureDetector(
      onTap: () {
        // Show the recipe's ingredients and procedure when tapped
        showCupertinoDialog(
          context: context,
          builder: (context) => CupertinoAlertDialog(
            title: Text('Recipe: $title'),
            content: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Ingredients section with a custom background and text color
                const Text('Ingredients:', style: TextStyle(fontWeight: FontWeight.bold, color: CupertinoColors.black)),
                const SizedBox(height: 8),
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: CupertinoColors.systemFill, // Dark background
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Column(
                    children: ingredients.map((ingredient) {
                      return Text(ingredient, style: TextStyle(color: CupertinoColors.black));
                    }).toList(),
                  ),
                ),
                const SizedBox(height: 12),
                // Procedure section with a custom background and text color
                const Text('Procedure:', style: TextStyle(fontWeight: FontWeight.bold, color: CupertinoColors.black)),
                const SizedBox(height: 8),
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: CupertinoColors.systemFill, // Dark background
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(procedure, style: TextStyle(color: CupertinoColors.black)),
                ),
              ],
            ),
            actions: <Widget>[
              CupertinoDialogAction(
                child: const Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 10),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: CupertinoColors.systemGrey.withOpacity(0.1),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Container(
                width: double.infinity, // Ensure the container takes full width
                height: 150, // Adjusted height for better aspect ratio
                child: Image.asset(
                  imagePath,
                  fit: BoxFit.cover, // This will ensure the image covers the entire container
                ),
              ),
            ),
            const SizedBox(height: 12), // Increased space between image and title
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0), // Adjust padding for better text layout
              child: Text(
                title,
                style: const TextStyle(
                  fontSize: 18, // Text size increased for better visibility
                  fontWeight: FontWeight.bold,
                  color: CupertinoColors.white,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 16), // Additional space after text
          ],
        ),
      ),
    );
  }
}

final List<Map<String, dynamic>> lunchRecipes = [
  {
    'title': 'Grilled Chicken Salad',
    'imagePath': 'assets/img/grilledchickensalad.jpg',
    'ingredients': [
      '1 lb chicken breast',
      '2 cups mixed greens',
      '1 cucumber, sliced',
      '1/2 red onion, thinly sliced',
      '1/2 cup cherry tomatoes, halved',
      'Olive oil',
      'Salt and pepper to taste',
      'Balsamic vinegar for dressing',
    ],
    'procedure': '1. Season chicken breast with salt, pepper, and olive oil.\n'
        '2. Grill chicken until fully cooked, then slice it thinly.\n'
        '3. Toss the mixed greens, cucumber, onion, and tomatoes in a bowl.\n'
        '4. Add the grilled chicken slices on top and drizzle with balsamic vinegar.\n'
        '5. Serve immediately.'
  },
  {
    'title': 'Veggie Wrap',
    'imagePath': 'assets/img/veggiewrap.jpg',
    'ingredients': [
      '1 large whole wheat wrap',
      '1/4 cup hummus',
      '1/2 avocado, sliced',
      '1/2 cup shredded carrots',
      '1/4 cup spinach leaves',
      '1/4 cup cucumber, sliced',
      'Salt and pepper to taste',
    ],
    'procedure': '1. Lay the whole wheat wrap flat and spread hummus evenly.\n'
        '2. Layer the avocado, carrots, spinach, and cucumber on top.\n'
        '3. Sprinkle with salt and pepper.\n'
        '4. Roll up the wrap tightly and slice it in half.\n'
        '5. Serve with a side of your choice.'
  },
  {
    'title': 'Chicken Caesar Wrap',
    'imagePath': 'assets/img/chickencaesarwrap.jpg',
    'ingredients': [
      '1 chicken breast, grilled and sliced',
      '1 whole wheat wrap',
      '1/4 cup Caesar dressing',
      '1/4 cup romaine lettuce, chopped',
      '1/4 cup Parmesan cheese',
      'Croutons for garnish',
    ],
    'procedure': '1. Spread Caesar dressing on the wrap.\n'
        '2. Add the grilled chicken, lettuce, Parmesan, and croutons.\n'
        '3. Roll up the wrap tightly and slice in half.\n'
        '4. Serve immediately with a side of chips or a drink.'
  },
  {
    'title': 'Spaghetti Aglio e Olio',
    'imagePath': 'assets/img/spaghettiaglio.jpg',
    'ingredients': [
      '8 oz spaghetti',
      '4 cloves garlic, minced',
      '1/4 cup olive oil',
      '1/4 teaspoon red pepper flakes',
      '1/4 cup fresh parsley, chopped',
      'Salt and pepper to taste',
    ],
    'procedure': '1. Cook spaghetti according to package directions.\n'
        '2. In a large pan, heat olive oil and sauté garlic until fragrant.\n'
        '3. Add red pepper flakes and cooked spaghetti to the pan, tossing to coat.\n'
        '4. Add fresh parsley and toss again.\n'
        '5. Serve immediately with Parmesan cheese, if desired.'
  },
];
