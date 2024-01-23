import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/model.dart';
import 'package:flutter_application_1/repository/repository.dart';
import 'package:intl/intl.dart';

class MyHome extends StatefulWidget {
  const MyHome({super.key});

  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  List<Person> persons = [];
  Repository repository = Repository();

  getData() async {
    persons = await repository.getData();
    setState(() {});
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My App'),
        titleTextStyle: TextStyle(color: Colors.white, fontSize: 20),
        backgroundColor: Colors.indigo,
      ),
      body: ListView.separated(
          itemBuilder: (context, index) => ListTile(
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(persons[index].avatar),
                ),
                title: Text(persons[index].name),
                subtitle: Text(persons[index].message,
                    maxLines: 2, overflow: TextOverflow.ellipsis),
                trailing: Text(DateFormat.jm()
                    .format(DateTime.parse(persons[index].createdAt))),
              ),
          separatorBuilder: (context, index) => Divider(),
          itemCount: persons.length),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.of(context).pushNamed('/add-person'),
        child: Icon(Icons.add),
      ),
    );
  }
}
