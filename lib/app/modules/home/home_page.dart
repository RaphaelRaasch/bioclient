import 'package:bioclient/app/modules/home/driver_store.dart';
import 'package:bioclient/app/modules/home/widgets/card.widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'home_controller.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key key, this.title = "Home"}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeController> {
  //use 'controller' variable to access controller
  GoogleMapController mapController;
  DriverStore driver = Modular.get();
  void onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  void mapLocate() {}

  @override
  void initState() {
    driver.gestorId = controller.userStore.userModel.userId.toString();
    print(controller.userStore.userModel.userId.toString());
    super.initState();
  }

  Set<Marker> markers = Set<Marker>();

  @override
  Widget build(BuildContext context) {
    final user = controller.userStore.userModel;
    final lat = -19.899133;
    final lng = -43.1453819;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('MAP'),
        centerTitle: true,
        elevation: 5,
      ),
      body: SafeArea(
        child: Observer(
          builder: (context) {
            return Container(
              height: double.maxFinite,
              child: CardHome(
                pressed: () async {
                  driver.streamLocate();
                  await Future.delayed(Duration(milliseconds: 2000));
                  mapController.moveCamera(
                      CameraUpdate.newLatLng(LatLng(driver.lat, driver.lng)));

                  final Marker marker = Marker(
                    markerId: MarkerId('cliente'),
                    position: LatLng(driver.lat, driver.lng),
                  );

                  setState(() {
                    markers.add(marker);
                  });
                },
                positioned: controller.card == false ? -640.0 : -200.0,
                callback: () {
                  controller.openCard();
                },
                map: Container(
                  height: double.maxFinite,
                  color: Colors.purple,
                  child: GoogleMap(
                    markers: markers,
                    onMapCreated: onMapCreated,
                    zoomControlsEnabled: false,
                    initialCameraPosition: CameraPosition(
                      target: LatLng(lat, lng),
                      zoom: 16,
                    ),
                  ),
                ),
                username: user.email,
                firstName: user.firstName,
                lastName: user.lastName,
                phone: user.fone,
              ),
            );
          },
        ),
      ),
    );
  }
}
