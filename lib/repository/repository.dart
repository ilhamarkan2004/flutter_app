import 'dart:convert';

import 'package:flutter_application_1/models/model.dart';
import 'package:http/http.dart' as http;

class Repository {
  final _baseUrl = "https://65af6c862f26c3f2139ab914.mockapi.io/users";

  Future getData() async {
    try {
      final response = await http.get(Uri.parse(_baseUrl));

      if (response.statusCode == 200) {
        Iterable it = jsonDecode(response.body);
        List<Person> persons = it.map((json) => Person.fromJson(json)).toList();
        return persons;
      }
    } catch (e) {
      print(e.toString());
    }
  }

  Future postData(String name, String avatar, String message) async {
    try {
      final response = await http.post(Uri.parse(_baseUrl),
          body: {"name": name, "avatar": avatar, "message": message});

      if (response.statusCode == 201) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      print(e.toString());
    }
  }

  Future putData(int id, String name, String avatar, String message) async {
    try {
      final response = await http.put(Uri.parse(_baseUrl + '/' + id.toString()),
          body: {"name": name, "avatar": avatar, "message": message});

      if (response.statusCode == 201) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
