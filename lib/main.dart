import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/model.dart';
import 'package:flutter_application_1/repository/repository.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: MyHome());
  }
}

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
                subtitle: Text(persons[index].message)),
            separatorBuilder: (context, index) => Divider(),
            itemCount: persons.length));
  }
}
