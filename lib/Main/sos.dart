import 'package:flutter/material.dart';

class SOSPage extends StatelessWidget {
  const SOSPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SOS'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Big Elevated Button for 'Intimate Authority'
            ElevatedButton(
              onPressed: () {
                _showRescueAlertDialog(context); // Call the alert popup when the button is pressed
              },
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
                backgroundColor: Colors.red, // Red for emergency
              ),
              child: const Text(
                'Intimate Authority',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 30.0),

            // Safety Protocols Section
            const Text(
              'Immediate Safety Protocols:',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            const SizedBox(height: 10.0),

            // Safety Protocols as a List
            const Text(
              '1. Press the above SOS button immediately.\n'
              '2. Stay calm and do not panic.\n'
              '3. Try to get as far away from beach as possible.\n'
              '4. Find a safe location.\n'
              '5. Keep your phone fully charged.\n'
              '6. Do not engage with suspicious individuals.\n'
              '7. Use emergency services if needed (e.g., 112).\n',
              style: TextStyle(fontSize: 18, height: 1.5),
            ),
            const SizedBox(height: 20.0),

            // Emergency Contacts Section
            const Text(
              'Emergency Contacts:',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            const SizedBox(height: 10.0),
            const Text(
              '• Emergency SOS: 112\n'
              '• Local Police: 100\n'
              '• Fire Department: 101\n'
              '• Ambulance: 102\n',
              style: TextStyle(fontSize: 18, height: 1.5),
            ),
          ],
        ),
      ),
    );
  }

  // Function to display the alert dialog when the button is pressed
  void _showRescueAlertDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Rescue Alert Sent'),
          content: const Text(
            'Immediate Rescue Alert has been sent to nearby authorities and help will reach you soon. '
            'Till then exercise immediate safety protocols mentioned on the screen.',
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the popup
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }
}
