import 'dart:convert';

import 'package:flutter/material.dart';
import 'dart:async';
import 'package:http/http.dart' as http;

class BlackRockAPI {
  String requestUrl;
  String _baseUrl = "https://www.blackrock.com/tools/hackathon/";
  String _performanceData = "performance-data?";
  String _portfolioAnalysis = "portfolio-analysis?";
  Map<String, String> header;

  BlackRockAPI({@required bool isAnalysis, Map<String, double> positions}) {
    _baseUrl += isAnalysis ? _portfolioAnalysis : _performanceData;
    if (positions != null) {
      header = _addPositionsParameted(positions);
    }
  }

  //Converts the list of positions to tags working for the api request
  Map<String, String> _addPositionsParameted(Map<String, double> positions) {
    Map<String, String> positionsParameter;
    for (String position in positions.keys) {
      positionsParameter[] "identifiers=$position~${positions[position]}";
    }
    return positionsParameter;
  }

  Future<Map<String, dynamic>> makeRequest() async {
    var client = http.Client();
    var response = await client.get(_baseUrl);
    var resultMap = json.decode(response.body)["resultMap"];
    print("$_baseUrl");
    print("=======");
    print(resultMap["PORTFOLIOS"][0]);
    return json.decode(response.body);
  }
}
