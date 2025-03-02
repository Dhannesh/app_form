import 'package:flutter/material.dart';

class DropdownStore extends StatelessWidget {
  const DropdownStore({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Insta Store",
      theme: ThemeData(primarySwatch: Colors.indigo),
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Insta Store",
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.indigo,
        ),
        body: const DropdownInputWidget(),
      ),
    );
  }
}

class DropdownInputWidget extends StatefulWidget {
  const DropdownInputWidget({super.key});

  @override
  State<DropdownInputWidget> createState() => _DropdownInputWidgetState();
}

class _DropdownInputWidgetState extends State<DropdownInputWidget> {
  String value = 'Small';
  var sizes = ['Small', 'Medium', 'Large'];
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            height: 300,
            width: 300,
            padding: const EdgeInsets.all(40),
            margin: const EdgeInsets.all(30),
            decoration: BoxDecoration(
                border: Border.all(color: Colors.red, width: 2),
                image: const DecorationImage(
                    image: AssetImage("images/heels.jpg"), fit: BoxFit.cover),
                shape: BoxShape.circle),
          ),
          Center(
            child: Text(
              "Selected selected: $value",
              textAlign: TextAlign.center,
              style: const TextStyle(
                  fontSize: 25,
                  fontFamily: 'Verdana',
                  color: Colors.red,
                  fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.red, width: 2),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: DropdownButton(
                  value: value,
                  icon: const Icon(Icons.arrow_drop_down),
                  items: sizes.map((String item) {
                    return DropdownMenuItem(
                      value: item,
                      child: Text(item),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      value = newValue!;
                    });
                  }),
            ),
          ),
        ],
      ),
    );
  }
}
