import 'package:flutter/material.dart';

class AddPerson extends StatefulWidget {
  const AddPerson({super.key});

  @override
  State<AddPerson> createState() => _AddPersonState();
}

class _AddPersonState extends State<AddPerson> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Add Person'),
          titleTextStyle: TextStyle(color: Colors.white, fontSize: 20),
          backgroundColor: Colors.indigo,
        ),
        body: Container(
          child: Column(children: [
            TextField(
              decoration: InputDecoration(hintText: 'name'),
            ),
            TextField(
              decoration: InputDecoration(hintText: 'avatar'),
            ),
            TextField(
              decoration: InputDecoration(hintText: 'message'),
            ),
            ElevatedButton(onPressed: () {}, child: Text('Submit'))
          ]),
        ));
  }
}
