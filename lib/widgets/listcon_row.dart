import 'package:flutter/material.dart';
import 'package:p_06_quizno/models/questiondb.dart';
import 'number_container_row.dart';

class ListConRow extends StatelessWidget {
  final int QuizNumber;
  final List listAnswer;

  ListConRow(this.QuizNumber, this.listAnswer);

  questiondb db = questiondb();
  List<Widget> Listwidget = [];

  @override
  Widget build(BuildContext context) {
    Listwidget.clear();
    for (int i = 0; i < db.getQuizSizeList(); i++) {
      Listwidget.add(numberConRow(
        //0-9
          db.getQuizSizeList(), i + 1, QuizNumber, listAnswer));
      //1-10
    }
    return Row(
      children: Listwidget,
    );
  }
}
