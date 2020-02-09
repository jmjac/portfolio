import 'package:mobx/mobx.dart';
import 'package:portfolio/black_rock/store/black_rock.dart';

part 'investment_add_store.g.dart';

class InvestmentAddStore extends _InvestmentAddStore with _$InvestmentAddStore {
}

abstract class _InvestmentAddStore with Store {
  final Map<String, String> companyMap = {
    "BLK": "BlackRock, Inc.",
    "AAPL": "Apple Inc",
    "SPY": "S&P 500 Stock Market Index (ETF)",
    "VT": "Vanguard Total World Stock ETF",
    "QQQ": "Invesco QQQ Trust ETF",
    "MSFT": "Microsoft Corporation",
    "FB": "Facebook, Inc.",
    "JPM": "JPMorgan Chase & Co.",
    "MCD": "Mcdonald's Corporation",
    "WMT": "Walmart Inc.",
    "XLP": "Consumer Staples Select Sect ETF"
  };

  @observable
  String companyTicker;

  @observable
  double price;

  @observable
  double percentage;

  @computed
  String get companyName => companyMap[companyTicker] ?? "Not in the database";

  @action
  void setCompanyTicker(String value) {
    companyTicker = value;
  }

  @action
  void setPrice(double value) {
    price = value;
  }

  @action
  void setPercentage(double value) {
    percentage = value;
  }

  @action
  bool validateAndSubmit(BlackRockStore blackRockStore) {
    print("Validation start");
    if (price != null &&
        companyTicker != null &&
        companyName != "Not in the database" &&
        percentage != null) {
      Map<String, double> portfolioMap = blackRockStore.portfolio.positionsMap;
      portfolioMap[companyTicker] = percentage;
      blackRockStore.portfolio.changePositions(portfolioMap);
      blackRockStore.mainData();
      print("Validated");
      return true;
    }
    print("Not valid");
    return false;
  }
}
