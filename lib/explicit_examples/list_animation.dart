import 'package:flutter/material.dart';

class listAnimation extends StatefulWidget {
  const listAnimation({super.key});

  @override
  State<listAnimation> createState() => _listAnimationState();
}

class _listAnimationState extends State<listAnimation> with SingleTickerProviderStateMixin{
  late AnimationController controller;
  late List<Animation<Offset>> scaleAnimation=[];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller=AnimationController(vsync: this,duration: Duration(milliseconds: 5000));
    scaleAnimation = List.generate(
      5,
      (index) => Tween<Offset>(begin: Offset(-1, 0), end: Offset.zero)
          .animate(CurvedAnimation(parent: controller, curve: Interval(index*0.2, 1,curve: Curves.ease ))),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("List Animation"),
      ),
      body: Center(
        child:ListView.builder(
          itemCount: 5,
            itemBuilder: (context, index) {
              return SlideTransition(
                position: scaleAnimation[index],
                child: ListTile(
                  title: Text("Hello Harsh,${index.toString()}"),
                ),
              );
            },),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: (){
            if(controller.isCompleted)
              {
                controller.reverse();
              }
            else{
              controller.forward();
            }

          },child: Icon(Icons.done),),
    );
  }
}
