import 'package:mobx/mobx.dart';

part 'goal_form_store.g.dart';

class GoalFormStore = _GoalFormStore with _$GoalFormStore;

abstract class _GoalFormStore with Store {
  @observable
  String name;
  @observable
  int startDate;
  @observable
  int endDate;
  @observable
  double goalPrice;
  @observable
  double initialInvestment;
  @observable
  int icon;
  @observable
  List<String> positions = [];

  @action
  void setName(String value) {
    name = value;
  }

  @action
  void setStartDate(int value) {
    startDate = value;
  }

  @action
  void setEndDate(int value) {
    endDate = value;
  }

  @action
  void setGoalPrice(double value) {
    goalPrice = value;
  }

  @action
  void setInitialInvestment(double value) {
    initialInvestment = value;
  }

  @action
  setIcon(int value) {
    icon = value;
  }
}
