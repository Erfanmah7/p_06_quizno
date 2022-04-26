import 'package:flutter/material.dart';
import 'package:p_06_quizno/style.dart';
import 'package:p_06_quizno/models/questiondb.dart';
import 'package:p_06_quizno/screen/resalut.dart';
import 'package:p_06_quizno/widgets/animation_bar.dart';
import 'package:p_06_quizno/widgets/answer.dart';
import 'package:p_06_quizno/widgets/listcon_row.dart';
import 'package:p_06_quizno/widgets/my_button.dart';

class quiz extends StatefulWidget {
  @override
  State<quiz> createState() => _quizState();
}

class _quizState extends State<quiz> with SingleTickerProviderStateMixin {
  late Size size;

  int QuizNumber = 0;
  bool isOnPreesd = true;
  List listAnswer = [];
  late AnimationController controller;
  late Animation<double> animation;
  ScrollController scrollController = ScrollController();
  questiondb db = questiondb();

  @override

  void initState() {
    super.initState();
    for (int i = 0; i < db.getQuizSizeList(); i++) {
      listAnswer.add(0);
    }
    controller =
        AnimationController(duration: Duration(seconds: 10), vsync: this);
    animation = Tween(begin: 0.0, end: 1.0).animate(controller)
      ..addListener(() {
        setState(() {
          if ((animation.value * 100).round() >= 99) {
            onNext(true);
            if (controller.isAnimating) {
              controller.reset();
              controller.forward();
            }
          }
        });
      });
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: banafshb,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          nextResalut();
        },
        child: Icon(Icons.arrow_forward_ios_sharp),
      ),
      body: SafeArea(
        child: Center(
          child: Container(
            width: size.width * 0.83,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  AnimationBar(size, animation.value),
                  const SizedBox(
                    height: 40,
                  ),
                  SingleChildScrollView(
                    controller: scrollController,
                    scrollDirection: Axis.horizontal,
                    child: ListConRow(QuizNumber, listAnswer),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Divider(
                    color: abig,
                    thickness: 1,
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  Container(
                    height: 110,
                    child: Text(
                      db.getQuestion(QuizNumber).quiz,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          color: abil,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  //isOnpressd == True  یعنی روی گزینه 1 کلیک شده
                  Answer(size, (isOnPreesd) ? abi : Colors.white,
                      db.getQuestion(QuizNumber).answer2, () {
                    OnPressd(1);
                  }),
                  const SizedBox(
                    height: 20,
                  ),
                  //isOnpressd == False  یعنی روی گزینه 2 کلیک شده
                  Answer(size, (!isOnPreesd) ? abi : Colors.white,
                      db.getQuestion(QuizNumber).answer2, () {
                    OnPressd(2);
                  }),
                  const SizedBox(
                    height: 50,
                  ),
                  MyButton(size, 'Next', () {
                    controller.reset();
                    onNext(false);
                    controller.forward();
                  }, 0.3, abi),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  //کدام گزینه کلیک کرد آیا جوابش درست بود یا خیر
  void ClickRightAnswer() {
    int check = (isOnPreesd) ? 1 : 2;
    //سوال چندم جواب چندم؟
    bool status = db.getQuestion(QuizNumber).isRight(check);
    //لیست پر از true و false
    listAnswer[QuizNumber] = status;
  }

  List<int> Validation() {
    int yes = 0;
    int why = 0;
    int no = 0;

    //شمارش درست و غلط و جواب نداده ها
    //پیمایش میکند each در listAnswer
    for (var each in listAnswer) {
      if (each == true) {
        yes++;
      } else if (each == false) {
        no++;
      } else {
        why++;
      }
    }
    return [yes, why, no];
  }

  void Reseter() {
    setState(() {
      QuizNumber = 0;
      //خالی شو
      listAnswer.clear();
      isOnPreesd = true;
      for (int i = 0; i < db.getQuizSizeList(); i++) {
        //حالا پر از صفر شو
        listAnswer.add(0);
      }
      controller.forward();
      //اسکرول خوردن خودکار بر اساس شمارش سوالات
      scrollController.animateTo(QuizNumber * 50.0,
          duration: Duration(milliseconds: 500), curve: Curves.ease);
    });
  }

  void onNext(bool isTime) {
    setState(() {
      //اسکرول خوردن خودکار بر اساس شمارش سوالات
      scrollController.animateTo(QuizNumber * 50.0,
          duration: Duration(milliseconds: 500), curve: Curves.ease);

      if (isTime == true) {
        //اگر تایمر گذشت و جواب نداد
        listAnswer[QuizNumber] = false;
      }
      //اگر جواب داد
      else {
        ClickRightAnswer();
      }
      //به آخرین سوال که رسیدی
      if (db.getQuizSizeList()  == QuizNumber + 1) {
        //برو به صفحه نتایج
        nextResalut();
        // controller.reset();
        // controller.dispose();
      }
      //اگر هنوز به سوال نرسیدی
      else {
        //0-9
        QuizNumber++;
      }
    });
  }

  void nextResalut() async {
    controller.reset();

    List<int> Validat = Validation();
    // وقتی برگشتی
    final feuture = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) {
        return Resalut(Validat, size);
      }),
    );
    // اینکارم انجام بده
    Reseter();
  }

  //اگه false شد آبی شود
  //(!isOnPreesd) ? abi : Colors.white
  //اگه true بود آبی شود
  // (isOnPreesd) ? abi : Colors.white
  void OnPressd(int nub) {
    setState(() {
      //اگر روی گزینه 1 کلیک شد true بشه
      if (nub == 1) {
        //آبی شود
        isOnPreesd = true;
      }
      //اگر روی گزینه 2 کلیک شد false بشه
      else if (nub == 2) {
        //آبی شود
        isOnPreesd = false;
      } else {}
    });
  }
}