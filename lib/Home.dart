// // ignore_for_file: prefer_const_constructors

// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pattern_formatter/numeric_formatter.dart';
import 'Input_design.dart';

class FormPage extends StatefulWidget {
  @override
  _FormPageState createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
//  String name,email,phone;

  //TextController to read text entered in text field
  TextEditingController password = TextEditingController();
  TextEditingController confirmpassword = TextEditingController();

  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Validation"),
        centerTitle: true,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Form(
            key: _formkey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 80,
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(150),
                      child: Image.asset(
                        "assets/image.jpg",
                        height: 300,
                        width: 300,
                        fit: BoxFit.cover,
                      )),
                ),
                SizedBox(
                  height: 15,
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(bottom: 15, left: 10, right: 10),
                  child: TextFormField(
                    keyboardType: TextInputType.text,
                    decoration: buildInputDecoration(Icons.person, "Full Name"),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please Enter Name';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      var name = value;
                    },
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(bottom: 15, left: 10, right: 10),
                  child: TextFormField(
                    keyboardType: TextInputType.name,
                    decoration: buildInputDecoration(Icons.email, "Email"),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please a Enter';
                      }
                      if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
                          .hasMatch(value)) {
                        return 'Cannot Enter without @';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      var email = value!;
                    },
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(bottom: 15, left: 10, right: 10),
                  child: TextFormField(
                    keyboardType: TextInputType.text,
                    decoration:
                        buildInputDecoration(Icons.phone, "Mobile Number"),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter phone no ';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      var phone = value!;
                    },
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(13),
                      CreditCardFormatter(),
                    ],
                    style: TextStyle(fontSize: 16.0, color: Colors.black),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(bottom: 15, left: 10, right: 10),
                  child: TextFormField(
                    controller: password,
                    keyboardType: TextInputType.text,
                    decoration: buildInputDecoration(Icons.lock, "Password"),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please a Enter Password';
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(bottom: 15, left: 10, right: 10),
                  child: TextFormField(
                    controller: confirmpassword,
                    obscureText: true,
                    keyboardType: TextInputType.text,
                    decoration:
                        buildInputDecoration(Icons.lock, "Confirm Password"),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please re-enter password';
                      }
                      print(password.text);

                      print(confirmpassword.text);
                      if (password.text != confirmpassword.text) {
                        return "Password does not match";
                      }

                      return null;
                    },
                  ),
                ),
                SizedBox(
                  width: 200,
                  height: 50,
                  child: RaisedButton(
                    color: Colors.blue[700],
                    onPressed: () {
                      if (_formkey.currentState!.validate()) {
                        print("successful");

                        return;
                      } else {
                        print("UnSuccessfull");
                      }
                    },
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50.0),
                        side:
                            BorderSide(color: Colors.blue.shade900, width: 2)),
                    textColor: Colors.white,
                    child: Text("Submit"),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
