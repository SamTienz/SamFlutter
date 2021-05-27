import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: "My App", home: MyCustomForm());
  }
}

class MyCustomForm extends StatefulWidget {
  @override
  _MyCustomFormState createState() => _MyCustomFormState();
}

class _MyCustomFormState extends State<MyCustomForm> {
  final myController = TextEditingController();
  late FocusNode myFocusNode;

  void _printLatestValue() {
    print('TextField text did change:${myController.text} print by Controller');
  }

  void _showAlertDialog(BuildContext context) {
    final alert = AlertDialog(
      content: myController.text == ""
          ? Text("No any input")
          : Text("${myController.text}"),
    );

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    myFocusNode = FocusNode();
    myController.addListener(_printLatestValue);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    myFocusNode.dispose();
    myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My App"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
            child: TextField(
              focusNode: myFocusNode,
              controller: myController,
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Enter a search term"),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
            child: TextFormField(
              onChanged: (text) {
                print("TextFormField text did change $text");
              },
              decoration: InputDecoration(
                  border: UnderlineInputBorder(),
                  hintText: "Enter your username"),
            ),
          ),
          SizedBox(
            height: 16,
          ),
          TextButton(
            onPressed: () {
              _showAlertDialog(context);
            },
            child: Text("Print the first TextField text"),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          myFocusNode.requestFocus();
          // _showAlertDialog(context);
        },
        child: Icon(Icons.center_focus_strong),
      ),
    );
  }
}
