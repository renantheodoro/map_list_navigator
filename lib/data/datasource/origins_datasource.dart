import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:map_navigation/data/models/adapters/ancestry.dart';
import 'package:map_navigation/data/models/origins_result_model.dart';

class OriginsDataSource {
  Future<String> _fixture(String name) async =>
      await rootBundle.loadString('assets/fixtures/$name');

  Future<OriginsResultModel> getResult() async {
    String response = await _fixture('result.json');

    OriginsResultModel result =
        OriginsResultModelAdapter.fromJson(jsonDecode(response) as Map<String, dynamic>);

    return result;
  }
}
