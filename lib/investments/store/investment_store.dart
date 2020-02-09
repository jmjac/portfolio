import 'package:mobx/mobx.dart';
import 'package:portfolio/black_rock/black_rock_api_portfolio.dart';

part 'investment_store.g.dart';

class InvestmentStore extends _InvestmentStore with _$InvestmentStore {
  InvestmentStore(BlackRockAPIPortfolio portfolio) : super(portfolio);
}

abstract class _InvestmentStore with Store {
  _InvestmentStore(this.portfolio);

  BlackRockAPIPortfolio portfolio = BlackRockAPIPortfolio(
      positions: {"AOGIX": 66.23, "SSBTX": 33.77},
      startDate: 1546300800000,
      calculatePerformance: true,
      onlyMonthEndPerfChart: true);

  @observable
  double totalGain = 0;

  @observable
  double monthChange = 0;

  double initialInvestment = 10000;

  @action
  Future<void> calculateChange() async {
    Map<String, dynamic> returnsMap = await portfolio.getReturnsMap();
    for (String date in returnsMap.keys) {
      monthChange = returnsMap[date]["oneMonth"] * initialInvestment;
      totalGain = returnsMap[date]["level"] * initialInvestment;
    }
  }
}
