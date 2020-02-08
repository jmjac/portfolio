import 'package:portfolio/black_rock/black_rock_api_performence.dart';
import 'package:portfolio/black_rock/black_rock_api_portfolio.dart';

main() async{
  BlackRockAPIPortfolio api = BlackRockAPIPortfolio(positions: {
    "PMADX": 24.38,
    "PBEAX": 5.79,
    "SUWBX": 14.76,
    "CATNX": 3.49
  });
  Map<String, dynamic> returnsMap = await api.getReturnsMap();
  print(returnsMap);
}
