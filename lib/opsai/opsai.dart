import 'dart:convert';

import './config.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class OpsAiProvider extends ChangeNotifier {
  List<String> conversion = [];

  TextEditingController controller = TextEditingController();

  bool _isLoading = false;

  String askMessage(String query) {
    String message = chatRules;
    message += conversion
        .sublist(0, conversion.length - 1)
        .map((e) => conversion.indexOf(e) % 2 == 0 ? 'User: "$e"' : e)
        .toList()
        .join("\n");
    return jsonEncode({
      'data': {
        'message': message,
      }
    });
  }

  Future askGPT(String query) async {
    conversion.add(query);
    controller.text = "";
    conversion.add("...");
    notifyListeners();

    try {
      final response = await http.post(
        opsaiApi,
        headers: headers,
        body: askMessage(conversion.last),
      );

      if (response.statusCode == 200) {
        conversion.last =
            jsonDecode(response.body)["result"]["choices"][0]["text"];
      } else {
        conversion.last = "Try later !! (status: ${response.statusCode} )";
      }
    } catch (e) {
      conversion.last = e.toString();
    }
    notifyListeners();
  }

  Future submit() async {
    if (loading) return;

    loading = true;
    notifyListeners();
    await askGPT(controller.text);
    loading = false;
    notifyListeners();
  }

  set loading(bool isLoading) {
    _isLoading = isLoading;
    notifyListeners();
  }

  bool get loading => _isLoading;
}
