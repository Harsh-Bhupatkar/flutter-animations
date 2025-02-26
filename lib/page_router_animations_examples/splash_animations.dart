import 'dart:async';

import 'package:flutter/material.dart';

class SplashAnimations extends StatefulWidget {
  const SplashAnimations({super.key});

  @override
  State<SplashAnimations> createState() => _SplashAnimationsState();
}

class _SplashAnimationsState extends State<SplashAnimations> with SingleTickerProviderStateMixin {

  late AnimationController controller;
  late Animation<double> animation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = AnimationController(vsync: this, duration: Duration(milliseconds: 500));
    animation = Tween<double>(begin: 1,end: 10).animate(controller);

    controller.addListener(() {
      if(controller.isCompleted)
        {
          Navigator.of(context).push(
            PageRouteBuilder(pageBuilder: (context, animation, secondaryAnimation) {
              return Destination();
            },
            transitionsBuilder: (context, animation, secondaryAnimation, child) {
              return FadeTransition(opacity: animation,child: child,);
            },
              transitionDuration: Duration(milliseconds: 800)
            ),
          );
          
          
          Timer(Duration(milliseconds: 500), controller.reset);
        }

    },);

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GestureDetector(
          onTap: () => controller.forward(),

          child: ScaleTransition(
            scale: animation,
            child: Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.blue
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class Destination extends StatelessWidget {
  const Destination({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
        title: Text("Go Back"),
      ),
    );
  }
}

