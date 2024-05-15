import 'dart:convert';
import 'package:http/http.dart' as http;

class HttpStateful {
  final String id, name;
  String? job, createdAt;

  HttpStateful({
    required this.id,
    required this.name,
    this.job,
    this.createdAt,
  });

  static Future<HttpStateful> connectAPI(String name, String job) async {
    var url = Uri.parse('https://reqres.in/api/users');

    var resultResponse = await http.post(
      url,
      body: {
        'name': name,
        'job': job,
      },
    );

    var data = json.decode(resultResponse.body);

    return HttpStateful(
      id: data['id'],
      name: data['name'],
      job: data['job'],
      createdAt: data['createdAt'],
    );
  }
}
