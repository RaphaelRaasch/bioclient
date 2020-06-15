import 'package:bioclient/app/shared/stores/user_store.dart';
import 'package:mobx/mobx.dart';

part 'home_controller.g.dart';

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  final UserStore userStore;

  _HomeControllerBase(this.userStore);

  @observable
  bool card = false;
  @action
  void openCard() {
    card = !card;
  }
}
