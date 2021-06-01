import 'dart:math';

import 'package:flutter/material.dart';

class RotationPokeballImage extends StatefulWidget {
  final Widget child;

  const RotationPokeballImage({
    Key key,
    this.child,
  }) : super(key: key);

  @override
  _RotationPokeballImageState createState() => _RotationPokeballImageState();
}

class _RotationPokeballImageState extends State<RotationPokeballImage>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation<double> animation;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      duration: Duration(seconds: 5),
      vsync: this,
    )..repeat();

    animation = Tween<double>(begin: 0, end: 2 * pi).animate(controller);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animation,
      child: widget.child,
      builder: (context, child) => Transform.rotate(
        angle: animation.value,
        child: child,
      ),
    );
  }
}
