import 'package:flutter/material.dart';
import 'package:p_06_quizno/style.dart';

class numberConRow extends StatelessWidget {
  final int QuizNumber;
  final int QuizSizeList;
  final List listAnswer;
  //1-10
  final int num;

  numberConRow(this.QuizSizeList, this.num, this.QuizNumber, this.listAnswer);

  int temp = 0;
  Color color = Colors.grey;

  @override
  Widget build(BuildContext context) {
    //اگه درست بود سبز غلط بود قرمز نبود قرمز
    //0-9
    temp = num - 1;
    if (temp == QuizNumber) {
      if (temp == QuizSizeList - 1 && listAnswer[temp] != 0) {
        if (listAnswer[temp] == true) {
          color = Colors.green;
        } else {
          color = Colors.red;
        }
      } else {
        color = banafshl;
      }
    } else {
      if (listAnswer[temp] == true) {
        color = Colors.green;
      } else if (listAnswer[temp] == false) {
        color = Colors.red;
      } else {}
    }
    // شکل کانتینر و اعدادش
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 5),
      width: 45,
      height: 45,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: color,
      ),
      child: Center(
        child: Text(
          '$num',
          style: TextStyle(color: Colors.white, fontSize: 20),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
