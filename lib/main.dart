import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:helpalife_mobile/onborading_screen/onboarding_screen.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home:OnboardingScreen()
    );
  }
}
