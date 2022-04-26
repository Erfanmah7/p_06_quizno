import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:p_06_quizno/screen/scors.dart';
import 'package:p_06_quizno/style.dart';
import 'package:p_06_quizno/widgets/my_alert.dart';
import 'package:p_06_quizno/widgets/my_button.dart';

class Resalut extends StatelessWidget {
  List<int> star;
  final Size size;

  Resalut(this.star, this.size);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) {
            return Scors(star: star,);
          }),);
        },
        child: Icon(Icons.score_sharp),
      ),
      backgroundColor: banafshb,
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: size.height * 0.08,
            ),
            CircleAvatar(
              radius: 60,
              child: CircleAvatar(
                radius: 57,
                backgroundColor: Colors.white,
                child: (star[0] > star[2])
                    ? const Icon(
                        Icons.star,
                        size: 80,
                        color: Colors.blue,
                      )
                    : const Icon(
                        Icons.star_border,
                        size: 80,
                        color: Colors.blueGrey,
                      ),
              ),
            ),
            SizedBox(
              height: size.height * 0.03,
            ),
            Text(
              'You are  a ${(star[0] > star[2]) ? 'Winer' : 'Loser'}',
              style: TextStyle(color: Colors.white, fontSize: 30),
            ),
            SizedBox(
              height: size.height * 0.02,
            ),
            const Spacer(),
            concatination(size, context),
          ],
        ),
      ),
    );
  }

  Widget concatination(Size size, BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(20),
          topLeft: Radius.circular(20),
        ),
        color: abil,
      ),
      width: size.width,
      height: size.height * 0.5,
      child: Center(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: size.height * 0.05,
              ),
              concatination1('winer ${star[0]}', Colors.green, star[0], size),
              concatination1('white ${star[1]}', Colors.white, star[1], size),
              concatination1('loser ${star[2]}', Colors.red, star[2], size),
              SizedBox(
                height: size.height * 0.1,
              ),
              Center(
                child: MyButton(size, 'Finish', () {
                  OnFinished(context);
                }, 0.4, banafshb),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget concatination1(String name, Color color, num, Size size) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      child: Padding(
        padding: const EdgeInsets.all(3.0),
        child: Container(
          height: 40,
          width: size.width * 0.3 + size.width * 0.1 * num,
          child: Center(
            child: Text(name),
          ),
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: banafshb, width: 2),
          ),
        ),
      ),
    );
  }

  void onYes(BuildContext context) {
    Navigator.pop(context);
    Navigator.pop(context);
  }

  void onNo(BuildContext context) {
    if (Platform.isAndroid) {
      SystemNavigator.pop();
    } else if (Platform.isIOS) {
      exit(0);
    } else {
      Navigator.pop(context);
      Navigator.pop(context);
      Navigator.pop(context);
    }
  }

  void OnFinished(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return MyAlert(
            size,
            () {
              onNo(context);
            },
            () {
              onYes(context);
            },
          );
        });
  }

}
