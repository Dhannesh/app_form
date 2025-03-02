import 'package:flutter/material.dart';

class GroupedInputStore extends StatelessWidget {
  const GroupedInputStore({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Insta Store",
      theme: ThemeData(primarySwatch: Colors.blueGrey),
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Insta Store",
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.blueGrey,
        ),
        body: const PasswordInputWidget(),
      ),
    );
  }
}

class PasswordInputWidget extends StatefulWidget {
  const PasswordInputWidget({super.key});

  @override
  State<PasswordInputWidget> createState() => _PasswordInputWidgetState();
}

class _PasswordInputWidgetState extends State<PasswordInputWidget> {
  bool match = false;
  String userName="";
  String password = "";
  String confirmPassword = "";
  void checkPassword() {
    setState(() {
      match = password.isNotEmpty &&
          confirmPassword.isNotEmpty &&
          password == confirmPassword;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        children: [
          TextField(
            decoration: const InputDecoration(labelText: "Username"),
            keyboardType: TextInputType.text,
            onChanged: (String userName){
              setState(() {
                this.userName = userName;
              });
            },
          ),
          TextField(
              decoration: const InputDecoration(labelText: "Password"),
              keyboardType: TextInputType.text,
              onChanged: (String password) {
                setState(() {
                  this.password = password;
                });
                checkPassword();
              }),
          TextField(
              decoration: const InputDecoration(labelText: "Confirm password"),
              keyboardType: TextInputType.text,
              onChanged: (String password) {
                setState(() {
                  confirmPassword = password;
                });
                checkPassword();
              }),
          Padding(
              padding: EdgeInsets.all(12.0),
            child: Text(
              match? '$userName, Password match!' : '$userName, Password does not match :-( please try again',style: TextStyle(
              color: match ? Colors.blueGrey : Colors.red
            ),
            ),

          )
        ],
      ),
    );
  }
}
