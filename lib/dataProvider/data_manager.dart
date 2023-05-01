import 'dart:developer';

import 'package:firebase_database/firebase_database.dart';
import 'package:totem_boschetto/model/share_data_model.dart';
import 'package:totem_boschetto/unit_converter.dart';
import 'package:totem_boschetto/views/statistic_widgets/statistics_constant.dart';

abstract class DataUpdatedNotifier {
  void notifyDataUpdate();
}

class DataManager {
  final String _totemId = "ces_remade";
  final List<DataUpdatedNotifier> _observerList = [];
  late final DatabaseReference dbRef;

  DataManager() {
    dbRef = FirebaseDatabase.instance.ref("totems/$_totemId");
    dbRef.onChildAdded.listen((event) {
      log("Dati utente caricati correttamente ");
      _notifyObservers();
    });
    dbRef.onChildChanged.listen((event) {
      log("Dati caricati correttamente ");
      _notifyObservers();
    });
  }

  void addDataUpdateObserver(DataUpdatedNotifier observer) {
    _observerList.add(observer);
  }

  void _notifyObservers() {
    for (var element in _observerList) {
      element.notifyDataUpdate;
    }
  }

  Future<List<SharedData>> getTotemData() async {
    List<SharedData> sharedUserData = [];
    DataSnapshot snap = await dbRef.get();

    if (snap.exists) {
      sharedUserData = snap.children
          .map((e) =>
              SharedData.fromMap(Map<String, dynamic>.from(e.value as Map)))
          .toList();
    }
    return sharedUserData;
  }

  /// Get ordered list of 10 user SharedData. If fecthed data from online db
  /// are less than 10 the correspodnit absent item in list is set top null.
  /// return List of SharedData
  Future<List<SharedData?>> getTop10User() async {
    const counLimit = 10;
    var data = await getTotemData();
    data.sort((a, b) => b.co2.compareTo(a.co2));

    List<SharedData?> top10 = [];
    for (int i = 0; i < counLimit; i++) {
      if (i < data.length) {
        top10.add(data[i]);
      } else {
        top10.add(null);
      }
    }

    return top10;
  }

  String getCurrentTotemId() {
    return _totemId;
  }

  Future<Map<StatId, String>> getStatistics() async {
    List<SharedData> totemData = await getTotemData();
    double co2 = 0;
    int trees = 0;
    int paper = 0;

    for (SharedData usr in totemData) {
      co2 += usr.co2;
      trees += usr.treesCount;
      paper += usr.paper;
    }

    return {
      StatId.tree: trees.toString(),
      StatId.co2: "$co2 Kg",
      StatId.paper: "$paper fogli A4",
      StatId.ePower:
          "${UnitConverter.fromCo2ToKiloWatt(co2).toStringAsFixed(0)} KWh",
      StatId.fuel:
          "${UnitConverter.fromCo2ToBenzinaLiter(co2).toStringAsFixed(0)} Litri",
    };
  }
}
