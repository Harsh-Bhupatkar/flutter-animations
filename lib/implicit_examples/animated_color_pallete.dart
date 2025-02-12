import 'dart:math';

import 'package:flutter/material.dart';

class AnimatedColorPallete extends StatefulWidget {
  const AnimatedColorPallete({super.key});

  @override
  State<AnimatedColorPallete> createState() => _AnimatedColorPalleteState();
}

class _AnimatedColorPalleteState extends State<AnimatedColorPallete> {

  List<Color> currentPalette=generateRandomPalette();

  static List<Color> generateRandomPalette(){
    final random=Random();
    return List.generate(5, (index) => Color.fromRGBO(
      random.nextInt(256),
      random.nextInt(256),
      random.nextInt(256),
      1,
    ),);
  }

  void regeneratePalette(){
    setState(() {
      currentPalette=generateRandomPalette();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Color Palette Generator"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            for(Color color in currentPalette)
              AnimatedContainer(
                duration: Duration(milliseconds: 2000),
                curve: Curves.easeInBack,
                width: 100,
                height: 100,
                color: color,
                margin: EdgeInsets.all(8),
              ),
            ElevatedButton(onPressed: regeneratePalette, child:Text("Generate new Palette"))
          ],
        ),
      ),
    );
  }
}
