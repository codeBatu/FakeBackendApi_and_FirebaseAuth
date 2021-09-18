import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:sample01/core/mdoels/usermodel.dart';

class ApiService {
  late final User? user;
  String baseUrl = "http://10.0.2.2:3000/posts";

  getFectData() async {
    var url = Uri.parse(baseUrl);
    var response = await http.get(url);
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {}
  }

  removeUserData(User user) async {
    var url = Uri.parse(baseUrl + "/${user.id}");
    print(url);
    var response = await http.delete(url);
  }

  postUserData(
    String? firstName,
    String? lastName,
    String? email,
  ) async {
    var url = Uri.parse(baseUrl);
    // var header = {'content-Type': 'aplication/json'};
    var response = await http.post(
      url,
      body: {"first_name": firstName, "last_name": lastName, "email": email},
    );
    if (response.statusCode == 201) {
      final responseStrimg = response.body;
      return json.encode(responseStrimg);
    }
  }
}
