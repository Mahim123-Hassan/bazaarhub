import 'package:bazaarhub/ui/screen/main_page.dart';
import 'package:bazaarhub/ui/screen/sign_in_screen.dart';
import 'package:bazaarhub/ui/screen/splash_screen.dart';
import 'package:flutter/material.dart';
class BazaarHub extends StatelessWidget {
  const BazaarHub({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        inputDecorationTheme: InputDecorationTheme(

          filled: true,
          hintStyle: TextStyle(
            fontWeight: FontWeight.w400,
            color: Colors.grey,

          ),
          contentPadding: EdgeInsets.symmetric(horizontal: 16),
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(8),
          ),
          enabledBorder:  OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(8),
          ),
          focusedBorder:  OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(8),
          ),
          errorBorder:  OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(8),
          ),
          disabledBorder:  OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(8),
          ),

        ),
      ),
      routes: <String,WidgetBuilder>{
        SplashScreen.name:(_)=>SplashScreen(),
        SignInScreen.name:(_)=>SignInScreen(),
        MainPage.name:(_)=> MainPage()
      },
      home: SplashScreen(),

    );
  }
}
