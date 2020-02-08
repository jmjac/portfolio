import 'package:mobx/mobx.dart';
import 'package:portfolio/black_rock/black_rock_api_portfolio.dart';

part 'investment_store.g.dart';

class InvestmentStore = _InvestmentStore with _$InvestmentStore;

abstract class _InvestmentStore with Store {
  BlackRockAPIPortfolio portfolio = BlackRockAPIPortfolio(positions: {
    "PMADX": 24.38,
    "PBEAX": 333.79,
    "SUWBX": 44.76,
    "CATNX": 300.49,
    "AAPL": 100.00,
  });

  @observable
  double totalGain;
}
