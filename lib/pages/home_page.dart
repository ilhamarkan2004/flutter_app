import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/model.dart';
import 'package:flutter_application_1/pages/add_person_page.dart';
import 'package:flutter_application_1/repository/repository.dart';
import 'package:intl/intl.dart';

class MyHome extends StatefulWidget {
  static String route = '/homepage';
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
          itemBuilder: (context, index) => GestureDetector(
                onTap: () async {
                  await Navigator.of(context)
                      .pushNamed(AddPerson.route, arguments: [
                    persons[index].id,
                    persons[index].name,
                    persons[index].avatar,
                    persons[index].message
                  ]);
                  getData();
                },
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(persons[index].avatar),
                  ),
                  title: Text(persons[index].name),
                  subtitle: Text(
                    persons[index].message,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        DateFormat.jm()
                            .format(DateTime.parse(persons[index].createdAt)),
                      ),
                      SizedBox(width: 8),
                      IconButton(
                        icon: Icon(
                          Icons.delete,
                          color: Colors.red,
                        ),
                        onPressed: () async {
                          // Handle delete functionality here
                          // await repository.deletePerson(persons[index].id);
                          getData(); // Refresh the list after deletion
                        },
                      ),
                    ],
                  ),
                ),
              ),
          separatorBuilder: (context, index) => Divider(),
          itemCount: persons.length),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await Navigator.pushNamed(context, AddPerson.route);
          getData();
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
