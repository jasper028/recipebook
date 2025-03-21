import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'breakfast.dart'; // Import the BreakfastRecipes page
import 'lunch.dart'; // Import the LunchRecipes page
import 'dinner.dart'; // Import the DinnerRecipes page
import 'dessert.dart'; // Import the DessertRecipes page
import 'drinks.dart'; // Import the DrinksRecipes page (new)

class HomePage extends StatelessWidget {
  const HomePage({super.key});

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
        // Heart icon removed from navigation bar
        trailing: SizedBox.shrink(), // Empty widget instead of the heart icon
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            children: <Widget>[
              const SizedBox(height: 30),
              const Text(
                'Recipe Categories',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: CupertinoColors.white,
                  letterSpacing: 1.5,
                ),
              ),
              const SizedBox(height: 20),

              // Using ListView to scroll down the items
              Expanded(
                child: ListView.builder(
                  itemCount: 5, // Number of categories now includes Drinks
                  itemBuilder: (context, index) {
                    final categories = [
                      {'title': 'Breakfast Recipes', 'imagePath': 'assets/img/breakfast.jpg'},
                      {'title': 'Lunch Recipes', 'imagePath': 'assets/img/lunch.jpg'},
                      {'title': 'Dinner Recipes', 'imagePath': 'assets/img/dinner.jpg'},
                      {'title': 'Dessert Recipes', 'imagePath': 'assets/img/dessert.jpg'},
                      {'title': 'Drinks Recipes', 'imagePath': 'assets/img/drinks.jpg'}, // New Drinks category
                    ];

                    return _buildCategoryTile(
                      context,
                      categories[index]['title']!,
                      categories[index]['imagePath']!,
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

  // Function to build category tile
  Widget _buildCategoryTile(BuildContext context, String title, String imagePath) {
    return GestureDetector(
      onTap: () {
        // Navigate to the corresponding page when a category is clicked
        if (title == 'Breakfast Recipes') {
          Navigator.push(
            context,
            CupertinoPageRoute(
              builder: (context) => const BreakfastRecipes(),
            ),
          );
        } else if (title == 'Lunch Recipes') {
          Navigator.push(
            context,
            CupertinoPageRoute(
              builder: (context) => const LunchRecipes(), // Navigate to LunchRecipes page
            ),
          );
        } else if (title == 'Dinner Recipes') {
          Navigator.push(
            context,
            CupertinoPageRoute(
              builder: (context) => const DinnerRecipes(), // Navigate to DinnerRecipes page
            ),
          );
        } else if (title == 'Dessert Recipes') {
          // Navigate to DessertRecipes page
          Navigator.push(
            context,
            CupertinoPageRoute(
              builder: (context) => const DessertRecipes(), // Navigate to DessertRecipes page
            ),
          );
        } else if (title == 'Drinks Recipes') {
          // Navigate to DrinksRecipes page
          Navigator.push(
            context,
            CupertinoPageRoute(
              builder: (context) => const DrinksRecipes(), // Navigate to DrinksRecipes page
            ),
          );
        } else {
          // Show a dialog for other categories
          showCupertinoDialog(
            context: context,
            builder: (context) => CupertinoAlertDialog(
              title: Text('Category: $title'),
              content: Text('This will show recipes for $title.'),
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
        }
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 10), // Space between items
        padding: const EdgeInsets.all(12), // Padding inside the container
        decoration: BoxDecoration(
          color: CupertinoColors.systemGrey.withOpacity(0.1),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Container(
                width: 80, // Fixed width for the image
                height: 80, // Fixed height for the image
                child: Image.asset(
                  imagePath,
                  fit: BoxFit.cover, // Ensures the image covers the container
                ),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                title,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: CupertinoColors.white,
                ),
                textAlign: TextAlign.start,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
