import 'package:flutter/material.dart';

void main() {
  runApp(const MyStore());
}

class MyStore extends StatelessWidget {
  const MyStore({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Insta Store",
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Insta Store"),
        ),
        body: const TextInputWidget(),
      ),
    );
  }
}

class TextInputWidget extends StatefulWidget {
  const TextInputWidget({super.key});

  @override
  State<TextInputWidget> createState() => _TextInputWidgetState();
}

class _TextInputWidgetState extends State<TextInputWidget> {
  String thoughts = "No thoughts yet...";
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(children: <Widget>[
        TextField(
          decoration: const InputDecoration(
              prefixIcon: Icon(Icons.message),
              border: OutlineInputBorder(),
              labelText: "Share your thoughts: ",
              hintText: "What's on your mind?"),
          keyboardType: TextInputType.text,
          maxLength: 25,
          onChanged: (text){
            setState(() {
              thoughts = text;
            });
            debugPrint('Your thoughts: $thoughts');
          },
        ),
        Center(
          child: Container(
            padding: const EdgeInsets.all(12),
            child: Text(thoughts, style: const TextStyle(
              color: Colors.blueGrey,
              fontSize: 25,
            ),),
          )
        )

      ]),
    );
  }
}
