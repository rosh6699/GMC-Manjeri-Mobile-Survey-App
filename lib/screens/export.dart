import 'package:flutter/material.dart';
import 'package:csv/csv.dart';
import 'package:simple_permissions/simple_permissions.dart';
import 'package:path_provider/path_provider.dart';
import 'package:gmcmanjeri_flutter/models/person.dart';
import 'dart:io';
import 'package:gmcmanjeri_flutter/utils/personhelper.dart';
import 'package:sqflite/sqflite.dart';

var file;

class Export extends StatefulWidget {
  static const String routeName = "/export";

  @override
  State<StatefulWidget> createState() {
    return ExportState();
  }
}

class ExportState extends State {
  List<Person> personList;
  PersonHelper personHelper = PersonHelper();



  static const String routeName = "/export";
  bool checkPermission = false;


  @override
  void initState() {
    checkPermission = false;

    //Obtain a list of Persons from the database and replace the below section

/*
    personList.add(new Person());
    personList[0].updateDetailsofFirstPage(
        1, "Asd", "asdm", "9442123423", "dfs", "student", "logic");
    personList.add(new Person());
    personList[1].updateDetailsofFirstPage(
        2, "Sdf", "Trm", "9442123423", "hxc", "student", "logic");
    personList.add(new Person());
    personList[2].updateDetailsofFirstPage(
        3, "Dsw", "Tsdm", "9442123423", "we", "student", "logic");
    personList.add(new Person());
    personList[3].updateDetailsofFirstPage(
        4, "Gds", "Tdrasfm", "9442123423", "as", "student", "logic");
    personList.add(new Person());
    personList[4].updateDetailsofFirstPage(
        5, "Asdds", "Tam", "9442123423", "fd", "student", "logic");
    personList.add(new Person());
    personList[5].updateDetailsofFirstPage(
        6, "Sfer", "Trsdf", "9442123423", "we", "student", "logic");
    personList.add(new Person());
    personList[6].updateDetailsofFirstPage(
        7, "Qwds", "asd", "9442123423", "du", "student", "logic");
    personList.add(new Person());
    personList[7].updateDetailsofFirstPage(
        8, "Hae", "asf", "9442123423", "hf", "student", "logic");
    personList.add(new Person());
    personList[8].updateDetailsofFirstPage(
        9, "Lia", "SADf", "9442123423", "as", "student", "logic");
*/

    getPermission();
  }


  @override
  Widget build(BuildContext context) {

    if(personList == null)
    {
      personList = List<Person>();
      updateListView();
    }

    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Export to SpreadSheet"),
      ),
      body: Builder(
          builder: (context) => Center(
                child: RaisedButton(
                  onPressed: () => export(context),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text("Export"),
                  ),
                  color: Colors.black,
                  textColor: Colors.white,
                ),
              )),
    );
  }

  // CHECKING THE PERMISSIONS
  getPermission() async {
    PermissionStatus permissionStatus =
        await SimplePermissions.requestPermission(
            Permission.WriteExternalStorage);

    if (permissionStatus == PermissionStatus.authorized) {
      setState(() {
        checkPermission = true;
      });
    }
  }


  void export(BuildContext context) async {

    List<List<dynamic>> rows = List<List<dynamic>>();
    List<dynamic> headRow = List();
    headRow.add("ID");
    headRow.add("Name");
    headRow.add("Address");
    headRow.add("Phone Number");
    headRow.add("Religion");
    headRow.add("Occupation");
    headRow.add("Education");
    headRow.add("Diabetes");
    headRow.add("Gender");
    headRow.add("Smoker");
    headRow.add("Age");
    headRow.add("SBP");
    headRow.add("DBP");
    headRow.add("Cholestrol");
    headRow.add("AHTT");
    headRow.add("Months of AHTT");
    headRow.add("Menopause");
    headRow.add("Premature Menopause");
    headRow.add("History of CAD");
    headRow.add("Height");
    headRow.add("Weight");
    headRow.add("Waist Circumference");
    headRow.add("Hip Circumference");


    rows.add(headRow);

    for (int i = 0; i < personList.length; i++) {
      List<dynamic> row = List();
      row.add(personList[i].id);
      row.add(personList[i].name);
      row.add(personList[i].address);
      row.add(personList[i].phoneno);
      row.add(personList[i].religion);
      row.add(personList[i].occupation);
      row.add(personList[i].education);
      row.add(personList[i].diabetes);


      switch(personList[i].gender)
      {
        case 0: row.add("Male");
          break;
        case 1: row.add("Female");
        break;
        case 2: row.add("Transgender");
        break;
      }

      row.add(personList[i].smoker);
      row.add(personList[i].age);
      row.add(personList[i].sbp);
      row.add(personList[i].dbp);
      row.add(personList[i].cholestrol);
      row.add(personList[i].isAHTT);
      row.add(personList[i].ahttMonths);
      row.add(personList[i].isMenopause);
      row.add(personList[i].isPrematureMenopause);
      row.add(personList[i].famHistoryOfCADRel);
      row.add(personList[i].height);
      row.add(personList[i].weight);
      row.add(personList[i].waistCirc);
      row.add(personList[i].hipCirc);


      rows.add(row);
    }


    if (checkPermission && personList.length != 0) {
      var now = new DateTime.now();
      String filename = now.year.toString() +
          now.month.toString() +
          now.day.toString() +
          now.hour.toString() +
          now.minute.toString() +
          now.second.toString();

      debugPrint("Permission obtained");

      //PATH TO SAVE THE FILE
      String dir =
          (await getExternalStorageDirectory()).absolute.path + "/Download";
      file = "$dir";

      bool exists = await Directory(dir).exists();

      File f = new File(file + "/" + filename + ".csv");
      debugPrint(f.toString());

      String csv = const ListToCsvConverter().convert(rows);

      if(exists) {
        f.writeAsString(csv);
        Scaffold.of(context).showSnackBar(
            new SnackBar(content: Text("Saved to " + f.toString())));
      }
      else
        {
          debugPrint("Path not found");
        }



    }
    else if(personList.length == 0)
      {
        Scaffold.of(context).showSnackBar(
            new SnackBar(content: Text("Nothing to export!")));
      }

    else {
      debugPrint("permission not obtained");
      Scaffold.of(context).showSnackBar(
          new SnackBar(content: Text("Permission to store data not obtained")));
    }
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


}
