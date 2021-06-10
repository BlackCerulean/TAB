import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:task_assigning_board/component/backgroundRegis.dart';
import 'package:task_assigning_board/component/bottom_nav.dart';

import '../../size_config.dart';

class AddTaskScreen extends StatefulWidget {
  // const AddTaskScreen({ Key? key }) : super(key: key);

  @override
  _AddTaskScreenState createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  @override

  var uid = FirebaseAuth.instance.currentUser.uid;

  String _category;

  TextEditingController _projectName = TextEditingController();
  TextEditingController _description = TextEditingController();
  TextEditingController _requirement = TextEditingController();
  TextEditingController _reward = TextEditingController();
  TextEditingController _company = TextEditingController();
  TextEditingController _client = TextEditingController();
  TextEditingController _address = TextEditingController();
  TextEditingController _contact = TextEditingController();
  TextEditingController _email = TextEditingController();

  Widget _buildProjectNameField() {
    return Container(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
            child: TextFormField(
              controller: _projectName,
              decoration: InputDecoration(
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: mainColor),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: mainColor),
                ),
                labelText: 'Project Name',
                prefixIcon: Image.asset('assets/icons/title Vector.jpg'),
              ),
              validator: (String value) {
                if (value.isEmpty) {
                  return 'Please fill your project name';
                } else
                  return null;
              },
              onSaved: (String value) {
                _projectName = value as TextEditingController;
              },
            ),
          )
        ],
      ),
    );
  }

  Widget _buildDescriptionField() {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(10.0))),
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: [
          TextFormField(
            controller: _description,
            maxLines: 4,
            decoration: InputDecoration(
              enabledBorder:
                  OutlineInputBorder(borderSide: BorderSide(color: mainColor)),
              focusedBorder:
                  OutlineInputBorder(borderSide: BorderSide(color: mainColor)),
              prefixIcon: Icon(
                Icons.comment_outlined,
                color: mainColor,
              ),
              labelText: "Description",
              contentPadding: EdgeInsets.all(10.0),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: BorderSide(
                  color: mainColor,
                ),
              ),
              hintStyle: TextStyle(
                fontSize: 15.0,
                color: Colors.grey,
              ),
            ),
            validator: (String value) {
              if (value.isEmpty) {
                return 'Please fill your description';
              } else
                return null;
            },
            onSaved: (String value) {
              _description = value as TextEditingController;
            },
          )
        ],
      ),
    );
  }

  Widget _buildRequirementField() {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(10.0))),
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: [
          TextFormField(
            controller: _requirement,
            maxLines: 4,
            decoration: InputDecoration(
              enabledBorder:
                  OutlineInputBorder(borderSide: BorderSide(color: mainColor)),
              focusedBorder:
                  OutlineInputBorder(borderSide: BorderSide(color: mainColor)),
              prefixIcon: Icon(
                Icons.dehaze,
                color: mainColor,
              ),
              labelText: "Requirement",
              contentPadding: EdgeInsets.all(10.0),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: BorderSide(
                  color: Colors.white,
                ),
              ),
              hintStyle: TextStyle(
                fontSize: 15.0,
                color: Colors.grey,
              ),
            ),
            validator: (String value) {
              if (value.isEmpty) {
                return 'Please fill your description';
              } else
                return null;
            },
            onSaved: (String value) {
              _requirement = value as TextEditingController;
            },
          )
        ],
      ),
    );
  }

  Widget _buildCompanyField() {
    return StreamBuilder<DocumentSnapshot>(
        stream: FirebaseFirestore.instance
            .collection('TAB Users')
            .doc(uid)
            .snapshots(),
        builder:
            (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          var value = snapshot.data.data();
          _company = TextEditingController()..text = value['Company'];
          return Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                TextFormField(
                  controller: _company,
                  decoration: InputDecoration(
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: mainColor),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: mainColor),
                    ),
                    prefixIcon: Icon(
                      Icons.business_outlined,
                      color: mainColor,
                    ),
                    labelText: 'Company Name',
                  ),
                  validator: (String value) {
                    if (value.isEmpty) {
                      return value = 'No Company';
                    } else
                      return null;
                  },
                  onSaved: (String value) {
                    _company = value as TextEditingController;
                  },
                )
              ],
            ),
          );
        });
  }

  Widget _buildRewardField() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: [
          TextFormField(
            controller: _reward,
            decoration: InputDecoration(
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: mainColor),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: mainColor),
              ),
              prefixIcon: Image.asset(
                'assets/icons/wages.jpg',
              ),
              labelText: 'Wages',
            ),
            validator: (String value) {
              if (value.isEmpty) {
                return 'Please fill your wages';
              } else
                return null;
            },
            onSaved: (String value) {
              _reward = value as TextEditingController;
            },
          )
        ],
      ),
    );
  }

  Widget _buildClientField() {
    return StreamBuilder<DocumentSnapshot>(
        stream: FirebaseFirestore.instance
            .collection('TAB Users')
            .doc(uid)
            .snapshots(),
        builder:
            (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          var value = snapshot.data.data();
          _client = TextEditingController()
            ..text = value['Firstname'] + " " + value['Lastname'];
          return Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                TextFormField(
                  controller: _client,
                  decoration: InputDecoration(
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: mainColor),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: mainColor),
                    ),
                    prefixIcon: Icon(
                      Icons.portrait,
                      color: mainColor,
                    ),
                    labelText: 'Client',
                  ),
                  validator: (String value) {
                    if (value.isEmpty) {
                      return 'Please fill your client name';
                    } else
                      return null;
                  },
                  onSaved: (String value) {
                    _client = value as TextEditingController;
                  },
                )
              ],
            ),
          );
        });
  }

  Widget _buildAddressField() {
    return StreamBuilder<DocumentSnapshot>(
        stream: FirebaseFirestore.instance
            .collection('TAB Users')
            .doc(uid)
            .snapshots(),
        builder:
            (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          var value = snapshot.data.data();
          _address = TextEditingController()..text = value['Address'];
          return Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                TextFormField(
                  controller: _address,
                  decoration: InputDecoration(
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: mainColor),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: mainColor),
                    ),
                    prefixIcon: Icon(
                      Icons.home_outlined,
                      color: mainColor,
                    ),
                    labelText: 'Address',
                  ),
                  validator: (String value) {
                    if (value.isEmpty) {
                      return 'Please fill your address';
                    } else
                      return null;
                  },
                  onSaved: (String value) {
                    _address = value as TextEditingController;
                  },
                )
              ],
            ),
          );
        });
  }

  Widget _buildContactField() {
    return StreamBuilder<DocumentSnapshot>(
        stream: FirebaseFirestore.instance
            .collection('TAB Users')
            .doc(uid)
            .snapshots(),
        builder:
            (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          var value = snapshot.data.data();
          _contact = TextEditingController()..text = value['Contact'];
          return Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                TextFormField(
                  controller: _contact,
                  decoration: InputDecoration(
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: mainColor),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: mainColor),
                    ),
                    prefixIcon: Icon(
                      Icons.call,
                      color: mainColor,
                    ),
                    labelText: 'Contact',
                  ),
                  validator: (String value) {
                    if (value.isEmpty) {
                      return 'Please fill your contact';
                    } else
                      return null;
                  },
                  onSaved: (String value) {
                    _contact = value as TextEditingController;
                  },
                )
              ],
            ),
          );
        });
  }

  Widget _buildEmailField() {
    return StreamBuilder<DocumentSnapshot>(
        stream: FirebaseFirestore.instance
            .collection('TAB Users')
            .doc(uid)
            .snapshots(),
        builder:
            (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          var value = snapshot.data.data();
          _email = TextEditingController()..text = value['Email'];
          return Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                TextFormField(
                  controller: _email,
                  decoration: InputDecoration(
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: mainColor),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: mainColor),
                    ),
                    prefixIcon: Icon(
                      Icons.mail_outline,
                      color: mainColor,
                    ),
                    labelText: 'Email',
                  ),
                  validator: (String value) {
                    if (value.isEmpty) {
                      return 'Please fill your email';
                    } else
                      return null;
                  },
                  onSaved: (String value) {
                    _email = value as TextEditingController;
                  },
                )
              ],
            ),
          );
        });
  }

  List listCategoryItem = ["Web", "Mobile", "Video", "Graphic"];
  Widget _buildCategoryField() {
    return Container(
        child: Center(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Container(
          padding: const EdgeInsets.only(left: 16, right: 16),
          // decoration: BoxDecoration(
          //     border: Border.all(color: Colors.grey, width: 1),
          //     borderRadius: BorderRadius.circular(15)),
          child: DropdownButton(
            hint: Text("Category"),
            icon: Icon(Icons.arrow_drop_down),
            iconSize: 36,
            isExpanded: true,
            underline: SizedBox(),
            style: TextStyle(color: Colors.black, fontSize: 22),
            value: _category,
            onChanged: (newValue) {
              setState(() {
                _category = newValue;
              });
            },
            items: listCategoryItem.map((valueItem) {
              return DropdownMenuItem(
                value: valueItem,
                child: Text(valueItem),
              );
            }).toList(),
          ),
        ),
      ),
    ));
  }

  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double defaultSize = SizeConfig.defaultSize;
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        children: [
          Row(
            children: [
              Container(
                  margin: EdgeInsets.fromLTRB(10, 20, 0, 0),
                  child: Text('Create your new task',
                      style: GoogleFonts.roboto(
                          textStyle: TextStyle(
                        fontSize: 28,
                      )))),
            ],
          ),
          Row(
            children: [
              Container(
                  margin: EdgeInsets.fromLTRB(10, 0, 0, 0),
                  child: Text('Fill your task information',
                      style: GoogleFonts.roboto(
                          textStyle: TextStyle(
                        fontWeight: FontWeight.w300,
                        color: Colors.grey,
                        fontSize: 16,
                      )))),
            ],
          ),
          Container(
            margin: EdgeInsets.fromLTRB(10, 0, 0, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: defaultSize * 2,
                  ),
                  child: Container(
                    color: Color.fromRGBO(112, 135, 255, 1),
                    height: defaultSize * 0.1,
                    width: defaultSize * 30,
                  ),
                ),
              ],
            ),
          ),
          _buildProjectNameField(),
          _buildDescriptionField(),
          _buildCompanyField(),
          _buildClientField(),
          _buildRequirementField(),
          _buildRewardField(),
          _buildAddressField(),
          _buildContactField(),
          _buildEmailField(),
          _buildCategoryField(),
          ElevatedButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(mainColor),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18.0),
                side: BorderSide(color: mainColor),
              )),
            ),
            child: Text(
              'Create Task',
              style: TextStyle(color: Colors.white),
            ),
            onPressed: () {
              // uid = await getUID();
              CollectionReference ref =
                  FirebaseFirestore.instance.collection('Task');
              // CollectionReference refe =
              //     FirebaseFirestore.instance.collection('AddRecipe');
              ref.add({
                'ProjectName': _projectName.text, //field
                'Description': _description.text, //field
                'Company': _company.text,
                'Client': _client.text, //dropdown
                'Requirement': _requirement.text, //dropdown
                'Rewards': _reward.text,
                'Address': _address.text,
                'CompanyNumber': _contact.text,
                'CompanyMail': _email.text,
                'Type': _category.toString(),
              }).whenComplete(() => Navigator.pop(context));
              // refe.add({
              //   'name': _foodname.text, //field
              //   'description': _description.text, //field
              //   'ingredient': IngredientList,
              //   'cuisine': _category.toString(), //dropdown
              //   'difficulty': _level.toString(), //dropdown
              //   'cookingStep': CookingStepList,
              //   'imgUrl': url,
              // }).whenComplete(() => Navigator.pop(context));
            },
          ),
        ],
      ),
    ),
    bottomNavigationBar: MyBottomNavBar(),
    );
  }
}
