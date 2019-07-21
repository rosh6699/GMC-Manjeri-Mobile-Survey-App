import 'package:gmcmanjeri_flutter/models/persondatabase.dart';

class Person
{
  int id;
  String name = "";
  String address = "";
  String phoneno = "";
  String religion = "";
  String occupation = "";
  String education = "";
  bool diabetes = false;
  int gender = 0;
  bool smoker = false;
  int age = 0;
  int sbp = 0;
  int dbp = 0;
  int cholestrol = 0;

  bool isAHTT = false;
  int ahttMonths = 0;

  bool isMenopause = false;
  bool isPrematureMenopause = false;
  bool famHistoryOfCADRel = false;

  int height = 0;
  int weight = 0;
  // double bmi = 0.0;
  
  int waistCirc = 0;
  int hipCirc = 0;

  //String color = 'green';

  // Person(this.id, this.name, this.address, this.phoneno, this.religion, this.occupation, this.education);
  // void updateValues( { bool isM = false, bool isPM = false, bool fhCADRel = false, double ht = 0.0, double wt = 0.0, double bmi = 0.0, double wstC = 0.0, double hipC = 0.0 } ){
  //   this.isMenopause = isM;
  //   this.isPrematureMenopause = isPM;
  //   this.famHistoryOfCADRel = fhCADRel;
  //   this.height = ht;
  //   this.weight = wt;
  //   this.bmi = bmi;
  //   this.waistCirc = wstC;
  //   this.hipCirc = hipC;
  // }

  Person();

  void updateDetailsofFirstPage(int id, String name, String address, String phoneno, String religion, String occupation, String education)
  {
    this.id = id;
    this.name = name;
    this.address = address;
    this.phoneno = phoneno;
    this.religion = religion;
    this.occupation = occupation;
    this.education = education;
  }
  // Convert from JSON
  // Person.fromJson(Map<String, dynamic> json){
  //   this.id = json[PersonDatabase.id];
  //   this.name = json[PersonDatabase.name];
  //   this.address = json[PersonDatabase.address];
  //   this.phoneno = json[PersonDatabase.phoneno];
  //   this.religion = json[PersonDatabase.religion];
  //   this.occupation = json[PersonDatabase.occupation];
  //   this.education = json[PersonDatabase.education];
  //   this.diabetes = json[PersonDatabase.diabetes];
  //   this.gender = json[PersonDatabase.gender];
  //   this.smoker = json[PersonDatabase.smoker];
  //   this.age = json[PersonDatabase.age];
  //   this.sbp = json[PersonDatabase.sbp];
  //   this.dbp = json[PersonDatabase.dbp];
  //   this.cholestrol = json[PersonDatabase.cholesterol];
  //   this.isAHTT = json[PersonDatabase.isAhtt];
  //   this.ahttMonths = json[PersonDatabase.ahttmonths];
  //   this.isMenopause = json[PersonDatabase.isMenopause];
  //   this.isPrematureMenopause = json[PersonDatabase.isPrematureMenopause];
  //   this.famHistoryOfCADRel = json[PersonDatabase.famHistoryOfCADRel];
  //   this.height = json[PersonDatabase.height];
  //   this.weight = json[PersonDatabase.weight];
  //   // this.bmi = json[PersonDatabase.bmi];
  //   this.waistCirc = json[PersonDatabase.waistCirc];
  //   this.hipCirc = json[PersonDatabase.hipCirc];
  // }

  //convert to map object

  Map<String, dynamic> toMap()
  {
    var map = Map<String, dynamic>();

    if(this.id != null)
    {
      map['id'] = this.id;
    }

    map['name'] = this.name;
    map['address'] = this.address;
    map['phoneno'] = this.phoneno;
    map['religion'] = this.religion;
    map['occupation'] = this.occupation;
    map['education']= this.education;
    map['diabetes'] = this.diabetes ? 1 : 0;
    map['gender'] = this.gender;
    map['smoker'] = this.smoker ? 1 : 0;
    map['age'] = this.age;
    map['sbp'] = this.sbp;
    map['dbp'] = this.dbp;
    map['cholesterol'] = this.cholestrol;
    map['isAHTT'] = this.isAHTT ? 1 : 0;
    map['ahttMonths'] = this.ahttMonths;
    map['isMenopause'] = this.isMenopause ? 1 : 0;
    map['isPM'] = this.isPrematureMenopause ? 1 : 0;
    map['isRelCAD'] = this.famHistoryOfCADRel ? 1 : 0;
    map['height'] = this.height;
    map['weight'] = this.weight;
    map['waist'] = this.waistCirc;
    map['hip'] = this.hipCirc;

    return map;
  }

  Person.fromMapObject(Map<String, dynamic> map)
  {
    this.id = map['id'];
    this.name = map['name'];
    this.address = map['address'];
    this.phoneno = map['phoneno'];
    this.religion = map['religion'];
    this.occupation = map['occupation'];
    this.education = map['education'];
    this.diabetes = map['diabetes']==1? true : false;
    this.gender = map['gender'];
    this.smoker = map['smoker']==1 ? true : false;
    this.age = map['age'];
    this.sbp = map['sbp'];
    this.dbp = map['dbp'];
    this.cholestrol = map['cholesterol'];
    this.isAHTT = map['isAHTT'] == 1? true : false;
    this.ahttMonths = map['ahttMonths'];
    this.isMenopause = map['isMenopause']== 1? true : false;
    this.isPrematureMenopause = map['isPM'] == 1? true : false;
    this.famHistoryOfCADRel = map['isRelCAD'] == 1 ? true : false;
    this.height = map['height'];
    this.weight = map['weight'];
    this.waistCirc = map['waist'];
    this.hipCirc = map['hip'];
  }
}