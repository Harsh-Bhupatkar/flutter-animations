import 'package:flutter/material.dart';

class PulsatingCircleAnimation extends StatelessWidget {
   PulsatingCircleAnimation({super.key});
  double size = 200;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Pulsating Circle Animation"),
      ),
      body: Center(
        child: TweenAnimationBuilder(
          duration: Duration(milliseconds: 1500),
          tween: Tween<double>(begin: 0,end: 200),
          builder: (context,size,widget) {
            return Container(
              height: size,
              width: size,
              decoration: BoxDecoration(
                color: Colors.blue,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.blue.withOpacity(0.5),
                    spreadRadius: size/2,
                    blurRadius: size
                  )
                ]
              ),
            );
          }
        ),
      ),
    );
  }
}
