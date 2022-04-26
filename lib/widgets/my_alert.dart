import 'package:flutter/material.dart';
import 'package:p_06_quizno/widgets/my_button.dart';

class MyAlert extends StatelessWidget {

  final Size size;
  final VoidCallback onNo,onYes;
  MyAlert(this.size,this.onNo,this.onYes);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20),),
      title: Text('datadfshfiuhgf ushgiuhe sgg?'),
      content: Container(
        height: 50,
        child: Center(
          child: Row(
            children: [
              Expanded(
                child: MyButton(size, 'Yes',onYes, 0.1, Colors.green),
              ),
              SizedBox(width: 15,),
              Expanded(
                child: MyButton(size, 'No',onNo, 0.1, Colors.red),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
