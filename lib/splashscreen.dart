import 'package:flutter/material.dart';
import 'package:laundry_load_planner/homepage.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    //2 Second Timer and navigate to home page
    Future.delayed(const Duration(seconds: 2),(){
      Navigator.pushReplacement(context,
        MaterialPageRoute(builder: (context) => const LaundryLoadPlanner()
      ));
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient( //Make the background became linear gradient colors
            colors: [
              const Color.fromARGB(255, 116, 188, 248),//Most left
              Colors.blueAccent,//Most right
            ],
          ),
        ),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.fromLTRB(0, 150, 0, 0), //Padding top, used this because have using Spacer()
              child: Image.asset('assets/laundry_splashscreenbg.png'),
            ),
            SizedBox(height: 50),
            Text(
              'SPINPRO',
              style: TextStyle(
                fontSize: 48,
                fontWeight: FontWeight.w800,
                height: 1,
                color: Colors.white70,
                letterSpacing: 2,
              ),
            ),
            Text(
              'PLAN SMART • WASH SMART',
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                height: 0.5,
                color: const Color.fromARGB(255, 16, 41, 85),
                letterSpacing: 1.5,
              ),
            ),
            Spacer(), //Push the widget to most below
            SizedBox(
              height: 4, 
              width: 300, 
              child: LinearProgressIndicator(color: Colors.blueAccent,)),
            SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}
