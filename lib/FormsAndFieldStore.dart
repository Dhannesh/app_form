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
  String email = "";

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
                  validator: (value){
                    if(value!.isEmpty){
                      return "Please enter your name";
                    }
                    return null;
                  },
                  onSaved: (value) {
                    userName = value!;
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(
                      labelText: "Email", hintText: "Enter your email"),
                  keyboardType: TextInputType.text,
                  validator: (String? value) {
                    var regex = RegExp(r"^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+$");
                    if (!regex.hasMatch(value!)) {
                      return "Please specify a valid email";
                    }
                    return null;
                  },
                  onSaved: (value) {
                    email = value!;
                  },
                ),
                TextFormField(
                  obscureText: true,
                  decoration: InputDecoration(
                      labelText: "Password", hintText: "Enter your password"),
                  keyboardType: TextInputType.text,
                 validator: (value){
                    if(value!.isEmpty){
                      return "Please enter your password";
                    }
                    else if(value.length < 6){
                      return "Password must be at least 6 characters";
                    }
                    password = value;
                    return null;
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
                  validator: (value){
                    if(value!.isEmpty){
                      return "Please enter confirm password";
                    }else if(value != password){
                      return "Password does not match";
                    }
                    return null;
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
            // onPressed: match
            //     ? () {
            //         _customerProfileFormKey.currentState?.save();
            //       }
            //     : null,
          onPressed: (){
            if(_customerProfileFormKey.currentState!.validate()){
              _customerProfileFormKey.currentState?.save();
              debugPrint("Form is successfully submitted");
              debugPrint("Name: $userName");
              debugPrint("Email: $email");
              debugPrint("Password: $password");
              // debugPrint("Confirm Password: $confirmPassword");
            }
          },
            child: const Text("Submit"))
      ],
    );
  }
}
