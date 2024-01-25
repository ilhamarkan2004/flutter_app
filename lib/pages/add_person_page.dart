import 'package:flutter/material.dart';
import 'package:flutter_application_1/repository/repository.dart';

class AddPerson extends StatefulWidget {
  static String route = '/add-person';
  const AddPerson({super.key});

  @override
  State<AddPerson> createState() => _AddPersonState();
}

class _AddPersonState extends State<AddPerson> {
  Repository repository = Repository();
  final _nameController = TextEditingController();
  final _avatarController = TextEditingController();
  final _messageController = TextEditingController();
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
              controller: _nameController,
              decoration: InputDecoration(hintText: 'name'),
            ),
            TextField(
              controller: _avatarController,
              decoration: InputDecoration(hintText: 'avatar'),
            ),
            TextField(
              controller: _messageController,
              decoration: InputDecoration(hintText: 'message'),
            ),
            ElevatedButton(
                onPressed: () async {
                  bool response = await repository.postData(
                      _nameController.text,
                      _avatarController.text,
                      _messageController.text);

                  if (response) {
                    Navigator.of(context).pop();
                  } else {
                    print('Post data failed!');
                  }
                },
                child: Text('Submit'))
          ]),
        ));
  }
}
