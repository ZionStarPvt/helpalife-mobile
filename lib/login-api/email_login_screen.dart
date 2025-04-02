import 'package:flutter/material.dart';
import 'package:helpalife_mobile/pages/otp_screen.dart';
class EmailLogin extends StatefulWidget {
  const EmailLogin({super.key});

  @override
  _EmailLoginState createState() => _EmailLoginState();
}

class _EmailLoginState extends State<EmailLogin> {
  final TextEditingController _emailController = TextEditingController();
  String? _emailError;
  bool _isEmailValid = false;

  void _validateEmail(String value) {
    if (value.isEmpty) {
      setState(() {
        _emailError = "Email is required";
        _isEmailValid = false;
      });
    } else if (!RegExp(
      r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$',
    ).hasMatch(value)) {
      setState(() {
        _emailError = "Invalid email address";
        _isEmailValid = false;
      });
    } else {
      setState(() {
        _emailError = null;
        _isEmailValid = true;
      });
    }
  }

  void _navigateToOtpScreen() {
    if (_isEmailValid) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => OtpScreen(contactInfo: _emailController.text),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Email Login')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(),
            TextFormField(
              controller: _emailController,
              decoration: InputDecoration(
                hintText: "Email",
                border: const OutlineInputBorder(),
                contentPadding: const EdgeInsets.symmetric(horizontal: 15),
                errorText: _emailError,
              ),
              keyboardType: TextInputType.emailAddress,
              onChanged: _validateEmail,
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: _isEmailValid ? _navigateToOtpScreen : null,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.redAccent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text(
                  "Continue",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            const Spacer(flex: 2),
          ],
        ),
      ),
    );
  }
}
