import 'package:flutter/material.dart';

class Radiostore extends StatelessWidget {
  const Radiostore({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Insta Store",
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Insta Store"),
        ),
        body: const RadioInputWidget(),
      ),
    );
  }
}

enum Size{
  small,
  medium,
  large
}

class RadioInputWidget extends StatefulWidget {
  const RadioInputWidget({super.key});

  @override
  State<RadioInputWidget> createState() => _RadioInputWidgetState();
}

class _RadioInputWidgetState extends State<RadioInputWidget> {
  Size _size = Size.large;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Container(
            height: 300,
            width: 300,
            padding: const EdgeInsets.all(40),
            margin: const EdgeInsets.all(30),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.orangeAccent, width: 2),
              image: const DecorationImage(
                image: AssetImage("images/heels.jpg"),
                fit: BoxFit.cover
              ),
              shape: BoxShape.circle
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: Center(
              child: Text(
                "Currently selected: $_size",
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 22,
                  color:Colors.orange,
                  fontWeight: FontWeight.bold
                ),
              ),
            ),

          ),
          RadioListTile(
            title: const Text("Small"),
            value: Size.small,
            groupValue: _size,
            onChanged: (Size? value){
              setState(() {
                _size = value!;
              });
            },
          ),
          RadioListTile(
            title: const Text("Medium"),
                value: Size.medium,
                groupValue: _size,
                onChanged: (Size? value){
                  setState(() {
                    _size = value!;
                  });
                }
          ),
          RadioListTile(
            title: const Text("Large"),
                value: Size.large,
                groupValue: _size,
                onChanged: (Size? value){
                  setState(() {
                    _size = value!;
                  });
                }
          )
        ],
      ),

    );
  }
}

