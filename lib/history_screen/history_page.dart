import 'package:flutter/material.dart';

class HistoryPage extends StatefulWidget {
  final List<Map<String, String>> donationHistory;
  final bool isRegistered;

  const HistoryPage({
    super.key,
   required this.donationHistory,
    required this.isRegistered,
  });

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Your donations",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    if (!widget.isRegistered) {
      // User not registered
      return _buildRegisterPrompt();
    } else if (widget.donationHistory.isEmpty) {
      // Registered but no donation history
      return _buildNoHistoryFound();
    } else {
      // Registered and has donation history
      return _buildDonationList();
    }
  }

  Widget _buildRegisterPrompt() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Register now to become a blood donor and start tracking your life-saving contributions!",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 14, color: Colors.grey),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // handle register action
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 12,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: const Text(
                "Register",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNoHistoryFound() {
    return const Center(
      child: Text(
        "History not found",
        style: TextStyle(fontSize: 16, color: Colors.grey),
      ),
    );
  }

  Widget _buildDonationList() {
    return ListView.builder(
      padding: const EdgeInsets.all(12),
      itemCount: widget.donationHistory.length,
      itemBuilder: (context, index) {
        final item = widget.donationHistory[index];
        return Card(
          margin: const EdgeInsets.symmetric(vertical: 6),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: RichText(
              text: TextSpan(
                style: const TextStyle(color: Colors.black),
                children: [
                  TextSpan(
                    text: "${item['name']} ",
                    style: const TextStyle(fontWeight: FontWeight.bold),
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
                        "Hospital: ${item['hospital']}\n"
                        "Location: ${item['location']}\n"
                        "Country: ${item['country']}",
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
