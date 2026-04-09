import 'package:flutter/material.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green.shade50,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: .start,
            spacing: 8,

            children: [
              SizedBox(height: 160),
              Text(
                "Get Started With",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              TextFormField(
                decoration: InputDecoration(
                  hintText: "Enter your Email",
                  suffixIcon: Icon(Icons.email),
                ),
              ),
              SizedBox(height: 8),
              TextFormField(
                decoration: InputDecoration(
                  hintText: "Enter your Password",
                  suffixIcon: Icon(Icons.lock),
                ),
              ),
              SizedBox(height: 20,),
              FilledButton(
                style: FilledButton.styleFrom(
                  fixedSize: Size.fromWidth(double.maxFinite),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadiusGeometry.circular(8),
                  ),
                  backgroundColor: Colors.green,
                  foregroundColor: Colors.black,
                ),
                onPressed: () {},
                child: Text("Submit"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
