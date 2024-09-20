import 'package:flutter/material.dart';

import 'package:samudra_saarthi/homepage/bagabeachdetails.dart';

class AttractionsPage extends StatelessWidget {
  const AttractionsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Text(
            'Our message',
            style: TextStyle(
              fontSize: 18,
              fontFamily: 'Lato',
              fontWeight: FontWeight.bold,
            ),
          ),
          const Text(
            'Have a blast of fun but with caution 😇',
            style: TextStyle(
              fontSize: 16,
              fontFamily: 'Lato',
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          const Text(
            'Scuba Diving',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              fontFamily: 'Lato',
            ),
          ),

          const SizedBox(height: 10),

          // Horizontally scrollable Hero cards
          SizedBox(
            height: 150.0, // Height of each card
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                _buildHeroCard(context, 'Radhanagar Beach, Andaman',
                    'assets/images/radhanagar.jpg', 'beachHero2'),
                _buildHeroCard(context, 'Dhanushkodi Beach, Tamil Nadu',
                    'assets/images/dhanushkodi.jpg', 'beachHero2'),
                _buildHeroCard(context, 'Calangute Beach, Goa',
                    'assets/images/calangute.jpg', 'beachHero3'),
              ],
            ),
          ),

          const SizedBox(height: 20),
          const Text(
            'Parasailing',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              fontFamily: 'Lato',
            ),
          ),

          const SizedBox(height: 10),
          SizedBox(
            height: 150.0, // Height of each card
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                _buildHeroCard(context, 'Puri Beach, Odisha',
                    'assets/images/puri.jpg', 'beachHero1'),
                _buildHeroCard(context, 'Radhanagar Beach, Andaman',
                    'assets/images/radhanagar.jpg', 'beachHero2'),
                _buildHeroCard(context, 'Kappad Beach, Kerala',
                    'assets/images/kappad.jpg', 'beachHero3'),
                _buildHeroCard(context, 'Cherai Beach, Kerala',
                    'assets/images/cherai.jpg', 'beachHero3'),
                _buildHeroCard(context, 'Diveagar Beach, Goa',
                    'assets/images/diveagar.jpg', 'beachHero3'),
              ],
            ),
          ),

          const SizedBox(height: 20),
          const Text(
            'Surfing',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              fontFamily: 'Lato',
            ),
          ),

          const SizedBox(height: 10),
          SizedBox(
            height: 150.0, // Height of each card
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                _buildHeroCard(context, 'Diu Beach, Diu',
                    'assets/images/diu.jpg', 'beachHero1'),
                _buildHeroCard(context, 'Juhu Beach, Maharastra',
                    'assets/images/juhu.jpg', 'beachHero2'),
                _buildHeroCard(context, 'Om Beach, Karnataka',
                    'assets/images/om.jpg', 'beachHero3'),
                _buildHeroCard(context, 'Talasari Beach, Odisha',
                    'assets/images/talasari.jpg', 'beachHero3'),
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          const Text(
            'Jet Skiing',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              fontFamily: 'Lato',
            ),
          ),
          const SizedBox(height: 10),
          SizedBox(
            height: 150.0, // Height of each card
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                _buildHeroCard(context, 'Diveagar Beach, Goa',
                    'assets/images/diveagar.jpg', 'beachHero3'),
                _buildHeroCard(context, 'Puri Beach, Odisha',
                    'assets/images/puri.jpg', 'beachHero1'),
                _buildHeroCard(context, 'Radhanagar Beach, Andaman',
                    'assets/images/radhanagar.jpg', 'beachHero2'),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Helper function to build individual Hero cards
  Widget _buildHeroCard(
    BuildContext context,
    String beachName,
    String imagePath,
    String heroTag,
  ) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const BeachDetailsPage(),
          ),
        );
      },
      child: Hero(
        tag: heroTag, // Unique hero tag for each card
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 8.0),
          width: 250, // Fixed width for each card
          height: 50.0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16.0),
            image: DecorationImage(
              opacity: 1,
              image: AssetImage(imagePath), // Replace with your image
              fit: BoxFit.cover,
            ),
          ),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16.0),
              gradient: LinearGradient(
                colors: [Colors.black.withOpacity(0.5), Colors.transparent],
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Align(
                alignment: Alignment.bottomLeft,
                child: Text(
                  beachName,
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white.withOpacity(0.9),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
