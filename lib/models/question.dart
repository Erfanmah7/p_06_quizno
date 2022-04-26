// ignore_for_file: file_names
class question {
  question(this._quiz, this._answer1, this._answer2, this._trueAnswer);

  String _quiz;
  String _answer1;
  String _answer2;
  int _trueAnswer;

  String get quiz => _quiz;

  String get answer1 => _answer1;

  String get answer2 => _answer2;

  int get trueAnswer => _trueAnswer;

  bool isRight(int number) {
    //جواب گزینه 1 یود
    if (_trueAnswer == 1) {
      //گزینه 1 انتخاب شد
      if (number == 1) return true;
      return false;
    }
    //اگر جواب گزینه 2 بود
    else {
      //گزینه 2 انتخاب شد
      if (number == 2) return true;
      return false;
    }
  }
}
