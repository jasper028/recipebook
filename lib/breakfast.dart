import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BreakfastRecipes extends StatelessWidget {
  const BreakfastRecipes({super.key});

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
          'Breakfast Recipes',
          style: TextStyle(color: CupertinoColors.white),
        ),
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              const SizedBox(height: 20),
              // Add a list of breakfast recipes here
              Expanded(
                child: ListView.builder(
                  itemCount: recipes.length,
                  itemBuilder: (context, index) {
                    final recipe = recipes[index];
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

final List<Map<String, dynamic>> recipes = [
  {
    'title': 'Pancakes',
    'imagePath': 'assets/img/pancakes.jpg',
    'ingredients': [
      '1 cup all-purpose flour',
      '1 tablespoon sugar',
      '1 tablespoon baking powder',
      '1/4 teaspoon salt',
      '1 egg',
      '1 cup milk',
      '1 tablespoon melted butter',
    ],
    'procedure': '1. Mix flour, sugar, salt, and baking powder in a bowl.\n'
        '2. Whisk in egg, milk, and melted butter.\n'
        '3. Heat a non-stick pan and pour batter.\n'
        '4. Cook until bubbles form, then flip and cook until golden brown.\n'
        '5. Serve with syrup or toppings of your choice.'
  },
  {
    'title': 'Omelette',
    'imagePath': 'assets/img/omelette.jpg',
    'ingredients': [
      '2 eggs',
      'Salt and pepper to taste',
      '1 tablespoon butter',
      '1/4 cup shredded cheese',
      '1/4 cup diced vegetables (onion, bell pepper, etc.)',
    ],
    'procedure': '1. Whisk eggs with salt and pepper.\n'
        '2. Heat butter in a pan.\n'
        '3. Pour in egg mixture and cook until edges start to set.\n'
        '4. Add cheese and vegetables, fold the omelette, and cook until golden brown.'
  },
  {
    'title': 'French Toast',
    'imagePath': 'assets/img/frenchtoast.jpg',
    'ingredients': [
      '2 slices of bread',
      '1 egg',
      '1/4 cup milk',
      '1 tablespoon sugar',
      '1/4 teaspoon cinnamon',
      '1/2 teaspoon vanilla extract',
      'Butter for cooking',
    ],
    'procedure': '1. Whisk together egg, milk, sugar, cinnamon, and vanilla extract.\n'
        '2. Dip the bread slices into the mixture.\n'
        '3. Cook in a heated pan with butter until both sides are golden brown.\n'
        '4. Serve with syrup, berries, or powdered sugar.'
  },
  {
    'title': 'Smoothie Bowl',
    'imagePath': 'assets/img/smoothiebowl.jpg',
    'ingredients': [
      '1 banana',
      '1/2 cup berries (blueberries, strawberries, etc.)',
      '1/2 cup spinach (optional)',
      '1/4 cup yogurt or almond milk',
      'Toppings: Granola, chia seeds, sliced fruits, coconut flakes',
    ],
    'procedure': '1. Blend banana, berries, spinach, and yogurt until smooth.\n'
        '2. Pour into a bowl and add toppings like granola, chia seeds, or fruits.\n'
        '3. Serve chilled.'
  },
];
