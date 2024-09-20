import 'package:flutter/material.dart';

class BeachDetailsPage extends StatelessWidget {
  const BeachDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Mock risk parameters
    double highWavesValue = 7.8;
    double tsunamiRiskValue = 3.5;
    double coastalCurrentsValue = 6.2;
    double tidesValue = 4.1;
    String cumulativeRiskScore = 'High Risk';

    // Mock past 3 months risk summary data
    List<Map<String, dynamic>> pastThreeMonthsData = [
      {'month': 'June', 'highWaves': 6.5, 'tsunamiRisk': 2.8, 'currents': 5.4, 'tides': 3.9},
      {'month': 'July', 'highWaves': 8.1, 'tsunamiRisk': 4.0, 'currents': 6.8, 'tides': 4.7},
      {'month': 'August', 'highWaves': 7.4, 'tsunamiRisk': 3.2, 'currents': 6.0, 'tides': 4.3},
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Beach Details'),
        backgroundColor:const Color.fromRGBO(79, 203, 255, 1),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Beach Image
              Hero(
                tag: 'beachHero',
                child: Container(
                  width: double.infinity,
                  height: 200.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16.0),
                    image: const DecorationImage(
                      image: AssetImage('assets/images/baga.jpg'), // Example image for Baga Beach
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16.0),

              // Beach Name
              const Text(
                'Baga Beach, Goa',
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Lato',
                ),
              ),
              const SizedBox(height: 10),

              // Description about the beach
              const Text(
                'Baga Beach is known for its vibrant atmosphere, '
                'water sports, and nightlife. The beach offers a range of adventure '
                'activities perfect for thrill-seekers.',
                style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.black87,
                  fontFamily: 'Lato',
                ),
              ),
              const SizedBox(height: 20.0),

              // Current Risk Parameters
              const Text(
                'Current Risk Parameters:',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Lato',
                ),
              ),
              const SizedBox(height: 10),

              ListTile(
                leading: const Icon(Icons.waves, color: Colors.blue),
                title: Text('High Waves: $highWavesValue m'),
              ),
              ListTile(
                leading: const Icon(Icons.warning, color: Colors.redAccent),
                title: Text('Tsunami Risk: $tsunamiRiskValue'),
              ),
              ListTile(
                leading: const Icon(Icons.water, color: Colors.green),
                title: Text('Coastal Currents: $coastalCurrentsValue m/s'),
              ),
              ListTile(
                leading: const Icon(Icons.waves, color: Colors.orangeAccent),
                title: Text('Tides: $tidesValue m'),
              ),

              const SizedBox(height: 20.0),

              // Cumulative Risk Prediction
              Text(
                'Cumulative Risk Prediction for next 3 days',
                style: const TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontFamily: 'Lato',
                ),
              ),
              Text(
                '${cumulativeRiskScore}',
                style: const TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.red,
                  fontFamily: 'Lato',
                ),
              ),

              const SizedBox(height: 20.0),

              // Summary with dropdown
              const Text(
                'Summary:',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Lato',
                ),
              ),
              const SizedBox(height: 10),

              ExpansionTile(
                title: const Text('Tap to view full summary'),
                children: pastThreeMonthsData.map((data) {
                  String monthlyCumulativeScore = 'Medium Risk';
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${data['month']} Risk Summary:',
                        style: const TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Lato',
                        ),
                      ),
                      ListTile(
                        leading: const Icon(Icons.waves, color: Colors.blue),
                        title: Text('High Waves: ${data['highWaves']} m'),
                      ),
                      ListTile(
                        leading: const Icon(Icons.warning, color: Colors.redAccent),
                        title: Text('Tsunami Risk: ${data['tsunamiRisk']}'),
                      ),
                      ListTile(
                        leading: const Icon(Icons.water, color: Colors.green),
                        title: Text('Coastal Currents: ${data['currents']} m/s'),
                      ),
                      ListTile(
                        leading: const Icon(Icons.waves, color: Colors.orangeAccent),
                        title: Text('Tides: ${data['tides']} m'),
                      ),
                      Text(
                        'Cumulative Score for ${data['month']}: ${monthlyCumulativeScore}',
                        style: const TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.redAccent,
                          fontFamily: 'Lato',
                        ),
                      ),
                      const SizedBox(height: 10.0),
                    ],
                  );
                }).toList(),
              ),

              const SizedBox(height: 20.0),

              // Adventure Activities
              const Text(
                'Adventure Activities Available:',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Lato',
                ),
              ),
              const SizedBox(height: 10),

              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  ListTile(
                    leading: Icon(Icons.directions_boat, color: Colors.blue),
                    title: Text('Jet Skiing'),
                    subtitle: Text('Experience the thrill of jet skiing in the Arabian Sea.'),
                  ),
                  ListTile(
                    leading: Icon(Icons.surfing, color: Colors.orange),
                    title: Text('Parasailing'),
                    subtitle: Text('Get an aerial view of the beach by parasailing.'),
                  ),
                  ListTile(
                    leading: Icon(Icons.water, color: Colors.lightBlueAccent),
                    title: Text('Scuba Diving'),
                    subtitle: Text('Explore the underwater world and witness marine life.'),
                  ),
                  ListTile(
                    leading: Icon(Icons.pedal_bike, color: Colors.green),
                    title: Text('Banana Boat Ride'),
                    subtitle: Text('Enjoy a fun-filled banana boat ride with friends and family.'),
                  ),
                ],
              ),
              const SizedBox(height: 20.0),
            ],
          ),
        ),
      ),
    );
  }}