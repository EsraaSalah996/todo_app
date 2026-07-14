import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:lottie/lottie.dart';
import 'package:todo_app/core/utils/app_constant.dart';
import 'package:todo_app/features/auth/data/models/user_model.dart';
import 'package:todo_app/features/auth/ui/auth_screen.dart';
import 'package:todo_app/features/home/ui/home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => nextRoute()),
      );
    });
  }

  Widget nextRoute() {
    var userData = Hive.box<UserModel>(AppConstant.userBox);
    if (userData.isEmpty) {
      return AuthScreen();
    } else {
      return HomeScreen();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Lottie.asset('assets/icons/splash.json')),
    );
  }
}
