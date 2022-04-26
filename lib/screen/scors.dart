import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Scors extends StatelessWidget {
  List<int> star;
  List<String> ListAnswer = [];
  Scors({required this.star});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: FutureBuilder(
        future: loaddata(),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.hasData &&
              snapshot.connectionState == ConnectionState.done) {
            return ListView.builder(
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  child: ListTile(
                    title: Text(ListAnswer[index]),
                  ),
                );
              },itemCount: ListAnswer.length,
            );
          } else {
            return Center(child: CircularProgressIndicator(),);
          }
        },
      ),
    );
  }

  Future<List<String>> loaddata() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    //dddd
    ListAnswer = pref.getStringList('res') ?? [];
    //dddd
    ListAnswer.add('{winer: ${star[0]} ,white: ${star[1]} , loser: ${star[2]}}');
    await pref.setStringList('res', ListAnswer);
    //pref.clear();
    return ListAnswer;
  }
}
