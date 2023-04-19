import 'dart:developer';
import 'package:firebase_database/firebase_database.dart';
import 'package:totem_boschetto/model/share_data_model.dart';

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

  String getCurrentTotemId() {
    return _totemId;
  }
}
