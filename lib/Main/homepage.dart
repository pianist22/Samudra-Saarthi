import 'package:samudra_saarthi/Main/chatscreen.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:samudra_saarthi/homepage/beaches.dart';
import 'package:samudra_saarthi/homepage/activity.dart';
import 'package:samudra_saarthi/homepage/locations.dart';
import 'package:samudra_saarthi/homepage/bagabeachdetails.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedContentIndex = 0;
  final TextEditingController _searchController = TextEditingController();
  List<String> _suggestions = [];
  final List<String> _beaches = ['Baga Beach', 'Puri Beach', 'Radhaagar Beach', 'Kappad Beach'];

  // Pages for the respective buttons
  final List<Widget> contentPages = [
    const BeachPage(),
    const ActivityPage(),
    const AttractionsPage(),
  ];

  // Update suggestions based on user input
  void _updateSuggestions(String query) {
    setState(() {
      _suggestions = query.isEmpty
          ? []
          : _beaches.where((beach) => beach.toLowerCase().contains(query.toLowerCase())).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              // Search bar with SOS button
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    // Search bar
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              color: const Color.fromRGBO(79, 203, 255, .3),
                              borderRadius: BorderRadius.circular(30.0),
                            ),
                            child: TextField(
                              controller: _searchController,
                              decoration: const InputDecoration(
                                hintText: 'Search...',
                                prefixIcon: Icon(Icons.search, color: Colors.black),
                                border: InputBorder.none,
                                contentPadding: EdgeInsets.symmetric(vertical: 15.0),
                                hintStyle: TextStyle(color: Colors.black),
                              ),
                              onChanged: (query) {
                                _updateSuggestions(query);
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),

                    // Display suggestions
                    if (_suggestions.isNotEmpty)
                      ListView.builder(
                        shrinkWrap: true,
                        itemCount: _suggestions.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                            title: Text(_suggestions[index]),
                            onTap: () {
                              // Navigate to BeachDetailsPage on selection
                              if (_suggestions[index] == 'Baga Beach') {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const BeachDetailsPage(),
                                  ),
                                );
                              }
                            },
                          );
                        },
                      ),
                  ],
                ),
              ),

              // Carousel with reduced height and rounded corners
              Container(
                margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 8.0),
                child: CarouselSlider(
                  options: CarouselOptions(
                    scrollDirection: Axis.horizontal,
                    height: 200.0,
                    viewportFraction: 1.0,
                    autoPlay: true,
                    autoPlayInterval: const Duration(seconds: 3),
                    autoPlayAnimationDuration: const Duration(milliseconds: 800),
                  ),
                  items: [
                    'assets/images/sih.jpg', // Update with your image paths
                    'assets/images/modi.jpg',
                    'assets/images/goa.jpg',
                  ].map((imagePath) {
                    return Container(
                      margin: const EdgeInsets.symmetric(horizontal: 5.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16.0), // Rounded corners
                        color: Colors.black,
                        image: DecorationImage(
                          image: AssetImage(imagePath),
                          fit: BoxFit.cover,
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
              const SizedBox(height: 10.0),

              // Row of three containers for navigation
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  // Beach Button
                  _buildCustomContainer(
                    icon: Icons.warning_amber_rounded,
                    label: 'Warnings',
                    index: 0,
                    gradient: const LinearGradient(
                      colors: [Colors.blueAccent, Colors.lightBlue],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                  ),
                  // Activities Button
                  _buildCustomContainer(
                    icon: Icons.beach_access_outlined,
                    label: 'Beaches',
                    index: 1,
                    gradient: const LinearGradient(
                      colors: [Colors.greenAccent, Colors.lightGreen],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                  ),
                  // Popular Locations Button
                  _buildCustomContainer(
                    icon: Icons.surfing,
                    label: 'Activities',
                    index: 2,
                    gradient: const LinearGradient(
                      colors: [Colors.orangeAccent, Colors.deepOrange],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 20.0),

              // Conditionally rendered content based on selected button
              contentPages[selectedContentIndex], // Show content based on selected index
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ChatScreen()),
          );
        },
        backgroundColor: const Color.fromRGBO(79, 203, 255, 1), // Sets the button background color
        elevation: 0, // Adds a subtle shadow for depth
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(90.0), // Gives the button rounded edges
        ),
        child: const Icon(
          Icons.chat, // Adds the chat icon
          color: Colors.white, // Ensures the icon color fits the theme
        ),
      ),
    );
  }

  // Helper function to build each custom container button
  Widget _buildCustomContainer({
    required IconData icon,
    required String label,
    required int index,
    required Gradient gradient,
  }) {
    return InkWell(
      splashColor: Colors.grey.shade700,
      onTap: () {
        setState(() {
          selectedContentIndex = index;
        });
      },
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(60.0),
        ),
        shadowColor: Colors.black.withOpacity(0.25),
        margin: const EdgeInsets.symmetric(vertical: 0),
        color: Colors.white,
        child: Container(
          width: 110,
          height: 80,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16.0),
            color: const Color.fromRGBO(79, 203, 255, 1),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                size: 36,
                color: Colors.white,
              ),
              const SizedBox(height: 5),
              Text(
                label,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.normal,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}