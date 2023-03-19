import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:app/models/data.dart';

class Api {
 // endpoint should be passed in teh function call
    static Future<List<Data>> getData() async {
        final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/todos'));
        if (response.statusCode == 200) {
        final List<dynamic> data = jsonDecode(response.body);
        return data.map((dynamic item) => Data.fromJson(item)).toList();
        } else {
        throw Exception('Failed to load data');
        }
    }
}