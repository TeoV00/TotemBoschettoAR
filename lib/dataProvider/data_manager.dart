import 'dart:developer';

import 'package:firebase_database/firebase_database.dart';
import 'package:totem_boschetto/model/share_data_model.dart';
import 'package:totem_boschetto/unit_converter.dart';
import 'package:totem_boschetto/views/statistic_widgets/statistics_constant.dart';

class DataManager {
  final String _totemId = "ces_remade";
  late final DatabaseReference dbRef;

  DataManager() {
    dbRef = FirebaseDatabase.instance.ref("totems/$_totemId");
    dbRef.onChildAdded.listen((event) {
      log("Dati utente caricati correttamente ");
    });
    dbRef.onChildChanged.listen((event) {
      log("Dati caricati correttamente ");
    });
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

  Future<List<SharedData>> getTop10User() async {
    const counLimit = 10;
    var data = await getTotemData();
    data.sort((a, b) => b.co2.compareTo(a.co2));
    List<SharedData> top10 = data
        .getRange(0, counLimit < data.length ? counLimit : data.length)
        .toList();

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
