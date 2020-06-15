import 'package:bioclient/app/modules/login/widgets/custom.form.widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'login_controller.dart';

class LoginPage extends StatefulWidget {
  final String title;
  const LoginPage({Key key, this.title = "Login"}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends ModularState<LoginPage, LoginController> {
  //use 'controller' variable to access controller

  @override
  Widget build(BuildContext context) {
    final sizeH = MediaQuery.of(context).size.height;
    final sizeW = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Color(0xFFF5F5F5),
      body: Center(
        child: SingleChildScrollView(
          child: Center(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 30),
              height: sizeW + sizeW,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Observer(
                    builder: (context) {
                      return Form(
                        child: Column(
                          children: <Widget>[
                            Container(
                              height: 200,
                              width: sizeW / 2,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: NetworkImage(
                                          'https://biopetroambiental.com.br/images/comum/logo-biopetro.png'),
                                      fit: BoxFit.contain)),
                            ),
                            SizedBox(
                              height: 100,
                            ),
                            CustomFormWidget(
                              type: TextInputType.emailAddress,
                              enabled: true,
                              hint: 'Email',
                              obscure: false,
                              prefix: Icon(
                                Icons.person,
                                color: Colors.black,
                              ),
                              sufix: SizedBox(),
                              width: double.maxFinite,
                              onChanged: (value) {
                                controller.email = value;
                              },
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            CustomFormWidget(
                              type: TextInputType.text,
                              enabled: true,
                              hint: 'Password',
                              obscure:
                                  controller.visible == false ? true : false,
                              prefix: Icon(
                                Icons.lock,
                                color: Colors.black,
                              ),
                              sufix: IconButton(
                                  icon: Icon(
                                    controller.visible == false
                                        ? Icons.visibility_off
                                        : Icons.visibility,
                                    color: Colors.black,
                                  ),
                                  onPressed: () {
                                    controller.isVisible();
                                  }),
                              width: double.maxFinite,
                              onChanged: (value) {
                                controller.password = value;
                              },
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                  FlatButton(
                    onPressed: () {
                      controller.loginPressed();
                    },
                    child: Text(
                      'Entrar',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 30,
                        fontWeight: FontWeight.w300,
                        shadows: [
                          Shadow(
                            blurRadius: 2,
                            color: Colors.grey,
                            offset: Offset(1, 1),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
