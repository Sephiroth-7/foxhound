import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:foxhound/widget/authentification/custom_text_field.dart';
import 'package:foxhound/widget/authentification/loading.dart';
import 'package:http/http.dart' as http;

class Login extends StatefulWidget {
  final Function visible;
  Login(this.visible);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String err = "";
  bool _loading = false;
  void login(String email, String pass) async {
    setState(() {
      err = "";
      _loading = true;
    });
    final response = await http.post(
        Uri.parse("https://materianoire.000webhostapp.com/Hespace/login.php"),
        body: {"email": email, "pass": pass});
    if (response.statusCode == 200) {
      print("La connexion est bien établie");
      print(response.statusCode);
      var data = jsonDecode(response.body);
      print(data);
      //permet de corriger le problème de jsondecode avec format error
      // var data = jsonDecode(json.encode(response.body));
      var result = data['data'];
      int succes = result[1];
      if (result == 1) {
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

  CustomTextField emailText = CustomTextField(
    title: "Email",
    placeholder: "Enter email",
    initialValue: '',
  );
  CustomTextField passText = CustomTextField(
      title: "Password",
      placeholder: "***********",
      ispass: true,
      initialValue: '');
  final _key = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    emailText.err = "enter email";
    passText.err = "enter password";
    return _loading
        ? Loading()
        : Scaffold(
            appBar: AppBar(
              title: const Text("Login"),
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
                            "Login",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                                color: Colors.redAccent),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          emailText.textfrofield(),
                          const SizedBox(
                            height: 10,
                          ),
                          passText.textfrofield(),
                          const SizedBox(
                            height: 10,
                          ),
                          RaisedButton(
                              onPressed: () async {
                                // if (_key.currentState!.validate()) {
                                login(emailText.value, passText.value);
                                print(emailText.value);
                                print(passText.value);
                                print("OK OK");
                              },
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              child: const Text(
                                "Login",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20),
                              ),
                              color: Colors.black12),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                'Avez-vous un compte ? ',
                                style: TextStyle(
                                    color: Colors.black, fontSize: 20),
                              ),
                              FlatButton(
                                  onPressed: () {},
                                  child: const Text(
                                    "Register",
                                    style: TextStyle(color: Colors.redAccent),
                                  ))
                            ],
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          Text(
                            err,
                            style: const TextStyle(
                                color: Colors.red, fontSize: 20),
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
