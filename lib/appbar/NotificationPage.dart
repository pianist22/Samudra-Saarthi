import 'package:flutter/material.dart';

class NotificationScreen extends StatefulWidget {
  @override
  _NotificationScreenState createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  // Full list of notifications
  final List<Map<String, String>> allNotifications = [
    {"title": "Juhu Beach", "message": "Medium risk detected!", "time": "10:20 AM", "risk": "medium"},
    {"title": "Diu Beach", "message": "Medium risk reported.", "time": "9:15 AM", "risk": "medium"},
    {"title": "Baga Beach", "message": "Beach extremely unsafe!", "time": "Yesterday", "risk": "high"},
    {"title": "Mahabalipuram Beach", "message": "Medium level alert.", "time": "2 days ago", "risk": "medium"},
    {"title": "Candolim Beach", "message": "Life Threatning!", "time": "3 days ago", "risk": "high"},
  ];

  // Filtered notifications list
  List<Map<String, String>> filteredNotifications = [];

  // Default filter (no filter, show all)
  String filter = 'all';

  @override
  void initState() {
    super.initState();
    filteredNotifications = allNotifications;
  }

  // Function to filter notifications based on risk level
  void filterNotifications(String riskLevel) {
    setState(() {
      filter = riskLevel;
      if (riskLevel == 'all') {
        filteredNotifications = allNotifications;
      } else {
        filteredNotifications = allNotifications
            .where((notification) => notification['risk'] == riskLevel)
            .toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Warnings"),
        backgroundColor: const Color.fromRGBO(79, 203, 255, 1),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 12),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () => filterNotifications('all'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 131, 216, 255),
                    padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0), // Increase button size
                  ),
                  child: Text(
                    "All",
                    style: TextStyle(
                      fontSize: 18, // Increase font size
                      color: Colors.white, // Set font color to white
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () => filterNotifications('high'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromRGBO(255, 120, 120, 1),
                    padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0), // Increase button size
                  ),
                  child: Text(
                    "High Risk",
                    style: TextStyle(
                      fontSize: 18, // Increase font size
                      color: Colors.white, // Set font color to white
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () => filterNotifications('medium'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 255, 198, 124),
                    padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0), // Increase button size
                  ),
                  child: Text(
                    "Medium Risk",
                    style: TextStyle(
                      fontSize: 18, // Increase font size
                      color: Colors.white, // Set font color to white
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Expanded(
              child: NotificationList(notifications: filteredNotifications),
            ),
          ],
        ),
      ),
    );
  }
}

class NotificationList extends StatelessWidget {
  final List<Map<String, String>> notifications;

  const NotificationList({required this.notifications});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: notifications.map((notification) {
        return NotificationTile(
          title: notification['title']!,
          message: notification['message']!,
          time: notification['time']!,
          risk: notification['risk']!,
        );
      }).toList(),
    );
  }
}

class NotificationTile extends StatelessWidget {
  final String title;
  final String message;
  final String time;
  final String risk;

  const NotificationTile({
    required this.title,
    required this.message,
    required this.time,
    required this.risk,
  });

  // Function to get the background color based on risk level
  Color getBackgroundColorForRisk(String risk) {
    if (risk == 'high') {
      return Colors.redAccent.withOpacity(0.1); // Light red for high risk
    } else if (risk == 'medium') {
      return Colors.orangeAccent.withOpacity(0.1); // Light orange for medium risk
    } else {
      return Colors.grey.withOpacity(0.1); // Default light grey for others
    }
  }

  @override
  Widget build(BuildContext context) {
    IconData getIconForRisk(String risk) {
      if (risk == 'high') {
        return Icons.warning; // High risk
      } else if (risk == 'medium') {
        return Icons.report_problem; // Medium risk
      } else {
        return Icons.info; // Default case (if needed)
      }
    }

    Color getIconColorForRisk(String risk) {
      if (risk == 'high') {
        return Colors.redAccent;
      } else if (risk == 'medium') {
        return Colors.orangeAccent;
      } else {
        return Colors.grey;
      }
    }

    return Card(
  elevation: 6, // Set the elevation for the Card
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(10), // Add rounded corners
  ),
  shadowColor: Colors.black.withOpacity(0.3), // Customize shadow color if needed
  child: Container( 
    decoration: BoxDecoration(
      color: getBackgroundColorForRisk(risk), // Set background color based on risk
      borderRadius: BorderRadius.circular(10),
    ),
    child: ListTile(
      contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 16.0), // Increase card height
      leading: CircleAvatar(
        backgroundColor: getIconColorForRisk(risk),
        child: Icon(getIconForRisk(risk), color: Colors.white),
      ),
      title: Text(
        title,
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18), // Increased font size
      ),
      subtitle: Text(
        message,
        style: TextStyle(fontSize: 16), // Increased font size for the message
      ),
      trailing: Text(
        time,
        style: TextStyle(color: Colors.grey, fontSize: 14), // Slightly larger font for time
      ),
    ),
  ),
);
  }
  }
