import 'dart:convert';

import 'package:bioclient/app/shared/const.dart';
import 'package:bioclient/app/shared/models/user_model.dart';
import 'package:bioclient/app/shared/stores/user_store.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:http/http.dart' as http;
import 'package:mobx/mobx.dart';

part 'login_controller.g.dart';

class LoginController = _LoginControllerBase with _$LoginController;

abstract class _LoginControllerBase with Store {
  final UserStore _store;

  _LoginControllerBase(this._store);

  @observable
  String email = '';
  @observable
  String password = '';

  @observable
  bool visible = false;

  @action
  isVisible() {
    visible = !visible;
  }

  @action
  Future login() async {
    var response = await http
        .post(AUTH_URL, body: {'username': email, 'password': password});
    try {
      var data = json.decode(response.body);
      var user = UserModel.fromJson(data);
      _store.setUser(user);
      print(user.firstName);
      Modular.to.pushReplacementNamed('/home');
    } catch (e) {
      print(e.toString());
    }
  }

  @action
  void loginPressed() {
    if (email.isEmpty || password.isEmpty) {
      return null;
    } else {
      login();
    }
  }
}
