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
  @override
  Widget build(BuildContext context) {
    return const Padding(
        padding: EdgeInsets.all(18),
      child: Center(
        child: TextField(
          decoration: InputDecoration(
            prefixIcon: Icon(Icons.message),
            border: OutlineInputBorder(),
            labelText: "Share your thoughts: "
          ),
        ),
      ),
    );
  }
}


