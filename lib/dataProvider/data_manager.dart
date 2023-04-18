import 'package:totem_boschetto/DataProvider/firebase_provider.dart';
import 'package:totem_boschetto/model/share_data_model.dart';

class DataManager {
  late FirebaseProvider _firebaseProvider;

  DataManager() {
    _firebaseProvider = FirebaseProvider();
  }

  Future<List<SharedData>> getTotemData() {
    return _firebaseProvider.getTotemData(totemId: getCurrentTotemId());
  }

  String getCurrentTotemId() {
    //TODO: make that editable and save in preferences
    return "ces_remade";
  }
}
