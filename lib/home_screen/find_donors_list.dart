import 'package:flutter/material.dart';
import 'package:helpalife_mobile/home_screen/request_donors.dart';

class FindDonorsList extends StatelessWidget {
  FindDonorsList({super.key});

  final List<Map<String, dynamic>> donorsList = [
    {
      'name': 'Jelina Denslova',
      'location': 'Route 26, New York',
      'bloodGroup': 'O+',
      'profileImage': 'assets/images/profile1.png',
    },
    {
      'name': 'Jelina Denslova',
      'location': 'Route 26, New York',
      'bloodGroup': 'O+',
      'profileImage': 'assets/images/profile1.png',
    },
    {
      'name': 'Jelina Denslova',
      'location': 'Route 26, New York',
      'bloodGroup': 'O+',
      'profileImage': 'assets/images/profile1.png',
    },
    {
      'name': 'Jelina Denslova',
      'location': 'Route 26, New York',
      'bloodGroup': 'O+',
      'profileImage': 'assets/images/profile1.png',
    },
    {
      'name': 'Jelina Denslova',
      'location': 'Route 26, New York',
      'bloodGroup': 'O+',
      'profileImage': 'assets/images/profile1.png',
    },
  ];


  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.78,
      padding: const EdgeInsets.all(16),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Container(
              width: 40,
              height: 5,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
          const SizedBox(height: 10),
          Expanded(
            child:
                donorsList.isEmpty
                    ? const Center(child: Text("No donors available"))
                    : ListView.builder(
                      itemCount: donorsList.length,
                      itemBuilder: (context, index) {
                        final donor = donorsList[index];
                        return Card(
                          color: Colors.white,
                          elevation: 2,
                          margin: const EdgeInsets.symmetric(vertical: 8),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                            side: BorderSide(
                              color: Colors.grey.shade400,
                              width: 1.0,
                            ),
                          ),
                          child: ListTile(
                            leading: CircleAvatar(
                              radius: 25,
                              backgroundImage: AssetImage(
                                donor['profileImage'],
                              ),
                            ),
                            title: Text(donor['name']),
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(donor['location']),
                                Text("Blood Group: ${donor['bloodGroup']}"),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
          ),
          const SizedBox(height: 10),
          SizedBox(
            width: double.infinity,
            height: 50,
            child: ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
                Navigator.of(context, rootNavigator: true).push(
                  MaterialPageRoute(builder: (context) => RequestDonors()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: const Text(
                "Request Donors",
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
