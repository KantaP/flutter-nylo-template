import 'package:sembast/sembast.dart';

class DatasourceService {
  final String storeName = ""; 
  late Database database;
  late StoreRef storeRef;

  DatasourceService(Database db) {
    database = db;
    init();
  }

  void init() {
    storeRef = intMapStoreFactory.store(storeName);
  }
}
