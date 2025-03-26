import 'package:flutter/material.dart';

const Color darkGrayText = Color(0xFF4A4A4A);

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _phoneNumberController = TextEditingController();
  String? _phoneNumberError;

  void _validatePhoneNumber(String value) {
    if (value.isEmpty) {
      setState(() {
        _phoneNumberError = "Phone number is required";
      });
    } else if (!RegExp(r'^[0-9]{10}$').hasMatch(value)) {
      setState(() {
        _phoneNumberError = "Invalid phone number";
      });
    } else {
      setState(() {
        _phoneNumberError = null;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 70.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                alignment: Alignment.centerLeft,
                child: const Text(
                  "Log in or sign up",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: _phoneNumberController,
                keyboardType: TextInputType.phone,
                onChanged: _validatePhoneNumber,
                decoration: InputDecoration(
                  hintText: "Phone number",
                  prefixText: "+1 ",
                  prefixStyle: const TextStyle(color: Colors.black),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: const BorderSide(color: Colors.grey),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: const BorderSide(color: Colors.grey),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: const BorderSide(color: Colors.grey, width: 2),
                  ),
                  errorText: _phoneNumberError,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                "We’ll call or text you to confirm your number. Standard message and data rates apply.",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 12, color: Colors.grey),
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed:
                      _phoneNumberError == null &&
                              _phoneNumberController.text.isNotEmpty
                          ? () {
                            // Logic for continue with phone number
                            print(
                              "Continue with phone number: ${_phoneNumberController.text}",
                            );
                          }
                          : null,
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
              const SizedBox(height: 10),
              const Text("or", style: TextStyle(color: Colors.grey)),
              const SizedBox(height: 10),
              _buildSocialButton(
                context,
                "Continue with Email",
                Icons.email,
                Colors.grey,
                darkGrayText,
                () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const EmailPasswordLogin(),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSocialButton(
    BuildContext context,
    String text,
    IconData icon,
    Color iconColor,
    Color textColor,
    VoidCallback onPressed,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: SizedBox(
        width: double.infinity,
        height: 50,
        child: OutlinedButton(
          onPressed: onPressed,
          style: OutlinedButton.styleFrom(
            foregroundColor: textColor,
            side: const BorderSide(color: Colors.black),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 16),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Icon(icon, color: iconColor),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  text,
                  textAlign: TextAlign.center,
                  style: TextStyle(color: textColor),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class EmailPasswordLogin extends StatefulWidget {
  const EmailPasswordLogin({super.key});

  @override
  _EmailPasswordLoginState createState() => _EmailPasswordLoginState();
}

class _EmailPasswordLoginState extends State<EmailPasswordLogin> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  String? _emailError;

  void _validateEmail(String value) {
    if (value.isEmpty) {
      setState(() {
        _emailError = "Email is required";
      });
    } else if (!RegExp(
      r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$',
    ).hasMatch(value)) {
      setState(() {
        _emailError = "Invalid email address";
      });
    } else {
      setState(() {
        _emailError = null;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Email/Password Login')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
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
            const SizedBox(height: 10),
            TextFormField(
              controller: _passwordController,
              decoration: const InputDecoration(
                hintText: "Password",
                border: OutlineInputBorder(),
                contentPadding: EdgeInsets.symmetric(horizontal: 15),
              ),
              obscureText: true,
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed:
                    _emailError == null && _emailController.text.isNotEmpty
                        ? () {
                          // Logic for login with email and password.
                          print(
                            "Email: ${_emailController.text}, Password: ${_passwordController.text}",
                          );
                        }
                        : null,
                style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                child: const Text(
                  "Log In",
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
            ),
            const SizedBox(height: 10),
            GestureDetector(
              onTap: () {},
              child: const Text(
                "Forgot Password?",
                style: TextStyle(color: Colors.blue, fontSize: 14),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
