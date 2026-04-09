import 'package:bazaarhub/ui/screen/sign_in_screen.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Future<void> _moveToNextScreen() async {
    await Future.delayed(Duration(seconds: 2));
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => SignInScreen()),
    );
  }
@override
  void initState() {
    // TODO: implement initState
    super.initState();
    _moveToNextScreen();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Image.asset("assets/images/bazaar.png")),
    );
  }
}
