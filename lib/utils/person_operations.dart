// import 'package:gmcmanjeri_flutter/models/persondatabase.dart';
// import 'package:gmcmanjeri_flutter/models/person.dart';
// class PersonService{
//   static Future<List<Person>> getAllPersons() async{
//     final query = '''SELECT * FROM ${PersonDatabase.PersonTable}''';
//     final data = await db.rawQuery(query);
//     List<Person> persons = List();
//     for (var personNode in data){
//       final person = Person.fromJson(personNode);
//       persons.add(person);
//     }
//     return persons;
//   }

//   static Future<Person> getPersonByID(int id) async {
//     final query = '''SELECT * FROM ${PersonDatabase.PersonTable}
//     WHERE ${PersonDatabase.id} == $id''';
//     final data = await db.rawQuery(query);
//     final person = Person.fromJson(data[0]);
//     return person;
//   }

//   static Future<void> addPerson(Person person) async {
//     final sql = '''INSERT INTO ${PersonDatabase.PersonTable}
//     (
//       ${PersonDatabase.name},
//       ${PersonDatabase.address},
//       ${PersonDatabase.phoneno},
//       ${PersonDatabase.religion},
//       ${PersonDatabase.occupation},
//       ${PersonDatabase.education},
//       ${PersonDatabase.diabetes},
//       ${PersonDatabase.gender},
//       ${PersonDatabase.smoker},
//       ${PersonDatabase.age},
//       ${PersonDatabase.sbp},
//       ${PersonDatabase.dbp},
//       ${PersonDatabase.cholesterol},
//       ${PersonDatabase.isAhtt},
//       ${PersonDatabase.ahttmonths},
//       ${PersonDatabase.isMenopause},
//       ${PersonDatabase.isPrematureMenopause},
//       ${PersonDatabase.famHistoryOfCADRel},
//       ${PersonDatabase.height},
//       ${PersonDatabase.weight},
//       ${PersonDatabase.waistCirc},
//       ${PersonDatabase.hipCirc}
//     )
//     VALUES(
//       ${person.name},
//       ${person.address},
//       ${person.phoneno},
//       ${person.religion},
//       ${person.occupation},
//       ${person.education},
//       ${person.diabetes},
//       ${person.gender},
//       ${person.smoker},
//       ${person.age},
//       ${person.sbp},
//       ${person.dbp},
//       ${person.cholestrol},
//       ${person.isAHTT},
//       ${person.ahttMonths},
//       ${person.isMenopause},
//       ${person.isPrematureMenopause},
//       ${person.famHistoryOfCADRel},
//       ${person.height},
//       ${person.weight},
//       ${person.waistCirc},
//       ${person.hipCirc}
//     ) ''';

//   }
// }