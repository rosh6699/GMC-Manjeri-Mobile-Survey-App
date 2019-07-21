import 'package:flutter/material.dart';
import 'package:gmcmanjeri_flutter/models/calculaterisk.dart';
import 'package:gmcmanjeri_flutter/models/person.dart';
import 'package:gmcmanjeri_flutter/screens/result.dart';

class MedicalDetails extends StatefulWidget {
  static const String routeName = "/Medical";
  final Person person;

  MedicalDetails({this.person});

  @override
  State<StatefulWidget> createState() {
    return MedicalDetailsState(person);
  }
}

class MedicalDetailsState extends State<MedicalDetails> {
  Person person;
  var commonPadding = EdgeInsets.only(top: 10, bottom: 10, left: 15, right: 15);
  // var genderToggle = true;
  // var antihypertensive = true;
  // int height = 0;
  // int weight = 0;
  // double bmi = 0;
  // var menopause = false;
  // var premenopause = false;
  // var preCAD = false;
  // int waist = 0;
  // int hip = 0;
  TextEditingController ageController = new TextEditingController();
  TextEditingController hyperController = new TextEditingController();
  TextEditingController bpController = new TextEditingController();
  TextEditingController heightController = new TextEditingController();
  TextEditingController weightController = new TextEditingController();
  TextEditingController waistController = new TextEditingController();
  TextEditingController hipController = new TextEditingController();
  TextEditingController cholesterolController = new TextEditingController();
  TextEditingController sbpController = new TextEditingController();
  TextEditingController dbpController = new TextEditingController();

  MedicalDetailsState(this.person);

  ListView getListForm(context) {
    TextStyle commonStyle = Theme.of(context).textTheme.title;

    Padding previousDetails() {
      return Padding(
        padding: commonPadding,
        child: Text(
          "Person Id: ${this.person.id}\nName: ${this.person.name}\nPhone Number: ${this.person.phoneno}\n",
          style: commonStyle,
        ),
      );
    }

    Padding getTextWidget(String s, TextEditingController controller) {
      return Padding(
        padding: commonPadding,
        child: TextField(
          controller: controller,
          keyboardType: TextInputType.number,
          style: commonStyle,
          onChanged: (value) {
            if (s == "Age: ") this.person.age = int.parse(value);
            if (s == "SBP")
              this.person.sbp = int.parse(value);
            if(s == "DBP")
              this.person.dbp = int.parse(value);
            if(s == "Cholesterol (mg/dL): ")
              this.person.cholestrol = (int.parse(value) / 38) as int;
            if (s == "Height (cms): ") this.person.height = int.parse(value);
            if (s == "Weight (kg): ") this.person.weight = int.parse(value);
            if (s == "Waist circumference: ") this.person.waistCirc = int.parse(value);
            if (s == "Hip circumference: ") this.person.hipCirc = int.parse(value);
            debugPrint('Something changed in the Text Field');
          },
          decoration: InputDecoration(
              labelText: s,
              labelStyle: commonStyle,
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(5.0))),
        ),
      );
    }

    Padding toggleGender(String s, String toggle1, String toggle2,
        String toggle3, var toggle, var t1Color, var t2Color, var t3Color) {
      Widget buildToggleSelect(var s, var togglechoice, var toggle, var color) {
        var button = toggle
            ? Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(75.0),
                  color: color,
                ),
                child: Center(
                  child: Text(
                    togglechoice,
                    style: commonStyle,
                  ),
                ),
              )
            : Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(75.0),
                  color: Colors.white,
                ),
                child: Center(
                  child: Text(
                    togglechoice,
                    style: commonStyle,
                  ),
                ),
              );

        return GestureDetector(
          child: button,
          onTap: () {
            setState(() {
              if (togglechoice == 'M') this.person.gender = 0;
              if (togglechoice == 'F') this.person.gender = 1;
              if (togglechoice == 'T') this.person.gender = 2;
            });
          },
        );
      }

      return Padding(
        padding: commonPadding,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Expanded(
              child: Text(
                s,
                style: commonStyle,
              ),
            ),
            buildToggleSelect(s, toggle1, toggle == 0 ? true : false, t1Color),
            buildToggleSelect(s, toggle2, toggle == 1 ? true : false, t2Color),
            buildToggleSelect(s, toggle3, toggle == 2 ? true : false, t3Color)
          ],
        ),
      );
    }

    Padding toggleButtons(String s, String toggle1, String toggle2, var toggle,
        var t1Color, var t2Color) {
      Widget buildToggleSelect(var s, var togglechoice, var toggle, var color) {
        var button = toggle
            ? Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(75.0),
                  color: color,
                ),
                child: Center(
                  child: Text(
                    togglechoice,
                    style: commonStyle,
                  ),
                ),
              )
            : Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(75.0),
                  color: Colors.white,
                ),
                child: Center(
                  child: Text(
                    togglechoice,
                    style: commonStyle,
                  ),
                ),
              );

        return GestureDetector(
          child: button,
          onTap: () {
            setState(() {
              if (s == 'Menopause: ') {
                this.person.isMenopause = !this.person.isMenopause;
                if (this.person.isMenopause == false) this.person.isPrematureMenopause = false;
              }
              if (s == 'Premature menopause? less than 40 years: ')
                this.person.isPrematureMenopause = !this.person.isPrematureMenopause;
              if (s == 'Are you already on Antihypertensive therapy? :')
                this.person.isAHTT = !this.person.isAHTT;
              if (s == 'Diabetes: ')
                this.person.diabetes = !this.person.diabetes;
              if (s == 'Smoker: ') this.person.smoker = !this.person.smoker;
              if (s == 'Family history of premature CAD (M < 55Y, F < 65Y): ')
                this.person.famHistoryOfCADRel = !this.person.famHistoryOfCADRel;
            });
          },
        );
      }

      return Padding(
        padding: commonPadding,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Expanded(
              child: Text(
                s,
                style: commonStyle,
              ),
            ),
            buildToggleSelect(s, toggle1, toggle, t1Color),
            buildToggleSelect(s, toggle2, !toggle, t2Color)
          ],
        ),
      );
    }

    Padding toggleAddnQues(var s, var toggle, var controller) {
      if (toggle == true)
        return Padding(
          padding: commonPadding,
          child: TextField(
            controller: controller,
            keyboardType: TextInputType.number,
            style: commonStyle,
            onChanged: (value) {
              this.person.ahttMonths = int.parse(value);
              debugPrint('Something changed in the ahtt Text Field');
            },
            decoration: InputDecoration(
                labelText: s,
                labelStyle: commonStyle,
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0))),
          ),
        );
      else
        return Padding(
          padding: EdgeInsets.all(0.0),
          child: Text(""),
        );
    }

    Padding getMenopause() {
      if (this.person.gender == 1) {
        return toggleButtons("Menopause: ", "Y", "N", this.person.isMenopause,
            Colors.greenAccent, Colors.redAccent);
      } else {
        return Padding(
          padding: EdgeInsets.all(0.0),
          child: Text(""),
        );
      }
    }

    Padding getMenopauseYear() {
      if (this.person.isMenopause == true) {
        return toggleButtons("Premature menopause? less than 40 years: ", "Y",
            "N", this.person.isPrematureMenopause, Colors.greenAccent, Colors.redAccent);
      } else {
        return Padding(
          padding: EdgeInsets.all(0.0),
          child: Text(""),
        );
      }
    }

    Padding printCalc(String s) {
      String checkBMI(double bmi) {
        if (bmi < 18.5)
          return "Underweight";
        else if (bmi < 23)
          return "Normal range";
        else if (bmi < 25)
          return "Overweight";
        else if (bmi < 30)
          return "Obese 1";
        else
          return "Obese 2";
      }

      String checkWH(double ratio) {
        if (this.person.gender == 0) if (ratio > 0.95)
          return "Risk of Diabetes";
        if (this.person.gender == 1) if (ratio > 0.85)
          return "Risk of Diabetes";
        return "";
      }

      if (s == "BMI") {
        return Padding(
          padding: commonPadding,
          child: Text(
            "BMI: ${(this.person.weight / this.person.height / this.person.height * 10000).toStringAsFixed(2)} " +
                checkBMI((this.person.weight / this.person.height / this.person.height * 10000)),
            style: commonStyle,
          ),
        );
      } else if (s == "Hip") {
        return Padding(
          padding: commonPadding,
          child: Text(
            "Waist hip Ratio: ${(this.person.waistCirc / this.person.hipCirc).toStringAsFixed(2)} " +
                checkWH(this.person.waistCirc / this.person.hipCirc),
            style: commonStyle,
          ),
        );
      } else if (s == "Height") {
        return Padding(
          padding: commonPadding,
          child: Text(
            "Waist height Ratio: ${(this.person.waistCirc / this.person.height).toStringAsPrecision(2)} ",
            style: commonStyle,
          ),
        );
      }
    }

    Padding proceedButton() {
      return Padding(
          padding:
              EdgeInsets.only(top: 10.0, bottom: 25.0, left: 15.0, right: 15.0),
          child: Builder(
              builder: (context) => RaisedButton(
                  child: Text(
                    "Continue",
                    style: TextStyle(
                        fontWeight: FontWeight.w400,
                        color: Colors.white,
                        fontSize: 25.0
                      ),
                  ),
                  elevation: 2.0,
                  color: Colors.black,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  onPressed: () {
                    // ADDED MY CODE HERE
                    if(double.tryParse(heightController.text) == double.nan){
                      Scaffold.of(context).showSnackBar(SnackBar(content: Text("Height not a number."),));
                    }
                    else if(double.tryParse(weightController.text) == double.nan){
                        Scaffold.of(context).showSnackBar(SnackBar(content: Text("Weight not a number."),));
                      }
                    else{
                    debugPrint("Proceed clicked");
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ResultContent(this.person.cholestrol == 0 ? ResultPredict(this.person).returnEle2() : ResultPredict(this.person).returnEle(), this.person)),
                
                    );
                    }
                  })));
    }

    var myFormChildren = [
      previousDetails(),
      getTextWidget("Age: ", ageController),
      toggleGender("Select Gender: ", "M", "F", "T", this.person.gender,
          Colors.blueAccent, Colors.pinkAccent, Colors.purpleAccent),
      toggleButtons("Diabetes: ", "Y", "N", this.person.diabetes,
          Colors.greenAccent, Colors.redAccent),
      toggleButtons("Smoker: ", "Y", "N", this.person.smoker,
          Colors.greenAccent, Colors.redAccent),
      Padding(
          padding: commonPadding,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Text(
                "BP : ",
                style: commonStyle,
              ),
              Flexible(child: getTextWidget("SBP", sbpController)),
              Text(
                "/",
                style: commonStyle,
              ),
              Flexible(child: getTextWidget("DBP", dbpController)),
            ],
          )),
      getTextWidget("Cholesterol (mg/dL): ", cholesterolController),
      toggleButtons("Are you already on Antihypertensive therapy? :", "Y", "N",
          this.person.isAHTT, Colors.greenAccent, Colors.redAccent),
      toggleAddnQues(
          "For how many years?: ", this.person.isAHTT, hyperController),
      getMenopause(),
      getMenopauseYear(),
      toggleButtons("Family history of premature CAD (M < 55Y, F < 65Y): ", "Y",
          "N", this.person.famHistoryOfCADRel, Colors.greenAccent, Colors.redAccent),
      getTextWidget("Height (cms): ", heightController),
      getTextWidget("Weight (kg): ", weightController),
      printCalc("BMI"),
      getTextWidget("Waist circumference: ", waistController),
      getTextWidget("Hip circumference: ", hipController),
      printCalc("Hip"),
      printCalc("Height"),
      proceedButton(),
    ];

    ListView listForm = new ListView(children: myFormChildren);

    return listForm;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Medical Details"),
        ),
        body: GestureDetector(
          onTap: () {
            FocusScope.of(context).requestFocus(new FocusNode());
          },
          child: Padding(
            padding: commonPadding,
            child: getListForm(context),
          ),
        ));
  }
}