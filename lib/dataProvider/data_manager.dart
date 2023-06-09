import 'package:flutter/material.dart';
import 'package:totem_boschetto/dataProvider/firebase_provider.dart';
import 'package:totem_boschetto/model/share_data_model.dart';
import 'package:totem_boschetto/unit_converter.dart';
import 'package:totem_boschetto/views/statistic_widgets/statistics_constant.dart';

class DataManager extends ChangeNotifier implements FirebaseObserver {
  final String _totemId = "ces_remade";
  late final FirebaseProvider _firebaseProvider;

  DataManager() {
    _firebaseProvider = FirebaseProvider(_totemId);
    _firebaseProvider.addObserver(this);
  }

  String getCurrentTotemId() {
    return _totemId;
  }

  Future<List<SharedData>> getData() async {
    return _firebaseProvider.getTotemData();
  }

  /// Get ordered list of 10 user SharedData. If fecthed data from online db
  /// are less than 10 the correspodnit absent item in list is set top null.
  /// return List of SharedData
  Future<List<SharedData?>> getTop10User() async {
    const counLimit = 10;
    var data = await getData();
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

  Future<Map<StatId, String>> getStatistics() async {
    List<SharedData> totemData = await getData();
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

  @override
  void firebaseNotify() {
    notifyListeners();
  }
}
