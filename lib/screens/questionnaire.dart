import 'package:flutter/material.dart';
import 'package:gmcmanjeri_flutter/models/person.dart';

class Questionnaire extends StatefulWidget {
  final Person person;
  Questionnaire(this.person);
  @override
  State<StatefulWidget> createState() {
    return QuestionnaireState(person);
  }
}

class QuestionnaireState extends State<Questionnaire> {
  QuestionnaireState(this.person);
  final Person person;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Questionnaire",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.black,
      ),
      body: Padding(
          padding: EdgeInsets.only(top: 0.0),
          child: ListView(
            children: <Widget>[
              Card(
                child: ListTile(
                  leading: CircleAvatar(
                      backgroundColor: Colors.black,
                      child: Text("ID",
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.white))),
                  title: Text(person.id.toString()),
                ),
              ),
              Card(
                  child: ListTile(
                      leading: CircleAvatar(
                        backgroundColor: Colors.black,
                        child: Icon(
                          Icons.person,
                          color: Colors.white,
                        ),
                      ),
                      title: Text(person.name))),
              Card(
                child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Colors.black,
                      child: Icon(Icons.home, color: Colors.white),
                    ),
                    title: Text(person.address)),
              ),
            ],
          )),
    );
  }
}
