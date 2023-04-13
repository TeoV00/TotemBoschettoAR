import 'package:firebase_database/firebase_database.dart';
import 'package:totem_boschetto/model/share_data_model.dart';

class FirebaseProvider {
  Future<List<SharedData>> getTotemData({required String totemId}) async {
    List<SharedData> sharedUserData = [];
    DatabaseReference dbRef = FirebaseDatabase.instance.ref();
    DataSnapshot snap = await dbRef.child("totems/$totemId").get();

    if (snap.exists) {
      sharedUserData = snap.children
          .map((e) =>
              SharedData.fromMap(Map<String, dynamic>.from(e.value as Map)))
          .toList();
    }
    return sharedUserData;
  }
}
