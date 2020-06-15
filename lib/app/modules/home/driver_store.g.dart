// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'driver_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$DriverStore on _DriverStoreBase, Store {
  final _$positionStreamAtom = Atom(name: '_DriverStoreBase.positionStream');

  @override
  ObservableStream<dynamic> get positionStream {
    _$positionStreamAtom.reportRead();
    return super.positionStream;
  }

  @override
  set positionStream(ObservableStream<dynamic> value) {
    _$positionStreamAtom.reportWrite(value, super.positionStream, () {
      super.positionStream = value;
    });
  }

  final _$latAtom = Atom(name: '_DriverStoreBase.lat');

  @override
  double get lat {
    _$latAtom.reportRead();
    return super.lat;
  }

  @override
  set lat(double value) {
    _$latAtom.reportWrite(value, super.lat, () {
      super.lat = value;
    });
  }

  final _$lngAtom = Atom(name: '_DriverStoreBase.lng');

  @override
  double get lng {
    _$lngAtom.reportRead();
    return super.lng;
  }

  @override
  set lng(double value) {
    _$lngAtom.reportWrite(value, super.lng, () {
      super.lng = value;
    });
  }

  final _$gestorIdAtom = Atom(name: '_DriverStoreBase.gestorId');

  @override
  String get gestorId {
    _$gestorIdAtom.reportRead();
    return super.gestorId;
  }

  @override
  set gestorId(String value) {
    _$gestorIdAtom.reportWrite(value, super.gestorId, () {
      super.gestorId = value;
    });
  }

  final _$_DriverStoreBaseActionController =
      ActionController(name: '_DriverStoreBase');

  @override
  Stream<dynamic> streamLocate() {
    final _$actionInfo = _$_DriverStoreBaseActionController.startAction(
        name: '_DriverStoreBase.streamLocate');
    try {
      return super.streamLocate();
    } finally {
      _$_DriverStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
positionStream: ${positionStream},
lat: ${lat},
lng: ${lng},
gestorId: ${gestorId}
    ''';
  }
}
