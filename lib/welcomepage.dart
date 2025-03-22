import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'menu.dart';  // Import the HomePage (Menu)

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: Colors.black, // Background set to black
      navigationBar: CupertinoNavigationBar(
        backgroundColor: Colors.transparent, // Make navigation bar transparent
        border: Border.all(color: Colors.transparent), // Remove the border
      ),
      child: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                const SizedBox(height: 50),
                // Welcome Title
                const Text(
                  'Welcome to Recipe Book!',
                  style: TextStyle(
                    fontSize: 36, // Slightly larger for emphasis
                    fontWeight: FontWeight.bold,
                    color: CupertinoColors.white,
                    letterSpacing: 1.5,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),
                // Subtitle with a smaller font size
                const Text(
                  'Discover amazing recipes and enjoy cooking!',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                    color: CupertinoColors.white,
                    letterSpacing: 1.2,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 60),

                // Stylish "Get Started" Button
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: CupertinoColors.systemBlue.withOpacity(0.4),
                        blurRadius: 8.0,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: CupertinoButton.filled(
                    onPressed: () {
                      // Navigate to HomePage (menu.dart) when the button is clicked
                      Navigator.pushReplacement(
                        context,
                        CupertinoPageRoute(builder: (context) => const HomePage()),
                      );
                    },
                    child: const Text(
                      'Get Started',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                    ),
                    borderRadius: BorderRadius.circular(12),
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    // Keep the button color blue
                  ),
                ),
                const SizedBox(height: 40),

                // Optional footer text with bold and stylish look
                const Text(
                  'Made with ❤️ by RecipeBook',
                  style: TextStyle(
                    fontSize: 16, // A bit smaller to fit well as a footer
                    fontWeight: FontWeight.bold, // Make the text bold
                    color: CupertinoColors.white,
                    letterSpacing: 1.5,
                    shadows: [
                      Shadow(
                        color: CupertinoColors.systemBlue,
                        offset: Offset(1.0, 1.0),
                        blurRadius: 4.0,
                      ),
                    ],
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
