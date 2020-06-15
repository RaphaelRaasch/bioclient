import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mobx/mobx.dart';

part 'driver_store.g.dart';

class DriverStore = _DriverStoreBase with _$DriverStore;

abstract class _DriverStoreBase with Store {
  @observable
  ObservableStream positionStream;
  @observable
  double lat;
  @observable
  double lng;
  @observable
  String gestorId;

  @action
  Stream streamLocate() {
    StreamSubscription positionStream = Firestore.instance
        .collection('userLocate')
        .document(gestorId)
        .snapshots()
        .listen((event) {
      lat = event.data['latitude'];
      lng = event.data['longitude'];
      print(event.data['latitude']);
    });
  }
}
