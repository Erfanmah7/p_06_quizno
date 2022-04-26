import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final Size size;
  final String name;
  final VoidCallback onTapped;
  final double sizeWidth;
  final Color color;

  MyButton(this.size, this.name, this.onTapped, this.sizeWidth, this.color);

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(22.5),
      color: color,
      child: InkWell(
        onTap: onTapped,
        borderRadius: BorderRadius.circular(22.5),
        child: Container(
          height: 50,
          width: size.width * sizeWidth,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(22.5),
          ),
          child: Center(
            child: Text(
              name,
              style: TextStyle(color: Colors.white, fontSize: 20),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}
