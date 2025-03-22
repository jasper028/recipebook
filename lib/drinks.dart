import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DrinksRecipes extends StatelessWidget {
  const DrinksRecipes({super.key});

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
            Navigator.pop(context); // Go back to the previous screen
          },
          child: Icon(
            CupertinoIcons.back,
            color: CupertinoColors.white,
          ),
        ),
        middle: const Text(
          'Drinks Recipes',
          style: TextStyle(color: CupertinoColors.white),
        ),
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              const SizedBox(height: 20),
              // Add a list of drinks recipes here
              Expanded(
                child: ListView.builder(
                  itemCount: drinksRecipes.length,
                  itemBuilder: (context, index) {
                    final recipe = drinksRecipes[index];
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

// Example drink recipes
final List<Map<String, dynamic>> drinksRecipes = [
  {
    'title': 'Mango Smoothie',
    'imagePath': 'assets/img/mango_smoothie.jpg',
    'ingredients': [
      '1 ripe mango',
      '1/2 cup yogurt',
      '1/2 cup milk',
      '1 tablespoon honey',
      'Ice cubes (optional)',
    ],
    'procedure': '1. Peel and chop the mango into small pieces.\n'
        '2. In a blender, combine mango, yogurt, milk, and honey.\n'
        '3. Blend until smooth. Add ice cubes for a colder drink.\n'
        '4. Pour into a glass and serve chilled.'
  },
  {
    'title': 'Iced Coffee',
    'imagePath': 'assets/img/iced_coffee.jpg',
    'ingredients': [
      '1 cup brewed coffee (cooled)',
      '1/2 cup milk',
      'Ice cubes',
      '1 tablespoon sugar (optional)',
    ],
    'procedure': '1. Brew the coffee and let it cool down.\n'
        '2. Fill a glass with ice cubes.\n'
        '3. Pour the cooled coffee over the ice cubes.\n'
        '4. Add milk and sugar (if desired) and stir well.\n'
        '5. Serve chilled and enjoy.'
  },
  {
    'title': 'Lemonade',
    'imagePath': 'assets/img/lemonade.jpg',
    'ingredients': [
      '2 lemons',
      '1/4 cup sugar',
      '2 cups water',
      'Ice cubes',
    ],
    'procedure': '1. Squeeze the juice of two lemons into a pitcher.\n'
        '2. Add sugar and water to the pitcher and stir until sugar dissolves.\n'
        '3. Add ice cubes and stir to chill.\n'
        '4. Serve the lemonade cold with lemon slices for garnish.'
  },
  {
    'title': 'Strawberry Milkshake',
    'imagePath': 'assets/img/strawberry_milkshake.jpg',
    'ingredients': [
      '1 cup strawberries',
      '1/2 cup vanilla ice cream',
      '1/2 cup milk',
      '1 tablespoon sugar (optional)',
    ],
    'procedure': '1. Wash and hull the strawberries.\n'
        '2. Blend the strawberries, vanilla ice cream, milk, and sugar.\n'
        '3. Blend until smooth.\n'
        '4. Pour into a glass and garnish with fresh strawberries.'
  },
  {
    'title': 'Green Tea Lemonade',
    'imagePath': 'assets/img/green_tea_lemonade.jpg',
    'ingredients': [
      '1 green tea bag',
      '1 lemon',
      '2 teaspoons honey',
      '2 cups cold water',
      'Ice cubes',
    ],
    'procedure': '1. Brew the green tea bag in hot water and let it cool.\n'
        '2. Squeeze the juice of one lemon into the tea.\n'
        '3. Add honey and stir until dissolved.\n'
        '4. Add cold water and ice cubes. Stir well.\n'
        '5. Serve chilled.'
  },
];
