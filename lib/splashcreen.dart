import 'dart:async';
import 'package:flutter/material.dart';
import 'homescreen.dart';
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    _animationController = AnimationController(
        vsync: this,duration: const Duration(seconds: 3)
    );
    _animationController.forward();
    Timer(const Duration(
        seconds: 4
    ), (){
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) =>  const XyloPhone()),
      );
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        width: screenWidth,
        decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [
                Colors.yellow.withOpacity(.700),
                Colors.red.withOpacity(0.600),
                Colors.blue.withOpacity(0.900),
              ],
              begin: Alignment.topRight,
              end: Alignment.bottomLeft
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ScaleTransition(scale: Tween<double>(begin: 0,end: 1).animate(
                  CurvedAnimation(parent: _animationController, curve: Curves.easeInOut)
              ),child: Image.asset('assets/images/xylophone.jpg',height: 300,),
              ),
              SizedBox(height: 40,),
              ScaleTransition(
                scale: Tween<double>(begin: 0,end: 1).animate(
                    CurvedAnimation(parent: _animationController, curve: Curves.bounceInOut)
                ),
                child: RichText(text: const TextSpan(
                    text: 'XYLO',style: TextStyle(color: Colors.black,fontSize: 50,fontWeight: FontWeight.bold),
                    children: [
                      TextSpan(
                        text: 'PHONE',style: TextStyle(color:Colors.indigo,fontSize: 50,fontWeight: FontWeight.bold),
                      )
                    ]
                ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        color: Colors.transparent,
        height: 20,
        child: const Text('Powered by @chand.com',textAlign: TextAlign.center,),
      ),
    );
  }
}
