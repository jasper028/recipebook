import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DessertRecipes extends StatelessWidget {
  const DessertRecipes({super.key});

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
          'Dessert Recipes',
          style: TextStyle(color: CupertinoColors.white),
        ),
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              const SizedBox(height: 20),
              Expanded(
                child: ListView.builder(
                  itemCount: dessertRecipes.length,
                  itemBuilder: (context, index) {
                    final recipe = dessertRecipes[index];
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
                width: double.infinity,
                height: 150,
                child: Image.asset(
                  imagePath,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 12),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                title,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: CupertinoColors.white,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}

// Example dessert recipes
final List<Map<String, dynamic>> dessertRecipes = [
  {
    'title': 'Chocolate Lava Cake',
    'imagePath': 'assets/img/chocolate_lava_cake.jpg',
    'ingredients': [
      '1/2 cup unsalted butter',
      '1 cup dark chocolate, chopped',
      '2 large eggs',
      '2 egg yolks',
      '1/4 cup sugar',
      '1/4 cup flour',
      'Pinch of salt',
      'Vanilla ice cream (for serving)',
    ],
    'procedure': '1. Preheat oven to 425°F (220°C). Grease and flour 4 ramekins.\n'
        '2. Melt butter and chocolate in a heatproof bowl over simmering water or in the microwave.\n'
        '3. In another bowl, whisk eggs, egg yolks, sugar, and salt together.\n'
        '4. Combine the melted chocolate mixture with the egg mixture.\n'
        '5. Stir in flour, and divide the batter among the ramekins.\n'
        '6. Bake for 12-14 minutes until the edges are set but the center is soft.\n'
        '7. Serve immediately with vanilla ice cream.'
  },
  {
    'title': 'Classic Tiramisu',
    'imagePath': 'assets/img/tiramisu.jpg',
    'ingredients': [
      '1 cup strong coffee, cooled',
      '1/4 cup coffee liqueur (optional)',
      '3/4 cup heavy cream',
      '2 cups mascarpone cheese',
      '1/2 cup powdered sugar',
      '1 teaspoon vanilla extract',
      '24 ladyfingers',
      'Cocoa powder (for dusting)',
    ],
    'procedure': '1. Mix coffee and liqueur (if using) in a shallow dish.\n'
        '2. In a bowl, whisk heavy cream until stiff peaks form.\n'
        '3. In another bowl, mix mascarpone, powdered sugar, and vanilla extract until smooth.\n'
        '4. Gently fold the whipped cream into the mascarpone mixture.\n'
        '5. Dip ladyfingers quickly into the coffee mixture and layer them in a dish.\n'
        '6. Spread half of the mascarpone mixture over the ladyfingers, then repeat with another layer.\n'
        '7. Dust with cocoa powder and refrigerate for 4 hours before serving.'
  },
  {
    'title': 'Vanilla Panna Cotta',
    'imagePath': 'assets/img/panna_cotta.jpg',
    'ingredients': [
      '2 cups heavy cream',
      '1 cup milk',
      '1/2 cup sugar',
      '1 vanilla bean or 1 tablespoon vanilla extract',
      '2 1/2 teaspoons gelatin powder',
      '2 tablespoons water',
      'Fresh berries (for garnish)',
    ],
    'procedure': '1. In a saucepan, heat cream, milk, and sugar until sugar dissolves and the mixture is warm.\n'
        '2. If using a vanilla bean, scrape the seeds into the cream mixture and add the pod; bring to a simmer.\n'
        '3. In a separate bowl, sprinkle gelatin over water and let it bloom for 5 minutes.\n'
        '4. Add the gelatin mixture to the warm cream mixture and stir until fully dissolved.\n'
        '5. Pour the mixture into molds and refrigerate for at least 4 hours.\n'
        '6. Serve with fresh berries on top.'
  },
  {
    'title': 'Lemon Meringue Pie',
    'imagePath': 'assets/img/lemon_meringue_pie.jpg',
    'ingredients': [
      '1 pre-baked pie crust',
      '1 cup sugar',
      '2 tablespoons cornstarch',
      '1/4 teaspoon salt',
      '1 1/2 cups water',
      '4 large egg yolks',
      '1/4 cup lemon juice',
      '2 teaspoons lemon zest',
      '2 tablespoons butter',
      '4 large egg whites',
      '1/4 teaspoon cream of tartar',
    ],
    'procedure': '1. In a saucepan, whisk together sugar, cornstarch, and salt.\n'
        '2. Gradually add water and cook over medium heat until the mixture thickens.\n'
        '3. Whisk in egg yolks, lemon juice, and lemon zest, and cook for another 2 minutes.\n'
        '4. Remove from heat and stir in butter.\n'
        '5. Pour the filling into the pre-baked pie crust.\n'
        '6. In a separate bowl, beat egg whites and cream of tartar until soft peaks form.\n'
        '7. Gradually add sugar and beat until stiff peaks form.\n'
        '8. Spread the meringue over the lemon filling and bake at 350°F (175°C) for 10 minutes or until golden brown.'
  },
  {
    'title': 'Strawberry Shortcake',
    'imagePath': 'assets/img/strawberry_shortcake.jpg',
    'ingredients': [
      '2 cups heavy cream',
      '1/2 cup powdered sugar',
      '1 teaspoon vanilla extract',
      '1 lb fresh strawberries, sliced',
      '2 tablespoons sugar',
      '4 store-bought or homemade shortcakes',
    ],
    'procedure': '1. In a bowl, whisk heavy cream, powdered sugar, and vanilla extract until stiff peaks form.\n'
        '2. Toss sliced strawberries with sugar and let them sit for 10-15 minutes to release their juices.\n'
        '3. Split the shortcakes in half and layer them with whipped cream and strawberries.\n'
        '4. Top with the other half of the shortcake and more whipped cream and strawberries on top.'
  },
];
