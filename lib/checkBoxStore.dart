import 'package:flutter/material.dart';

class CheckBoxStore extends StatelessWidget {
  const CheckBoxStore({super.key});

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
        body: const CheckBoxInputWidget(),
      ),
    );
  }
}

class CheckBoxInputWidget extends StatefulWidget {
  const CheckBoxInputWidget({super.key});

  @override
  State<CheckBoxInputWidget> createState() => _CheckBoxInputWidgetState();
}

class Product {
  String imageName;
  String title;
  bool isChecked;
  Product(this.imageName, this.title, this.isChecked);
}

class _CheckBoxInputWidgetState extends State<CheckBoxInputWidget> {
  final List<Product> _productsList = [
    Product("images/sweatshirt.jpg", "Sweatshirt", false),
    Product("images/tie.jpg", "Tie", false),
    Product("images/top.jpg", "Dress top", false),
    Product("images/jeans.jpg", "Jeans", false)
  ];
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: _productsList.length,
      itemBuilder: (_, i) {
        return Card(
          elevation: 4,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(8)),
              side:
                  BorderSide(color: Colors.orange.withOpacity(0.7), width: 2)),
          child: ListTile(
            trailing: Checkbox(
                value: _productsList[i].isChecked,
                onChanged: (val) => setState(() {
                      _productsList[i].isChecked = val!;
                    })),
            title: Row(children: [
              Image.asset(
                _productsList[i].imageName,
                height: 100,
                width: 100,
              ),
              Padding(
                padding: const EdgeInsets.all(8),
                child: Text(
                  _productsList[i].title,
                  style:
                      const TextStyle(fontSize: 18, color: Colors.deepOrange),
                ),
              ),
            ]),
          ),
        );
      },
    );
  }
}
