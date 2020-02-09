import 'package:mobx/mobx.dart';
import 'package:portfolio/black_rock/black_rock_api_portfolio.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'investment_store.g.dart';

class InvestmentStore extends _InvestmentStore with _$InvestmentStore {
  InvestmentStore(BlackRockAPIPortfolio portfolio, SharedPreferences preferences) : super(portfolio, preferences);
}

abstract class _InvestmentStore with Store {
  _InvestmentStore(this.portfolio, this._preferences);

  SharedPreferences _preferences;

  BlackRockAPIPortfolio portfolio = BlackRockAPIPortfolio(
      positions: {"AOGIX": 66.23, "SSBTX": 33.77},
      startDate: 1546300800000,
      calculatePerformance: true,
      onlyMonthEndPerfChart: true);

  @observable
  double totalGain = 0;

  @observable
  double monthChange = 0;

  @observable
  double initialInvestment = 0;

  @observable
  double added = 0;

  @action
  Future<void> calculateChange() async {
    Map<String, dynamic> returnsMap = await portfolio.getReturnsMap();
    for (String date in returnsMap.keys) {
      monthChange = returnsMap[date]["oneMonth"] * initialInvestment;
      totalGain = returnsMap[date]["level"] * initialInvestment;
    }
  }

  @action
  void loadGeneralPortfolio(){
//    portfolio = _preferences.getString("portfolio");
//
  }
  @action
  void setAddToInvestment(double add) {
    this.added = add;
  }
  @action
  void addToInvestment() {
    initialInvestment += added;
    monthChange = initialInvestment * .021;
  }


}
