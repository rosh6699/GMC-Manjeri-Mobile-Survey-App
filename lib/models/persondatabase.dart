// import 'dart:io';

// import 'package:gmcmanjeri_flutter/models/person.dart';
// import 'package:path/path.dart';
// import 'package:sqflite/sqflite.dart';

// Database db;

// class PersonDatabase {
//   static const PersonTable = 'Person';
//   // FOR PERSON SPECIFICALLY
//   static const id = 'id';
//   static const name = 'name';
//   static const address = 'address';
//   static const phoneno = 'phoneno';
//   static const religion = 'religion';
//   static const occupation = 'occupation';
//   static const education = 'education';
//   static const diabetes = 'diabetes';
//   static const gender = 'gender';
//   static const smoker = 'smoker';
//   static const age = 'age';
//   static const sbp = 'sbp';
//   static const dbp = 'dbp';
//   static const cholesterol = 'cholestrerol';
//   static const isAhtt = 'isahtt';
//   static const ahttmonths = 'ahttmonths';
//   static const isMenopause = 'ismenopause';
//   static const isPrematureMenopause = 'isprematuremenopause';
//   static const famHistoryOfCADRel = 'famHistoryOfCADRel';
//   static const height = 'height';
//   static const weight = 'weight';
//   static const waistCirc = 'waistCirc';
//   static const hipCirc = 'hipCirc';
//   PersonDatabase(Person person);

//   static void databaseLog(String function, String sqlQuery,
//   [List<Map<String, dynamic>> selectQueryResult, int insertAndUpdateQueryResult]) {
//     print(function);
//     print(sqlQuery);
//     if(selectQueryResult != null){
//       print(selectQueryResult);
//     }
//     else if (insertAndUpdateQueryResult != null){
//       print(insertAndUpdateQueryResult);
//     }
//   }
  
//   Future<void> createPersonTable(Database db) async {
//     final personSql = '''CREATE TABLE $PersonTable
//     (
//       $id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT UNIQUE,
//       $name VARCHAR(255) NOT NULL,
//       $address TEXT NOT NULL,
//       $phoneno TEXT,
//       $religion VARCHAR(10),
//       $occupation VARCHAR(48),
//       $education VARCHAR(28),
//       $diabetes BIT NOT NULL,
//       $gender BIT,
//       $smoker BIT NOT NULL,
//       $age INTEGER,
//       $sbp INTEGER,
//       $dbp INTEGER,
//       $cholesterol INTEGER,
//       $isAhtt BIT,
//       $ahttmonths DOUBLE,
//       $isMenopause BIT,
//       $isPrematureMenopause BIT,
//       $famHistoryOfCADRel BIT,
//       $height DOUBLE,
//       $weight DOUBLE,
//       $waistCirc DOUBLE,
//       $hipCirc DOUBLE
//     )
//     ''';

//     await db.execute(personSql);
//   }

//   Future<String> getDatabasePath(String dbName) async {
//     final databasePath = await getDatabasesPath();
//     final path = join(databasePath, dbName);

//     if (await Directory(dirname(path)).exists()){
//       await deleteDatabase(path);
//     } else {
//       await Directory(dirname(path)).create(recursive: true);
//     }
//     return path;
//   }

//   Future<void> initDatabase() async {
//     var path = await getDatabasePath('GMCManjeri_DB');
//     var db = await openDatabase(path, version: 1, onCreate: onCreate);
//     print(db);
//   }

//   Future<void> onCreate(Database db, int version) async {
//     await createPersonTable(db);
//     return null;
//   }
// }
