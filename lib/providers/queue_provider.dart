import 'dart:convert';

import 'package:flutter/material.dart';

// Model
import 'package:queue/models/queue.dart';

// Package
import 'package:http/http.dart' as http;

class QueueProvider with ChangeNotifier {
  List<QueueModel> _queues = [];

  List<QueueModel> get queues => _queues;

  // API URL
  String baseUrl = 'https://api.rekalaba.com/public/transaction/queue';

  Future<void> allQueue() async {
    // URL
    Uri url = Uri.parse('$baseUrl/stores/16880?phone-number=');

    // Request
    var response = await http.get(
      url,
    );

    if (response.statusCode == 200) {
      // Parsing to variable
      List data = jsonDecode(response.body)["queueHistory"];

      //* Looping data
      if (data != null) {
        for (var item in data) {
          queues.add(
            QueueModel(
              queueNumber: item['no'],
              customerPax: item['pax'],
              customerName: item['customerName'],
              customerPhone: item['customerPhone'].toString(),
              storeName: item['storeName'],
              dateConfirm: item['dateConfirm'] == null
                  ? null
                  : DateTime.fromMillisecondsSinceEpoch(item['dateConfirm']),
              storeId: item['storeId'],
              dateIn: DateTime.fromMillisecondsSinceEpoch(item['dateIn']),
              id: item['id'],
              currentCustomer: item['currentCustomer'],
            ),
          );
        }
      }
    } else {
      throw Exception('Failed to get');
    }

    notifyListeners();
  }

  //Add Queue
  Future<void> addQueue(String name, String whatsApp, int pax) async {
    // URL
    Uri url = Uri.parse('$baseUrl');

    // body (json encode)
    var body = jsonEncode({
      "storeId": 16880,
      "customerName": name,
      "customerPhone": whatsApp,
      "pax": pax,
    });

    //* Headers
    var headers = {'Content-Type': 'application/json'};

    // request
    var response = await http.post(
      url,
      body: body,
      headers: headers,
    );

    print(jsonDecode(response.body));

    notifyListeners();
  }
}
