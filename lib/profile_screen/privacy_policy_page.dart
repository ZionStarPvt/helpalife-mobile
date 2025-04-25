import 'package:flutter/material.dart';
class PrivacyPolicyPage extends StatelessWidget {
  const PrivacyPolicyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: DefaultTextStyle(
          style: TextStyle(color: Colors.lightBlue, fontSize: 16),
          child: ListView(
            children: const [
              Text(
                'Privacy Policy',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                textAlign: TextAlign.left,
              ),
              SizedBox(height: 24),
              Text(
                '''Your privacy is very important to us. Accordingly, we have developed this Policy in order for you to understand how we collect, use, communicate and disclose and make use of personal information. The following outlines our privacy policy.''',
                textAlign: TextAlign.justify,
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 16),
              Text(
                '''Before or at the time of collecting personal information, we will identify the purposes for which information is being collected.''',
                textAlign: TextAlign.justify,
                style: TextStyle(fontSize: 16),
              ),
              Text(
                '''We will collect and use of personal information solely with the objective of fulfilling those purposes specified by us and for other compatible purposes, unless we obtain the consent of the individual concerned or as required by law.''',
                textAlign: TextAlign.justify,
                style: TextStyle(fontSize: 16),
              ),
              Text(
                '''We will only retain personal information as long as necessary for the fulfillment of those purposes.''',
                textAlign: TextAlign.justify,
                style: TextStyle(fontSize: 16),
              ),
              Text(
                '''We will collect personal information by lawful and fair means and, where appropriate, with the knowledge or consent of the individual concerned.''',
                textAlign: TextAlign.justify,
                style: TextStyle(fontSize: 16),
              ),
              Text(
                '''Personal data should be relevant to the purposes for which it is to be used, and, to the extent necessary for those purposes, should be accurate, complete, and up-to-date.''',
                textAlign: TextAlign.justify,
                style: TextStyle(fontSize: 16),
              ),
              Text(
                '''We will protect personal information by reasonable security safeguards against loss or theft, as well as unauthorized access, disclosure, copying, use or modification.''',
                textAlign: TextAlign.justify,
                style: TextStyle(fontSize: 16),
              ),
              Text(
                '''We will make readily available to customers information about our policies and practices relating to the management of personal information.''',
                textAlign: TextAlign.justify,
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 16),
              Text(
                '''We are committed to conducting our business in accordance with these principles in order to ensure that the confidentiality of personal information is protected and maintained.''',
                textAlign: TextAlign.justify,
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 16),
              Text(
                '''--''',
                textAlign: TextAlign.justify,
                style: TextStyle(fontSize: 16),
              ),
              Text(
                '''Regards,''',
                textAlign: TextAlign.justify,
                style: TextStyle(fontSize: 16),
              ),
              Text(
                '''Helpalife.in''',
                textAlign: TextAlign.justify,
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
