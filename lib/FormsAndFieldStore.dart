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

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(18.0),
          child: Form(
            key: _customerProfileFormKey,
            child: TextFormField(
              decoration: InputDecoration(
                border:OutlineInputBorder(),
                labelText: "Name",
                hintText: "Enter your name"
              ),
              keyboardType: TextInputType.text,
              maxLength: 50,
              onSaved: (value){
                setState(() {
                  debugPrint("Customer name : $value");
                });
              },
            ),
          ),
        ),
        ElevatedButton(onPressed: (){
          _customerProfileFormKey.currentState?.save();
        }, child: const Text("Submit"))
      ],
    );
  }
}

