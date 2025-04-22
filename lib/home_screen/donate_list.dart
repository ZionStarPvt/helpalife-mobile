import 'package:flutter/material.dart';

class DonateList extends StatefulWidget {
  const DonateList({super.key});

  @override
  State<DonateList> createState() => _DonateListState();
}

class _DonateListState extends State<DonateList> {
  int? _selectedIndex;

  final List<Map<String, String>> donateList=[
    {
      'name': 'Sahalam sk',
      'bloodGroup': 'A+',
      'date': '1994-01-12',
      'reason': 'Shankarpur house number reason',
      'hospital': 'Janugipur hospital',
      'location': 'West Bengal, Murshidabad',
      'country': 'India',
      'no of units': '742202'
    },
    {
      'name': 'Sahalam sk',
      'bloodGroup': 'A+',
      'date': '1994-01-12',
      'reason': 'Shankarpur house number reason',
      'hospital': 'Janugipur hospital',
      'location': 'West Bengal, Murshidabad',
      'country': 'India',
      'no of units': '742202'
    },
    {
      'name': 'Sahalam sk',
      'bloodGroup': 'A+',
      'date': '1994-01-12',
      'reason': 'Shankarpur house number reason',
      'hospital': 'Janugipur hospital',
      'location': 'West Bengal, Murshidabad',
      'country': 'India',
      'no of units': '742202'
    },
    {
      'name': 'Sahalam sk',
      'bloodGroup': 'A+',
      'date': '1994-01-12',
      'reason': 'Shankarpur house number reason',
      'hospital': 'Janugipur hospital',
      'location': 'West Bengal, Murshidabad',
      'country': 'India',
      'no of units': '742202'
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
          // Small top indicator bar
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

          // List content
          Expanded(
            child:
             donateList.isEmpty
                    ? const Center(child: Text("No donations found"))
                    : ListView.builder(
                      itemCount: donateList.length,
                      itemBuilder: (context, index) {
                        final item = donateList[index];
                        final isSelected = _selectedIndex == index;

                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              _selectedIndex =
                                  isSelected ? null : index; // toggle selection
                            });
                          },
                          child: Card(
                            color: Colors.white,
                            elevation: 2,
                            margin: const EdgeInsets.symmetric(vertical: 6),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                              side: BorderSide(
                                color: Colors.grey.shade400,
                                width: 1.0,
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  RichText(
                                    text: TextSpan(
                                      style: const TextStyle(
                                        color: Colors.black,
                                      ),
                                      children: [
                                        TextSpan(
                                          text: "${item['name']}  ",
                                        ),
                                        TextSpan(
                                          text: item['bloodGroup'],
                                          style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.red,
                                          ),
                                        ),
                                        TextSpan(
                                          text:
                                              " blood on ${item['date']} for ${item['reason']}\n\n"
                                              "Hospital   :${item['hospital']}\n"
                                              "Location   :${item['location']}\n"
                                              "Country    :${item['country']}\n",
                                        ),
                                      ],
                                    ),
                                  ),
                                  if (isSelected) ...[
                                    const SizedBox(height: 10),
                                    Text(
                                      "No of units: ${item['no of units']}",
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const SizedBox(height: 6),
                                    ElevatedButton(
                                      onPressed: () {
                                        // Handle donate action
                                        showDonateDialog(context);
                                      },
                                      style: ElevatedButton.styleFrom(
                                     backgroundColor: Colors.redAccent,
                                     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8),
                                      ),
                                    ),
                                    child: const Text("I Can Donate",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    ),
                                  ],
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
          ),
        ],
      ),
    );
  }

  void showDonateDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false, // disables tap outside
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          insetPadding: const EdgeInsets.symmetric(horizontal: 30),
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 30, 20, 20),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const SizedBox(height: 10),
                    const Text(
                      "By clicking 'I Can Donate', notifications will be sent to the recipient with your contact details and request to share their live location, allowing you to assist with the donation process.",
                      style: TextStyle(
                        fontSize: 13.5,
                        height: 1.5,
                        color: Colors.black87,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 25),
                    SizedBox(
                      width: 140,
                      height: 40,
                      child: ElevatedButton(
                        onPressed: () {
                          // your logic here
                          Navigator.pop(context);
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.redAccent,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: const Text(
                          'I Can Donate',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              // Positioned close icon
              Positioned(
                top: 10,
                right: 10,
                child: InkWell(
                  onTap: () => Navigator.pop(context),
                  borderRadius: BorderRadius.circular(20),
                  child: const Icon(Icons.close, size: 18, color: Colors.grey),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
