import 'package:firebase_database/firebase_database.dart';
import 'package:totem_boschetto/model/share_data_model.dart';

abstract class FirebaseObserver {
  void firebaseNotify();
}

class FirebaseProvider {
  late final DatabaseReference dbRef;
  late final String _totemId;
  final List<FirebaseObserver> _observers = [];

  FirebaseProvider(final String totemId) {
    _totemId = totemId;
    dbRef = FirebaseDatabase.instance.ref("totems");
    DatabaseReference totemRef = dbRef.child(_totemId);

    totemRef.onChildAdded.listen((event) {
      _notifyListeners();
    });
    totemRef.onChildChanged.listen((event) {
      _notifyListeners();
    });
    totemRef.onChildRemoved.listen((event) {
      _notifyListeners();
    });
  }

  Future<List<SharedData>> getTotemData() async {
    List<SharedData> sharedUserData = [];
    DataSnapshot snap = await dbRef.child(_totemId).get();
    if (snap.exists) {
      sharedUserData = snap.children
          .map((e) =>
              SharedData.fromMap(Map<String, dynamic>.from(e.value as Map)))
          .toList();
    }
    return sharedUserData;
  }

  void _notifyListeners() {
    for (var obs in _observers) {
      obs.firebaseNotify();
    }
  }

  void addObserver(final FirebaseObserver obs) {
    _observers.add(obs);
  }

  void removeObserver(final FirebaseObserver obs) {
    _observers.remove(obs);
  }
}
