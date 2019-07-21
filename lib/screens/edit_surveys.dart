import 'package:flutter/cupertino.dart' as prefix1;
import 'package:flutter/material.dart';
import 'package:flutter/material.dart' as prefix0;
import 'package:gmcmanjeri_flutter/models/person.dart';
import 'package:gmcmanjeri_flutter/utils/personhelper.dart';
import 'package:sqflite/sqflite.dart';

class EditSurvey extends StatefulWidget {
  static const String routeName = "/edit_surveys";

  @override
  State<StatefulWidget> createState() {
    return EditSurveyState();
  }
}

class EditSurveyState extends State<EditSurvey> {
  int count = 0;
  Color deleteButton = Colors.grey;
  List<Person> personList; //= new List<Person>();
  PersonHelper personHelper = PersonHelper(); 

  // @override
  // void initState() {
  //   deleteButton = Colors.grey;
  //   personList.add(new Person());
  //   personList[0].updateDetailsofFirstPage(1, "Asd", "asdm", "9442123423", "dfs", "student", "logic");
  //   personList.add(new Person());
  //   personList[1].updateDetailsofFirstPage(2, "Sdf", "Trm", "9442123423", "hxc", "student", "logic");
  //   personList.add(new Person());
  //   personList[2].updateDetailsofFirstPage(3, "Dsw", "Tsdm", "9442123423", "we", "student", "logic");
  //   personList.add(new Person());
  //   personList[3].updateDetailsofFirstPage(4, "Gds", "Tdrasfm", "9442123423", "as", "student", "logic");
  //   personList.add(new Person());
  //   personList[4].updateDetailsofFirstPage(5, "Asdds", "Tam", "9442123423", "fd", "student", "logic");
  //   personList.add(new Person());
  //   personList[5].updateDetailsofFirstPage(6, "Sfer", "Trsdf", "9442123423", "we", "student", "logic");
  //   personList.add(new Person());
  //   personList[6].updateDetailsofFirstPage(7, "Qwds", "asd", "9442123423", "du", "student", "logic");
  //   personList.add(new Person());
  //   personList[7].updateDetailsofFirstPage(8, "Hae", "asf", "9442123423", "hf", "student", "logic");
  //   personList.add(new Person());
  //   personList[8].updateDetailsofFirstPage(9, "Lia", "SADf", "9442123423", "as", "student", "logic");
  // }

  @override
  Widget build(BuildContext context) {

    if(personList == null)
    {
      personList = List<Person>();
      updateListView();
    }
    return Scaffold(
      appBar: AppBar(
        title: Text('Surveys'),
      ),
      body:getSurveyListView(),
      );

  }

  ListView getSurveyListView() {
    TextStyle titleStyle = Theme.of(context).textTheme.subhead;

    return ListView.builder(
      scrollDirection: Axis.vertical,
      itemCount: personList.length,
      itemBuilder: (BuildContext context, int position) {
        return Card(
          color: Colors.white,
          elevation: 2.0,
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.blue,
              child: Icon(Icons.keyboard_arrow_right),
            ),
            title: Text(
              personList[position].name,
              style: titleStyle,
            ),
            subtitle: Text(personList[position].id.toString()),
            trailing: IconButton(
              color: Colors.grey,
              icon: Icon(
                Icons.delete,
              ),
              onPressed: () {
                setState(() {
                  debugPrint("Delete Pressed");
                  _delete(context, personList[position]);
                  }
                ); 

              },
            ),
            onTap: () {
              debugPrint("ListTile Tapped");
            },
          ),
        );
      },
    );
  }

  void updateListView()
  {
    final Future<Database> dbFuture = personHelper.initializeDatabase();
    dbFuture.then((database)
    {
      Future<List<Person>> personListFuture = personHelper.getPersonList();
      personListFuture.then((personList) {
        setState(() {
          this.personList = personList;
        });
      });
    });
  }

  void _showSnackBar(BuildContext context, String message) {

		final snackBar = SnackBar(content: Text(message));
		Scaffold.of(context).showSnackBar(snackBar);
}

void _delete(BuildContext context, Person person) async {

                  int result = await personHelper.deletePerson(person);
		if (result != 0) {
			_showSnackBar(context, 'Note Deleted Successfully');
    }
    else 
      debugPrint("not deleted");
			updateListView();
}

}
