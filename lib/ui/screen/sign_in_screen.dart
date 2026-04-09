import 'package:bazaarhub/ui/screen/main_page.dart';
import 'package:flutter/material.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});
  static const String name='/SignInScreen';
  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {

  @override
  TextEditingController emailController =TextEditingController();
  TextEditingController passwordController =TextEditingController();
  final _formkey=GlobalKey<FormState>();
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green.shade50,
      body: Form(
        key: _formkey,
        child: SafeArea(
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
                  controller: emailController,
                  decoration: InputDecoration(
                    hintText: "Enter your Email",
                    suffixIcon: Icon(Icons.email),
                  ),
                  validator: (value){
                    if(value == null || value.isEmpty){
                      return 'please enter your email';
                    }else{
                      return null;
                    }
                  },
                ),
                SizedBox(height: 8),
                TextFormField(
                  controller: passwordController,
                  decoration: InputDecoration(
                    hintText: "Enter your Password",
                    suffixIcon: Icon(Icons.lock),
                  ),
                  validator: (value){
                    if(value == null || value.isEmpty){
                      return "Please enter password";
                    }else if(value.length < 8){
                      return 'password must be at lest 8 characters';
                    }else{
                      return null;
                    }
                  },
        
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
                  onPressed: () {

                    if(_formkey.currentState!.validate()){
                      print(emailController.text);
                      print(passwordController.text);

                      emailController.clear();
                      passwordController.clear();
                    }else{
                      return  _submitButton();
                    }

                  },
                  child: Text("Submit"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
  void _submitButton(){
    Navigator.pushNamed(context, MainPage.name);
  }
}
