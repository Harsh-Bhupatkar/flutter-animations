import 'package:animations/explicit_examples/RadialProgressAnimation.dart';
import 'package:animations/explicit_examples/list_animation.dart';
import 'package:animations/implicit_examples/animated_color_pallete.dart';
import 'package:animations/page_router_animations_examples/splash_animations.dart';
import 'package:flutter/material.dart';

import 'custome_painter/bouncing_ball_animation.dart';
import 'explicit_examples/login_animations.dart';
import 'implicit_examples/animated_shopping_cart.dart';
import 'implicit_examples/animated_tween_animation_builder_example.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: bouncingBallAnimation()
    );
  }
}
