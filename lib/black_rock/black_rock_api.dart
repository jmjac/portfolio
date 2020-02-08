import 'dart:convert';

import 'dart:async';
import 'package:http/http.dart' as http;

class BlackRockAPI {
  String requestUrl;
  String _baseUrl = "https://www.blackrock.com/tools/hackathon/";
  String _performanceData = "performance-data?";
  String _portfolioAnalysis = "portfolio-analysis?";

  BlackRockAPI(
      {bool isAnalysis,
      Map<String, double> positions,
      bool calculateExposures,
      bool calculatePerformance}) {
    _baseUrl += isAnalysis ? _portfolioAnalysis : _performanceData;

    if (calculateExposures != null) {
      _addCalculateExposures(calculateExposures);
    }
    if (calculatePerformance != null) {
      _addCalculatePerformance(calculatePerformance);
    }

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

  String _addCalculateExposures(bool value) {
    _baseUrl += _baseUrl.endsWith("?") ? "" : "&";
    _baseUrl += "calculateExposures=$value";
  }

  String _addCalculatePerformance(bool value) {
    _baseUrl += _baseUrl.endsWith("?") ? "" : "&";
    _baseUrl += "calculatePerformance=$value";
  }

  Future<Map<String, dynamic>> makeRequest() async {
    var client = http.Client();

    var response = await client.get(_baseUrl);
    var resultMap = json.decode(response.body)["resultMap"];

    print(_baseUrl);

    print(resultMap["PORTFOLIOS"][0]["portfolios"][0]["returns"]);
    return json.decode(response.body);
  }
}
