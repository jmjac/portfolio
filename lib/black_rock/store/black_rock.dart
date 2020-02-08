import 'package:mobx/mobx.dart';

part 'black_rock.g.dart';

class BlackRockStore = _BlackRockStore with _$BlackRockStore;


abstract class _BlackRockStore with Store{
  @observable
  int score = 0;
}