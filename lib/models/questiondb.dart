import 'question.dart';

class questiondb{

  List<question> _testlist = [
    question('Lorem ipsum dolor sit amet, consectetur adipiscin?', 'sit', 'ipsum dr', 1),
    question('Lorem ipsum dolor sit amet?', 'sit amet', 'ipsum dolor', 1),
    question('Lorem ipsum dolor sit amet, consectetur ?', 'smet', 'idolor', 2),
    question('Lorem ipsum dolor sit amet, con?', 'sit at', 'ipsur', 1),
    question('Lorem ipsum dolor sit?', 'sit et', 'ips dolor', 2),
    question('Llor?', 'sit t', 'ipdolor', 1),
    question('Lorem ipolor?', 'st t', 'iplr', 1),
    question('Lorem m dolor?', 'sit t', 'iol', 2),
    question('Lorem ipsum dolor?', 'si', 'ilor', 2),
    question('Lo dolor?', 'i t', 'ipdor', 1),
  ];

  int getQuizSizeList() => _testlist.length;

  question getQuestion(int num) => _testlist[num];


}