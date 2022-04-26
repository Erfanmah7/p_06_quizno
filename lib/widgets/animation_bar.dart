import 'package:flutter/material.dart';
import 'package:p_06_quizno/style.dart';

class AnimationBar extends StatelessWidget {
  final Size size;
  final double value;

  AnimationBar(this.size, this.value);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 45,
        width: size.width * 0.8,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(22.5),
          border: Border.all(
            color: abig,
            width: 4,
          ),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(22.5),
          child: LinearProgressIndicator(
            value: value,
            backgroundColor: banafshb,
            valueColor: AlwaysStoppedAnimation(sorati),
          ),
        ),
      ),
    );
  }
}
