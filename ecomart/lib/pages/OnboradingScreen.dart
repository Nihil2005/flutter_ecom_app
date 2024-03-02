import 'package:flutter/material.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Set background color
      body: PageView(
        children: [
          // Pages of the onboarding screen
          OnboardingPage(
            imagePath: 'assets/2.png',
            title: 'Welcome to Our App',
            description:
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut elit tellus, luctus nec ullamcorper mattis, pulvinar dapibus leo.',
            isLastPage: false, // Set to false for the first two pages
          ),
          OnboardingPage(
            imagePath: 'assets/images/onboarding_image2.png',
            title: 'Discover New Features',
            description:
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut elit tellus, luctus nec ullamcorper mattis, pulvinar dapibus leo.',
            isLastPage: false, // Set to false for the second page
          ),
          OnboardingPage(
            imagePath: 'assets/images/onboarding_image3.png',
            title: 'Get Started Now',
            description:
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut elit tellus, luctus nec ullamcorper mattis, pulvinar dapibus leo.',
            isLastPage: true, // Set to true for the last page
          ),
        ],
      ),
    );
  }
}

class OnboardingPage extends StatelessWidget {
  final String imagePath;
  final String title;
  final String description;
  final bool isLastPage;

  const OnboardingPage({
    required this.imagePath,
    required this.title,
    required this.description,
    required this.isLastPage,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height *
              0.5, // Adjust image size according to your preference
          child: Image.asset(
            imagePath,
            fit: BoxFit.cover,
          ),
        ),
        SizedBox(height: 20),
        Text(
          title,
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Text(
            description,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey,
            ),
          ),
        ),
        if (isLastPage) SizedBox(height: 40),
        ElevatedButton(
          onPressed: () {
            // Navigate to the home screen
            Navigator.pushReplacementNamed(context, '/home');
          },
          child: Text('Get Started'),
        ),
      ],
    );
  }
}
