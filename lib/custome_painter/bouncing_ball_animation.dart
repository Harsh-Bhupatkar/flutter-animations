import 'package:flutter/material.dart';

class bouncingBallAnimation extends StatefulWidget {
  const bouncingBallAnimation({super.key});

  @override
  State<bouncingBallAnimation> createState() => _bouncingBallAnimationState();
}

class _bouncingBallAnimationState extends State<bouncingBallAnimation> with SingleTickerProviderStateMixin {

  late AnimationController controller;
  late Animation<double> animation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller=AnimationController(vsync: this,duration: Duration(milliseconds: 1000));
    animation = Tween<double>(begin: 0.0, end: 1.0).animate(controller);

    animation.addStatusListener((status){
      if(status==AnimationStatus.completed)
        {
          controller.reverse();
        }
      else if(status==AnimationStatus.dismissed)
        {
          controller.forward();
        }
      } );
    controller.forward();


  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [ 
              AnimatedBuilder(
                animation: animation,
                builder: (context,child) {
                  return CustomPaint(
                    painter: bounceBallPainter(animation.value),
                    size: Size(200, 200),
                  );
                }
              )
            ],
          ))
    );
  }
}

class bounceBallPainter extends CustomPainter
{
  final double animationValue;

  bounceBallPainter(this.animationValue);
  @override
  void paint(Canvas canvas, Size size) {



    // TODO: implement paint
    canvas.drawCircle(Offset(size.width/2, size.height-(size.height*animationValue) ), 20, Paint()..color=Colors.blue );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
   return true;
  }

}
