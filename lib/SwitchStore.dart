import 'package:flutter/material.dart';


class SwitchStore extends StatelessWidget {
  const SwitchStore({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Insta Store",
      theme: ThemeData(
       primarySwatch: Colors.teal
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Insta Store", style: TextStyle(color: Colors.white),),
          backgroundColor: Colors.teal,
        ),
        body: const SwitchInputWidget(),
      ),
    );
  }
}
class SwitchInputWidget extends StatefulWidget {
  const SwitchInputWidget({super.key});

  @override
  State<SwitchInputWidget> createState() => _SwitchInputWidgetState();
}

class _SwitchInputWidgetState extends State<SwitchInputWidget> {
  bool _showSweater = false;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Container(
            height: 400,
            width: 500,
            margin:EdgeInsets.all(30.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(10.0)
              )
            ),
            child: Column(
              children: [
                Image(
                    image: _showSweater ? const AssetImage("images/sweatshirt.jpg") : const AssetImage("images/jeans.jpg"),
                  fit: BoxFit.cover,
                ),
                const Padding(
                    padding: EdgeInsets.all(10.0),
                  child: Text("Toggle to change the image!",
                  style: TextStyle(
                    color: Colors.teal,
                    fontSize: 18.0
                  ),),
                ),
              ]
            )
          ),
          _normalToggleButton()
        ],
      ),
    );
  }
  Widget _normalToggleButton(){
    return Transform.scale(
      scale:4.0,
      child: Switch(
        value: _showSweater,
        activeColor: Colors.orangeAccent,
        inactiveThumbColor: Colors.blueGrey,
        activeThumbImage: const AssetImage("images/sweatshirt.jpg"),
        inactiveThumbImage: const AssetImage("images/jeans.jpg"),
        onChanged: (bool value){
          setState(() {
            _showSweater = value;
          });
        },
      )
    );
  }
}


