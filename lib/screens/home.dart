import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gmcmanjeri_flutter/models/person.dart';
import 'package:gmcmanjeri_flutter/screens/edit_surveys.dart';
import 'package:gmcmanjeri_flutter/screens/export.dart';
import 'package:gmcmanjeri_flutter/screens/medical.dart';

class HomeScreen extends StatefulWidget {
  @override
  HomeScreenState createState() => new HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {

  Person person = new Person();
  // int id;
  // String selectedReligion = '';
  // String selectedOccupation = '';
  // String selectedEducation = '';
  // String name = '';
  // String address = '';
  // String phoneNo;
  String doctorsName = 'GMC Manjeri';

  var religions = [
    "Hindu",
    "Christian",
    "Muslim",
    "Atheist",
    "Buddhist",
    "Jain",
    "Others"
  ];

  var occupations = [
    "Legislators, Managers, Senior Officials",
    "Professionals",
    "Technicians and Associate Professionals",
    "Clerks",
    "Skilled Workers & Shop + Market Sales Workers",
    "Skilled Agriculture + Fishery Workers",
    "Craft + Related Trade Workers",
    "Plant + Machine Operators and Assemblers",
    "Elementary Occupation",
    "Unemployed"
  ];

  var educationCategories = [
    "Profession / Honors",
    "Graduate",
    "Intermediate / Diploma",
    "High School Certificate",
    "Primary School Certificate",
    "Illiterate"
  ];

  TextEditingController nameController = new TextEditingController();
  TextEditingController addressController = new TextEditingController();
  TextEditingController phoneController = new TextEditingController();

  Drawer getNavDrawer(BuildContext context) {
    var headerChild = new DrawerHeader(
        child: new Align(
          alignment: Alignment.bottomRight,
          child: Text(
            doctorsName,
            textAlign: TextAlign.end,
            style: TextStyle(color: Colors.black, fontSize: 30.0),
          ),
        ),
        decoration: new BoxDecoration(
          color: Colors.grey,
        ));

    ListTile getNavItem(var icon, String s, String routeName) {
      return new ListTile(
        leading: new Icon(icon),
        title: new Text(s),
        onTap: () {
          setState(() {
            Navigator.of(context).pop();
            Navigator.of(context).pushNamed(routeName);
          });
        },
      );
    }

    var myNavChildren = [
      headerChild,
      getNavItem(Icons.edit, "Edit Surveys", EditSurvey.routeName),
      Divider(),
      getNavItem(
          Icons.swap_vert, "Export to Spread Sheet(.csv)", Export.routeName),
    ];

    ListView listView = new ListView(children: myNavChildren);

    return new Drawer(
      child: listView,
    );
  }

  ListView getListForm(context) {
    TextStyle textStyle = Theme.of(context).textTheme.title;
    Padding getTextItem(
        String s, int maxLines, TextEditingController controller) {
      return Padding(
        padding: commonPadding(),
        child: TextField(
          controller: controller,
          maxLines: maxLines,
          keyboardType: TextInputType.multiline,
          style: textStyle,
          onChanged: (value) {
            if (s == 'Name')
              this.person.name = value;
            else
              this.person.address = value;
            debugPrint('Something changed in the Name Text Field');
          },
          decoration: InputDecoration(
              labelText: s,
              labelStyle: textStyle,
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(5.0))),
        ),
      );
    }

    Padding getNumberItem(String s, TextEditingController controller) {
      return Padding(
        padding: commonPadding(),
        child: TextField(
          controller: controller,
          keyboardType: TextInputType.number,
          style: textStyle,
          onChanged: (value) {
            this.person.phoneno = value;
            debugPrint('Something changed in the Name Text Field');
          },
          decoration: InputDecoration(
              labelText: s,
              labelStyle: textStyle,
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(5.0))),
        ),
      );
    }

    Padding getChoiceItem(
        String s, List<String> choices, String selectedChoice) {
      return Padding(
          padding: commonPadding(),
          child: GestureDetector(
            onTap: () {
              FocusScope.of(context).requestFocus(new FocusNode());
            },
            child: Column(
              children: <Widget>[
                Center(
                  child: Text(
                    s,
                    style: TextStyle(
                      fontSize: 16.0,
                      color: Colors.grey,
                    ),
                  ),
                ),
                Wrap(
                    spacing: 5,
                    alignment: WrapAlignment.center,
                    children: choices
                        .map((String choice) => ChoiceChip(
                              selected: selectedChoice == choice,
                              backgroundColor: Colors.black12,
                              label: Text(choice.toString(),
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 16.0,
                                  )),
                              selectedColor: Colors.grey,
                              onSelected: (bool isChecked) {
                                setState(() {
                                  if (s == 'Select Religion')
                                    this.person.religion =
                                        isChecked ? choice : "";
                                  else if (s == 'Select Education')
                                    this.person.education =
                                        isChecked ? choice : "";
                                  else if (s == 'Select Occupation')
                                    this.person.occupation =
                                        isChecked ? choice : "";
                                });
                              },
                            ))
                        .toList()),
              ],
            ),
          ));
    }

    Padding proceedButton() {
      return Padding(
          padding:
              EdgeInsets.only(top: 10.0, bottom: 25.0, left: 15.0, right: 15.0),
          child: Builder(
              builder: (context) => RaisedButton(
                    child: Text(
                      "Enter Medical Details",
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          color: Colors.white,
                          fontSize: 25.0),
                    ),
                    elevation: 2.0,
                    color: Colors.black,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    onPressed: () {
                      debugPrint("Proceed clicked");
                      if ((this.person.education.isNotEmpty) &&
                          (this.person.religion.isNotEmpty) &&
                          (this.person.occupation.isNotEmpty) &&
                          (nameController.text.isNotEmpty) &&
                          (addressController.text.isNotEmpty) &&
                          (phoneController.text.isNotEmpty)) {
                        if(phoneController.text.length == 10 || ((phoneController.text.length == 12 || phoneController.text.length == 13) && phoneController.text[0] == '+')){
                          Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => MedicalDetails(
                                    person: person,
                                    )
                                    ),
                                  );
                        } else {
                          Scaffold.of(context).showSnackBar(SnackBar(content: Text("Invalid Phone Number")));
                        }
                      } else {
                        Scaffold.of(context).showSnackBar(SnackBar(
                            content:
                                Text("One or more fields above are empty.")));
                      }
                    },
                  )));
    }

    var myFormChildren = [
      getTextItem('Name', 1, nameController),
      getTextItem('Address', 5, addressController),
      getNumberItem('Phone no', phoneController),
      getChoiceItem('Select Religion', religions, this.person.religion),
      getChoiceItem(
          'Select Education', educationCategories, this.person.education),
      getChoiceItem('Select Occupation', occupations, this.person.occupation),
      proceedButton(),
    ];

    ListView listForm = new ListView(children: myFormChildren);

    return listForm;
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("GMC Manjeri"),
      ),
      body: new GestureDetector(
          onTap: () {
            FocusScope.of(context).requestFocus(new FocusNode());
          },
          child: Padding(
            padding: commonPadding(),
            child: getListForm(context),
          )),
      drawer: getNavDrawer(context),
    );
  }

  EdgeInsets commonPadding() {
    return EdgeInsets.only(top: 10, bottom: 10, left: 15, right: 15);
  }
}
