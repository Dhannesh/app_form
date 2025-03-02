import 'package:flutter/material.dart';

class FormsAndFieldsStore extends StatelessWidget {
  const FormsAndFieldsStore({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Insta Store",
      theme: ThemeData(primarySwatch: Colors.deepOrange),
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Customer Profile",
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.deepOrange,
        ),
        body: const CustomProfileForm(),
      ),
    );
  }
}

class CustomProfileForm extends StatefulWidget {
  const CustomProfileForm({super.key});

  @override
  State<CustomProfileForm> createState() => _CustomProfileFormState();
}

class _CustomProfileFormState extends State<CustomProfileForm> {
  final _customerProfileFormKey = GlobalKey<FormState>();
  bool match = false;
  String password = "";
  String confirmPassword = "";
  String userName = "";

  void checkPassword() {
    setState(() {
      match = password.isNotEmpty &&
          confirmPassword.isNotEmpty &&
          password == confirmPassword;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(18.0),
          child: Form(
            key: _customerProfileFormKey,
            child: Column(
              children: [
                TextFormField(
                  decoration: InputDecoration(
                      labelText: "Name", hintText: "Enter your name"),
                  keyboardType: TextInputType.text,
                  onSaved: (value) {
                    userName = value!;
                    debugPrint("User name: $userName");
                  },
                ),
                TextFormField(
                  obscureText: true,
                  decoration: InputDecoration(
                      labelText: "Password", hintText: "Enter your password"),
                  keyboardType: TextInputType.text,
                  onChanged: (value) {
                    setState(() {
                      password = value;
                    });
                  },
                  onSaved: (value) {
                    password = value!;
                    debugPrint("Password: $password");
                  },
                ),
                TextFormField(
                  obscureText: true,
                  decoration: InputDecoration(
                      labelText: "Confirm Password",
                      hintText: "Enter confirm password"),
                  keyboardType: TextInputType.text,
                  onChanged: (value){
                    setState(() {
                      confirmPassword = value;
                      checkPassword();
                    });
                  },
                  onSaved: (value) {
                    debugPrint("Confirm Password: $confirmPassword");
                    debugPrint("password matched: $match");
                  },
                ),
              ],
            ),
          ),
        ),
        ElevatedButton(
            onPressed: match
                ? () {
                    _customerProfileFormKey.currentState?.save();
                  }
                : null,
            child: const Text("Submit"))
      ],
    );
  }
}
