import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DinnerRecipes extends StatelessWidget {
  const DinnerRecipes({super.key});

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
          'Dinner Recipes',
          style: TextStyle(color: CupertinoColors.white),
        ),
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              const SizedBox(height: 20),
              // Add a list of dinner recipes here
              Expanded(
                child: ListView.builder(
                  itemCount: dinnerRecipes.length,
                  itemBuilder: (context, index) {
                    final recipe = dinnerRecipes[index];
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

// Example dinner recipes
// Example dinner recipes
final List<Map<String, dynamic>> dinnerRecipes = [
  {
    'title': 'Spaghetti Bolognese',
    'imagePath': 'assets/img/spaghetti_bolognese.jpg',
    'ingredients': [
      '200g ground beef',
      '1 onion, chopped',
      '2 cloves garlic, minced',
      '1 can crushed tomatoes (400g)',
      '1 tablespoon tomato paste',
      '1 teaspoon oregano',
      '1 teaspoon basil',
      'Salt and pepper to taste',
      '200g spaghetti',
      'Olive oil for cooking',
      'Grated Parmesan (optional)',
    ],
    'procedure': '1. Heat olive oil in a pan and sauté onions and garlic until soft.\n'
        '2. Add ground beef and cook until browned.\n'
        '3. Stir in crushed tomatoes, tomato paste, oregano, basil, salt, and pepper.\n'
        '4. Simmer for 20 minutes.\n'
        '5. Meanwhile, cook spaghetti according to package instructions.\n'
        '6. Serve the Bolognese sauce over the spaghetti and top with Parmesan (optional).'
  },
  {
    'title': 'Grilled Chicken with Veggies',
    'imagePath': 'assets/img/grilled_chicken_with_veggies.jpg',
    'ingredients': [
      '2 chicken breasts',
      '1 tablespoon olive oil',
      '1 teaspoon garlic powder',
      '1 teaspoon paprika',
      'Salt and pepper to taste',
      '1 zucchini, sliced',
      '1 bell pepper, sliced',
      '1 onion, sliced',
      '1 tablespoon olive oil (for veggies)',
    ],
    'procedure': '1. Preheat grill to medium-high heat.\n'
        '2. Season chicken breasts with olive oil, garlic powder, paprika, salt, and pepper.\n'
        '3. Grill chicken for 6-8 minutes per side, until fully cooked.\n'
        '4. Meanwhile, toss zucchini, bell pepper, and onion with olive oil, salt, and pepper.\n'
        '5. Grill vegetables for 3-4 minutes until tender.\n'
        '6. Serve grilled chicken with the veggies.'
  },
  {
    'title': 'Vegetable Stir-fry with Tofu',
    'imagePath': 'assets/img/vegetable_stirfry_tofu.jpg',
    'ingredients': [
      '200g firm tofu, cubed',
      '1 tablespoon soy sauce',
      '1 tablespoon sesame oil',
      '1 teaspoon garlic powder',
      '1 teaspoon ginger, grated',
      '1 bell pepper, sliced',
      '1 zucchini, sliced',
      '1 carrot, sliced',
      '1/2 cup broccoli florets',
      '2 tablespoons soy sauce (for stir-fry)',
      '1 tablespoon sesame seeds',
    ],
    'procedure': '1. Press the tofu to remove excess moisture, then cut it into cubes.\n'
        '2. Heat sesame oil in a pan and sauté tofu cubes until golden brown on all sides.\n'
        '3. Add garlic, ginger, and soy sauce to the tofu, and stir for 2 minutes.\n'
        '4. In a separate pan, stir-fry the vegetables (bell pepper, zucchini, carrot, and broccoli) for 5-7 minutes until tender but still crisp.\n'
        '5. Add the tofu mixture to the vegetables and stir together.\n'
        '6. Serve topped with sesame seeds.'
  },
  {
    'title': 'Beef Tacos',
    'imagePath': 'assets/img/beef_tacos.jpg',
    'ingredients': [
      '300g ground beef',
      '1 onion, chopped',
      '1 packet taco seasoning',
      '8 small taco shells',
      '1 cup shredded lettuce',
      '1/2 cup shredded cheese',
      '1 tomato, diced',
      '1/2 cup sour cream',
      '1/4 cup salsa',
      '1/4 cup guacamole',
    ],
    'procedure': '1. In a pan, brown the ground beef with chopped onion.\n'
        '2. Stir in taco seasoning and cook according to package instructions.\n'
        '3. While the beef is cooking, heat the taco shells in the oven.\n'
        '4. Once beef is ready, fill taco shells with beef mixture.\n'
        '5. Top with shredded lettuce, cheese, diced tomato, sour cream, salsa, and guacamole.\n'
        '6. Serve and enjoy.'
  },
  {
    'title': 'Salmon with Lemon and Dill',
    'imagePath': 'assets/img/salmon.jpg',
    'ingredients': [
      '2 salmon fillets',
      '1 tablespoon olive oil',
      '1 lemon, sliced',
      '1 tablespoon fresh dill, chopped',
      'Salt and pepper to taste',
      '1 tablespoon butter',
    ],
    'procedure': '1. Preheat oven to 180°C (350°F).\n'
        '2. Place salmon fillets on a baking sheet lined with parchment paper.\n'
        '3. Drizzle with olive oil, and season with salt and pepper.\n'
        '4. Place lemon slices on top of the salmon fillets.\n'
        '5. Bake for 15-20 minutes or until salmon is cooked through.\n'
        '6. Top with fresh dill and a dollop of butter before serving.'
  },
];

