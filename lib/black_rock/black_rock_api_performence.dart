import 'dart:convert';

import 'dart:async';
import 'package:http/http.dart' as http;

class BlackRockAPIPerformance {
  String requestUrl;
  String _baseUrl =
      "https://www.blackrock.com/tools/hackathon/performance-data?";

  BlackRockAPIPerformance({
    Map<String, double> positions,
  }) {
    if (positions != null) {
      _baseUrl += _addPositionsParameted(positions);
    }
  }

  //Converts the list of positions to tags working for the api request
  String _addPositionsParameted(Map<String, double> positions) {
    String positionsParameter = "&positions=";
    for (String position in positions.keys) {
      positionsParameter += "$position~${positions[position]}%7C";
    }
    return positionsParameter;
  }

  Future<Map<String, dynamic>> _getPortfolios() async {
    var client = http.Client();
    var response = await client.get(_baseUrl);
    var resultMap = json.decode(response.body)["resultMap"];

    return resultMap["PORTFOLIOS"][0]["portfolios"];
  }

  Future<Map<String, dynamic>> makeRequest() async {
    Map<String, dynamic> portfolio = await _getPortfolios();
    return portfolio;
  }
}
