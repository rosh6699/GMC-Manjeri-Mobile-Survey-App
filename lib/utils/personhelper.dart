
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:gmcmanjeri_flutter/models/person.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class PersonHelper
{
  static PersonHelper personHelper;
  static Database ptable;

  static const PersonTable = 'Person';
  static const id = 'id';
  static const name = 'name';
  static const address = 'address';
  static const phoneno = 'phoneno';
  static const religion = 'religion';
  static const occupation = 'occupation';
  static const education = 'education';
  static const diabetes = 'diabetes';
  static const gender = 'gender';
  static const smoker = 'smoker';
  static const age = 'age';
  static const sbp = 'sbp';
  static const dbp = 'dbp';
  static const cholesterol = 'cholesterol';
  static const isAhtt = 'isAHTT';
  static const ahttmonths = 'ahttMonths';
  static const isMenopause = 'isMenopause';
  static const isPrematureMenopause = 'isPM';
  static const famHistoryOfCADRel = 'isRelCAD';
  static const height = 'height';
  static const weight = 'weight';
  static const waistCirc = 'waist';
  static const hipCirc = 'hip';

  PersonHelper.createInstance();

  factory PersonHelper(){

    if(personHelper == null)
    {
      personHelper = PersonHelper.createInstance();
    }
    return personHelper;
  }

  Future<Database> get database async{
    if(ptable == null)
    {
      ptable = await initializeDatabase();
    }
    return ptable;
  }

  Future<Database> initializeDatabase() async{
    Directory directory = await getApplicationDocumentsDirectory();
    String path = directory.path + 'persons.db';

    var personsDatabase = await openDatabase(path, version: 1, onCreate: createDB);
    return personsDatabase;
  }

  void createDB(Database db, int newVersion) async {
    await db.execute("""CREATE TABLE $PersonTable
     (
       $id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT UNIQUE,
       $name VARCHAR(255) NOT NULL,
       $address TEXT NOT NULL,
       $phoneno TEXT,
       $religion VARCHAR(255),
       $occupation VARCHAR(255),
       $education VARCHAR(255),
       $diabetes INTEGER,
       $gender INTEGER,
       $smoker INTEGER,
       $age INTEGER,
       $sbp INTEGER,
       $dbp INTEGER,
       $cholesterol INTEGER,
       $isAhtt INTEGER,
       $ahttmonths INTEGER,
       $isMenopause INTEGER,
       $isPrematureMenopause INTEGER,
       $famHistoryOfCADRel INTEGER,
       $height INTEGER,
       $weight INTEGER,
       $waistCirc INTEGER,
       $hipCirc INTEGER
     )
     """);
  }

  Future<List<Map<String, dynamic>>> getPersonMapList() async{
    Database db = await this.database;

    var result = await db.query(PersonTable);
    return result;
  }

  Future<List<Person>> getPersonList() async{
    var personMapList = await getPersonMapList();
    int count = personMapList.length;

    List<Person> personList = List<Person>();
    for(int i=0; i<count; i++)
    {
      personList.add(Person.fromMapObject(personMapList[i]));
    }

    return personList;
  }

  Future<int> insertPerson(Person person) async
  {
    Database db = await this.database;
    var result = await db.insert(PersonTable, person.toMap());
    return result;
  }

  Future<int> deletePerson(Person person) async
  {
    debugPrint(person.id.toString());
    var db = await this.database;
    int result = await db.rawDelete('DELETE FROM $PersonTable WHERE $id = ${person.id}');
    return result;
  }

  Future<int> getCount() async {
		Database db = await this.database;
		List<Map<String, dynamic>> x = await db.rawQuery('SELECT COUNT (*) from $PersonTable');
		int result = Sqflite.firstIntValue(x);
		return result;
}

}