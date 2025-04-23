import 'package:flutter/material.dart';
class TermsOfServicePage extends StatelessWidget {
  const TermsOfServicePage({super.key});

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
                'Web Site Terms and Conditions of Use',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 24),
              Text(
                '1. Terms',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              SizedBox(height: 8),
              Text(
                'By accessing this web site, you are agreeing to be bound by these web site Terms and Conditions of Use, all applicable laws and regulations, and agree that you are responsible for compliance with any applicable local laws. If you do not agree with any of these terms, you are prohibited from using or accessing this site. The materials contained in this web site are protected by applicable copyright and trade mark law.',
                textAlign: TextAlign.justify,
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 16),
              Text(
                '2. Use License',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              SizedBox(height: 8),
              Text(
                '''Permission is granted to temporarily download one copy of the materials (information or software) on Helpalife.in's web site for personal, non-commercial transitory viewing only. This is the grant of a license, not a transfer of title, and under this license you may not:
- modify or copy the materials;
- use the materials for any commercial purpose, or for any public display (commercial or non-commercial);
- attempt to decompile or reverse engineer any software contained on Helpalife.in's web site;
- remove any copyright or other proprietary notations from the materials; or
- transfer the materials to another person or "mirror" the materials on any other server.

This license shall automatically terminate if you violate any of these restrictions and may be terminated by Helpalife.in at any time. Upon terminating your viewing of these materials or upon the termination of this license, you must destroy any downloaded materials in your possession whether in electronic or printed format.''',
                textAlign: TextAlign.justify,
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 16),
              Text(
                '3. Disclaimer',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              SizedBox(height: 8),
              Text(
                '''The materials on Helpalife.in's web site are provided "as is". Helpalife.in makes no warranties, expressed or implied, and hereby disclaims and negates all other warranties, including without limitation, implied warranties or conditions of merchantability, fitness for a particular purpose, or non-infringement of intellectual property or other violation of rights. Further, Helpalife.in does not warrant or make any representations concerning the accuracy, likely results, or reliability of the use of the materials on its Internet web site or otherwise relating to such materials or on any sites linked to this site.''',
                textAlign: TextAlign.justify,
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 16),
              Text(
                '4. Limitations',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              SizedBox(height: 8),
              Text(
                '''In no event shall Helpalife.in or its suppliers be liable for any damages (including, without limitation, damages for loss of data or profit, or due to business interruption,) arising out of the use or inability to use the materials on Helpalife.in's Internet site, even if Helpalife.in or a Helpalife.in authorized representative has been notified orally or in writing of the possibility of such damage. Because some jurisdictions do not allow limitations on implied warranties, or limitations of liability for consequential or incidental damages, these limitations may not apply to you.''',
                textAlign: TextAlign.justify,
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 16),
              Text(
                '5. Revisions and Errata',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              SizedBox(height: 8),
              Text(
                '''The materials appearing on Helpalife.in's web site could include technical, typographical, or photographic errors. Helpalife.in does not warrant that any of the materials on its web site are accurate, complete, or current. Helpalife.in may make changes to the materials contained on its web site at any time without notice. Helpalife.in does not, however, make any commitment to update the materials.''',
                textAlign: TextAlign.justify,
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 16),
              Text(
                '6. Links',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              SizedBox(height: 8),
              Text(
                '''Helpalife.in has not reviewed all of the sites linked to its Internet web site and is not responsible for the contents of any such linked site. The inclusion of any link does not imply endorsement by Helpalife.in of the site. Use of any such linked web site is at the user's own risk.''',
                textAlign: TextAlign.justify,
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 16),
              Text(
                '7. Site Terms of Use Modifications',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              SizedBox(height: 8),
              Text(
                '''Helpalife.in may revise these terms of use for its web site at any time without notice. By using this web site you are agreeing to be bound by the then current version of these Terms and Conditions of Use.''',
                textAlign: TextAlign.justify,
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 16),
              Text(
                '8. Governing Law',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              SizedBox(height: 8),
              Text(
                '''Helpalife.in may revise these terms of use for its web site at any time without notice. By using this web site you are agreeing to be bound by the then current version of these Terms and Conditions of Use.''',
                textAlign: TextAlign.justify,
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}
