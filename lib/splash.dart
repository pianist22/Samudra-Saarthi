import 'package:samudra_saarthi/Main/landing.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 4), () {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (_) => const LandingPage()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 174, 231, 255),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Main image with circular radius
            ClipRRect(
              borderRadius: BorderRadius.circular(30), // Circular radius
              child: Image.asset(
                'assets/images/FinalLogo.jpeg',
                width: 300,
                height: 300,
                fit: BoxFit.cover, // Ensure image covers the given height and width
              ),
            ),
            const SizedBox(
              height: 100,
            ),
            // Footnote text and image
            Padding(
              padding: const EdgeInsets.only(bottom: 20.0),
              child: Column(
                children: [
                  const Text(
                    'Powered By',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Image.asset(
                    'assets/images/incois.jpg', // Replace with the path of your image
                    width: 100,
                    height: 40,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
