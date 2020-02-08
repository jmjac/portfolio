import 'dart:convert';

import 'dart:async';
import 'package:http/http.dart' as http;

class BlackRockAPIPortfolio {
  String requestUrl;
  String _baseUrl =
      "https://www.blackrock.com/tools/hackathon/portfolio-analysis?";

  BlackRockAPIPortfolio(
      {Map<String, double> positions,
      bool calculateExposures,
      bool calculatePerformance,
      bool calculateStressTests,
      bool calculateRisk,
      bool calculateExpectedReturns}) {
    if (calculateExposures != null) {
      _addCalculateExposures(calculateExposures);
    }

    if (calculatePerformance != null) {
      _addCalculatePerformance(calculatePerformance);
    }

    if (calculateStressTests != null) {
      _addCalculateStressTests(calculateStressTests);
    }

    if (calculateRisk != null) {
      _addCalculateRisk(calculateRisk);
    }

    if (calculateExpectedReturns != null) {
      _addCalculateExpectedReturns(calculateExpectedReturns);
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

  void _addCalculateExposures(bool value) {
    _baseUrl += _baseUrl.endsWith("?") ? "" : "&";
    _baseUrl += "calculateExposures=$value";
  }

  void _addCalculatePerformance(bool value) {
    _baseUrl += _baseUrl.endsWith("?") ? "" : "&";
    _baseUrl += "calculatePerformance=$value";
  }

  void _addCalculateStressTests(bool value) {
    _baseUrl += _baseUrl.endsWith("?") ? "" : "&";
    _baseUrl += "calculateStressTests=$value";
  }

  void _addCalculateRisk(bool value) {
    _baseUrl += _baseUrl.endsWith("?") ? "" : "&";
    _baseUrl += "calculateRisk=$value";
  }

  void _addCalculateExpectedReturns(bool value) {
    _baseUrl += _baseUrl.endsWith("?") ? "" : "&";
    _baseUrl += "calculateExpectedReturns=$value";
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
