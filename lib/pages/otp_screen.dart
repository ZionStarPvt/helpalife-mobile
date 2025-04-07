import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:helpalife_mobile/home_screen/home_page.dart';
import '../constants.dart';
import 'package:get/get.dart';

class OtpScreen extends StatefulWidget {
  final String contactInfo;

  const OtpScreen({super.key, required this.contactInfo});

  @override
  _OtpScreenState createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  String otpCode = "";
  String _errorMessage = '';
  bool _isLoading = false;

  void _verifyOtp() async {
    setState(() {
      _isLoading = true;
      _errorMessage = '';
    });

    await Future.delayed(Duration(seconds: 2));

    if (otpCode == '123456') {
      setState(() {
        _isLoading = false;
      });
      Navigator.pushReplacementNamed(context, '/home');
    } else {
      setState(() {
        _isLoading = false;
        _errorMessage = 'Invalid OTP. Please try again.';
      });
      Get.to(HomePage());
    }
  }

  void _resendOtp() {
    print('Resending OTP...');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Verify OTP')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            OtpTextField(
              numberOfFields: 6,
              borderColor: Colors.purple,
              showFieldAsBox: true,
              onCodeChanged: (String code) {},

              onSubmit: (String verificationCode) {
                otpCode = verificationCode;
              }, // end onSubmit
            ),
            if (_errorMessage.isNotEmpty)
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Text(_errorMessage, style: TextStyle(color: Colors.red)),
              ),
            SizedBox(height: 16),
            if (_isLoading)
              loadingAnimation(50)
            else
              ElevatedButton(onPressed: _verifyOtp, child: Text('Verify')),
            SizedBox(height: 8),
            TextButton(onPressed: _resendOtp, child: Text('Resend OTP')),
          ],
        ),
      ),
    );
  }
}
