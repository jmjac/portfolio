
import 'package:mobx/mobx.dart';

part 'investment_store.g.dart';

class InvestmentStore = _InvestmentStore with _$InvestmentStore;

abstract class _InvestmentStore with Store{
  @observable
  double totalGain;
}