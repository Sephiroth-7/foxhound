import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:foxhound/widget/authentification/custom_text_field.dart';
import 'package:foxhound/widget/authentification/loading.dart';
import 'package:http/http.dart' as http;

class Register extends StatefulWidget {
  final Function visible;
  Register(this.visible);
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  String err = "";
  bool _loading = false;
  CustomTextField emailText = CustomTextField(
    title: "Email",
    placeholder: "Enter email",
    initialValue: '',
  );
  CustomTextField nameText = CustomTextField(
    title: "Name",
    placeholder: "Enter name",
    initialValue: '',
  );
  void register(String name, String email, String pass) async {
    setState(() {
      _loading = true;
    });
    final response = await http.post(
        Uri.parse(
            "https://materianoire.000webhostapp.com/Hespace/register.php"),
        body: {"name": name, "email": email, "pass": pass});
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      //Permet de mettre une trace dans la stake trace
      print(data);
      var result = data['data'];
      int succes = result[1];
      if (succes == 1) {
        setState(() {
          err = result[0];
          _loading = false;
        });
      } else {
        setState(() {
          err = result[0];
          _loading = false;
        });
      }
    }
  }

  CustomTextField passText = CustomTextField(
      title: "Password",
      placeholder: "***********",
      ispass: true,
      initialValue: '');
  CustomTextField confirmPassText = CustomTextField(
      title: "Confirm Password",
      placeholder: "***********",
      ispass: true,
      initialValue: '');
  final _key = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    emailText.err = "enter email";
    nameText.err = "enter name";
    passText.err = "enter password";
    return _loading
        ? Loading()
        : Scaffold(
            appBar: AppBar(
              title: const Text("Register"),
            ),
            body: Center(
              child: SingleChildScrollView(
                child: Container(
                    padding: const EdgeInsets.all(30),
                    child: Form(
                      key: _key,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          const Text(
                            "Register",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                                color: Colors.redAccent),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          nameText.textfrofield(),
                          const SizedBox(
                            height: 10,
                          ),
                          emailText.textfrofield(),
                          const SizedBox(
                            height: 10,
                          ),
                          passText.textfrofield(),
                          const SizedBox(
                            height: 10,
                          ),
                          confirmPassText.textfrofield(),
                          const SizedBox(
                            height: 10,
                          ),
                          RaisedButton(
                              onPressed: () {
                                if (_key.currentState!.validate()) {
                                  register(nameText.value, emailText.value,
                                      passText.value);
                                } else {
                                  print("les mots de passes sont différents");
                                }
                              },
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              child: const Text(
                                "Register",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20),
                              ),
                              color: Colors.redAccent),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                'Avez-vous un compte? ',
                                style: TextStyle(
                                    color: Colors.blueAccent, fontSize: 20),
                              ),
                              FlatButton(
                                  onPressed: () {},
                                  child: const Text(
                                    "Login",
                                    style: TextStyle(color: Colors.redAccent),
                                  ))
                            ],
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          Text(
                            err,
                            style: const TextStyle(color: Colors.red),
                            textAlign: TextAlign.center,
                          )
                        ],
                      ),
                    )),
              ),
            ),
          );
  }
}
