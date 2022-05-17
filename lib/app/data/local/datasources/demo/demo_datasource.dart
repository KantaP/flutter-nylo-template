import 'package:flutter_app/app/data/local/datasources/base_datasource.dart';
import 'package:flutter_app/app/data/local/datasources/datasource_service.dart';
import 'package:flutter_app/app/models/post.dart';
import 'package:injectable/injectable.dart';
import 'package:sembast/sembast.dart';

@Singleton()
class ExampleDataSource extends DatasourceService
    implements BaseDatasource<Post> {
  @override
  String get storeName => 'demo';

  ExampleDataSource(Database database) : super(database);

  @override
  Future<int> count() {
    return storeRef.count(database);
  }

  @override
  Future<int> delete(Post data) {
    // TODO: implement delete
    final finder = Finder(filter: Filter.byKey(data.id));
    return storeRef.delete(
      database,
      finder: finder,
    );
  }

  @override
  Future<void> deleteAll() async {
    // TODO: implement deleteAll
    await storeRef.drop(database);
  }

  @override
  Future<dynamic> insert(Post data) {
    return storeRef.add(database, data.toMap());
  }

  @override
  Future<int> update(Post data) {
    final finder = Finder(filter: Filter.byKey(data.id));
    return storeRef.update(
      database,
      data.toMap(),
      finder: finder,
    );
  }

  @override
  Future<List<Post>> getAllSortedByFilter({List<Filter>? filters}) async {
    final finder = Finder(
      filter: filters != null ? Filter.and(filters) : null,
      sortOrders: [SortOrder("id")],
    );

    final recordSnapshots = await storeRef.find(
      database,
      finder: finder,
    );

    return recordSnapshots.map((snapshot) {
      final data = Post.fromMap(snapshot.value);
      return data;
    }).toList();
  }
}
