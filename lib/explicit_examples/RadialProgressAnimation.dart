import 'package:flutter/material.dart';

class Radialprogressanimation extends StatefulWidget {
  
  final double Progress;
  final Color color;
  
  const Radialprogressanimation({super.key, required this.Progress, required this.color});

  @override
  State<Radialprogressanimation> createState() => _RadialprogressanimationState();
}

class _RadialprogressanimationState extends State<Radialprogressanimation> with SingleTickerProviderStateMixin {

  late AnimationController controller;
  late Animation<double> animation;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller=AnimationController(vsync: this,duration: Duration(milliseconds: 1000));
    animation=Tween(begin: 0.0, end: widget.Progress).animate(controller);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child:AnimatedBuilder(
          animation: animation,
          builder: (context,child) {
            return Stack(
              alignment: Alignment.center,
              children: [
                SizedBox(
                  width: 150,
                  height: 150,
                  child: CircularProgressIndicator(
                    value:animation.value,
                    strokeWidth: 10,
                    backgroundColor: Colors.grey.shade100,
                    color: widget.color,

                  ),
                ),
                Text(
                  '${(animation.value * 100).toInt()}%',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24
                  ),
                )

              ],
            );
          }
        ),
      ),
      floatingActionButton: FloatingActionButton(onPressed: (){
        if(controller.isCompleted)
          {
            controller.reverse();
          }
        else {
          controller.forward();
        }
        },child: Icon(Icons.start),),
    );

  }
}
