import 'package:flutter/material.dart';
import 'package:p_06_quizno/style.dart';

class Answer extends StatelessWidget {
  //const ansower({Key? key}) : super(key: key);

  final Size size;
  final Color color;
  final String ans;
  final VoidCallback Onpressd ;
  Answer(this.size,this.color,this.ans,this.Onpressd);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap:  Onpressd,

      splashColor: abib,
      borderRadius: BorderRadius.circular(23),
      child: Container(
        // height: 55,
        width: size.width * 0.8,
        padding:
        const EdgeInsets.only(left: 20, right: 10, top: 10, bottom: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(23),
          border: Border.all(
            color: abib,
            width: 4,
          ),
        ),
        child: Center(
          child: Row(
            children: [
              Expanded(
                child: Text(
                  '$ans',
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),

              Icon(
                Icons.check_circle_outlined,
                color: color,
                size: 27,
              ),
            ],
          ),
        ),
      ),
    );
  }
}