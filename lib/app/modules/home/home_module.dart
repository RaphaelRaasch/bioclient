import 'package:bioclient/app/modules/home/driver_store.dart';
import 'package:bioclient/app/modules/home/home_controller.dart';
import 'package:bioclient/app/shared/stores/user_store.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:bioclient/app/modules/home/home_page.dart';

class HomeModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => DriverStore()),
        Bind((i) => HomeController(Modular.get<UserStore>())),
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, child: (_, args) => HomePage()),
      ];

  static Inject get to => Inject<HomeModule>.of();
}
