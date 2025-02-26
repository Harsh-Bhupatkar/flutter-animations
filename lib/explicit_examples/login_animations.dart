import 'dart:math';

import 'package:flutter/material.dart';

class LoginScreenAnimation extends StatefulWidget {
  const LoginScreenAnimation({super.key});

  @override
  State<LoginScreenAnimation> createState() => _LoginScreenAnimationState();
}

class _LoginScreenAnimationState extends State<LoginScreenAnimation> with SingleTickerProviderStateMixin {

  late AnimationController animationController;
  late Animation<double> logoFadeAnimation;
  late Animation<Offset> sliderAnimation;
  late Animation<double> scaleAnimation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    animationController=AnimationController(
        vsync: this,
      duration: Duration(milliseconds: 1500)
    );
    logoFadeAnimation=Tween<double>(begin: 0,end: 1).animate(animationController);
    sliderAnimation=Tween<Offset>(begin: Offset(-1, -1),end: Offset.zero).animate(CurvedAnimation(parent: animationController, curve: Curves.easeIn));
    scaleAnimation=Tween<double>(begin: 0,end: 1).animate(animationController);
    animationController.forward();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login Screen Animation"),
      ),
      body: Center(
        child:Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FadeTransition(
              opacity: logoFadeAnimation,
              child: FlutterLogo(
                size: 100,
              ),
            ),
            Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
              child:  SlideTransition(
                position: sliderAnimation,
                child: ScaleTransition(
                  scale: scaleAnimation,
                  child: Column(
                    children: [
                      const TextField(
                        decoration: InputDecoration(
                          labelText: 'Username',
                        ),
                      ),
                      const SizedBox(height: 16.0),
                      const TextField(
                        decoration: InputDecoration(
                          labelText: 'Password',
                        ),
                        obscureText: true,
                      ),
                      const SizedBox(height: 16.0),
                      ElevatedButton(
                        onPressed: () {},
                        child: const Text('Login'),
                      ),
                    ],
                  ),
                ),
              ),

            )
          ],
        ),
      ),
    );
  }
}
