import 'package:samudra_saarthi/Main/sos.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:samudra_saarthi/appbar/NotificationPage.dart';
import 'package:samudra_saarthi/Main/map_page.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart'; // Import url_launcher package
import 'homepage.dart';

// AccountPage Placeholder (Add your actual AccountPage implementation)
class AccountPage extends StatelessWidget {
  const AccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Account'),
      ),
      body: const Center(
        child: Text('Welcome to Account Page'),
      ),
    );
  }
}

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  int currentPage = 0;
  bool isGlossaryExpanded = false; // To control glossary expand/collapse

  List<Widget> pages = [
    const HomePage(),
    MapPage(),
    const SOSPage(),
  ];

  @override
  void initState() {
    super.initState();
    _checkLocationPermission();
  }

  Future<void> _checkLocationPermission() async {
    // Check if location permission is granted
    PermissionStatus status = await Permission.location.status;

    // If permission is denied, show pop-up to request permission
    if (status.isDenied) {
      _showLocationPermissionDialog();
    }
  }

  void _showLocationPermissionDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Enable Location Permission'),
          content: const Text(
              'This app needs location access to work properly. Please enable location permission.'),
          actions: [
            TextButton(
              onPressed: () async {
                Navigator.of(context).pop();
                // Request location permission
                await Permission.location.request();
              },
              child: const Text('Enable'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancel'),
            ),
          ],
        );
      },
    );
  }

  // Method to open the URL
  Future<void> _launchUrl(String url) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri)) {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Samudra Saarthi'),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_active, color: Colors.white),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => NotificationScreen()),
              );
            },
          ),
        ],
        iconTheme: const IconThemeData(color: Colors.white), // White drawer icon
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            // Drawer Header with Image and Text
            DrawerHeader(
              decoration: const BoxDecoration(
                color: Color.fromRGBO(79, 203, 255, 1),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Image in the Drawer Header
                  Image.asset(
                    'assets/images/logo.jpeg', // Replace with your actual image asset path
                    width: 80,
                    height: 80,
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'Samudra Saarthi',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: const Icon(Icons.account_circle_outlined),
              title: const Text('Account'),
              onTap: () {
                // Navigate to Account Page when clicked
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const AccountPage()),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.info_outline_rounded),
              title: const Text('Glossary'),
              onTap: () {
                setState(() {
                  // Toggle glossary visibility
                  isGlossaryExpanded = !isGlossaryExpanded;
                });
              },
              trailing: Icon(
                isGlossaryExpanded
                    ? Icons.keyboard_arrow_up
                    : Icons.keyboard_arrow_down,
              ),
            ),
            // Show glossary information when expanded
            if (isGlossaryExpanded)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 8),
                    Row(
                      children: const [
                        Icon(Icons.square, color: Colors.red),
                        SizedBox(width: 8),
                        Text('High Risk', style: TextStyle(fontSize: 16)),
                      ],
                    ),
                    const SizedBox(height: 4),
                    Row(
                      children: const [
                        Icon(Icons.square, color: Colors.orange),
                        SizedBox(width: 8),
                        Text('Medium Risk', style: TextStyle(fontSize: 16)),
                      ],
                    ),
                    const SizedBox(height: 4),
                    Row(
                      children: const [
                        Icon(Icons.square, color: Colors.green),
                        SizedBox(width: 8),
                        Text('Safe', style: TextStyle(fontSize: 16)),
                      ],
                    ),
                    const SizedBox(height: 8),
                  ],
                ),
              ),
            ListTile(
              leading: const Icon(Icons.question_mark),
              title: const Text('About Us'),
              onTap: () {
                // Handle navigation
              },
            ),
            ListTile(
              leading: const Icon(Icons.email_outlined),
              title: const Text('Contact Us'),
              onTap: () {
                // Handle navigation
              },
            ),
            ListTile(
              leading: const Icon(Icons.delete_outline_outlined),
              title: const Text('Delete Account'),
              onTap: () {
                // Handle navigation
              },
            ),
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text('Logout'),
              onTap: () {
                // Handle navigation
              },
            ),
            
            const Spacer(), // This spacer pushes the footer to the bottom
            Padding(
              padding: const EdgeInsets.only(bottom: 20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  // GestureDetector or InkWell for making the image clickable
                  GestureDetector(
                    onTap: () {
                      // Launch the URL on tap
                      _launchUrl('https://incois.gov.in/');
                    },
                    child: Column(
                      children: [
                        const Text(
                          'Powered by',
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 14,
                          ),
                        ),
                        Image.asset(
                          'assets/images/incois.jpg', // Replace with your actual image asset path
                          width: 100,
                          height: 40,
                        ),
                        const SizedBox(height: 5),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      body: IndexedStack(
        index: currentPage,
        children: pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: const Color.fromRGBO(79, 203, 255, 1),
        currentIndex: currentPage,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.map),
            label: 'Map',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.sos),
            label: 'Emergency',
          ),
        ],
        onTap: (value) {
          setState(() {
            currentPage = value;
          });
        },
      ),
    );
  }
}
