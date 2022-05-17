import 'package:sembast/sembast.dart';

abstract class BaseDatasource<T> {
  Future<dynamic> insert(T data);
  Future<int> count();
  Future<List<T>> getAllSortedByFilter({List<Filter>? filters});
  Future<int> update(T data);
  Future<int> delete(T data);
  Future<void> deleteAll();

  String get storeName;
}
