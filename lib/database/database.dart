import 'dart:io';

import 'package:flutter_example/database/models/CategoryWithProductCount.dart';
import 'package:moor/ffi.dart';
import 'package:moor/moor.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

part 'database.g.dart';

@DataClassName("Category")
class Categories extends Table {
  IntColumn get categoryId => integer().autoIncrement().named('category_id')();
  TextColumn get categoryName => text()
      .withLength(min: 1, max: 100)
      .named('category_name')
      .customConstraint('UNIQUE')();
}

class Products extends Table {
  IntColumn get productId => integer().autoIncrement().named('product_id')();
  IntColumn get categoryId => integer().named('category_id')();
  TextColumn get productName => text()
      .withLength(min: 1, max: 1000)
      .named('product_name')
      .customConstraint('UNIQUE')();
  @override
  List<String> get customConstraints => [
        'FOREIGN KEY(category_id) REFERENCES categories(category_id) ON DELETE CASCADE ON UPDATE CASCADE',
      ];
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'db.sqlite'));
    return VmDatabase(
      file,
      logStatements: true,
    );
  });
}

@UseMoor(tables: [Categories, Products])
class Database extends _$Database {
  Database() : super(_openConnection());
  @override
  int get schemaVersion => 1;

  // This is because due to on delete cascade and on update cascade
  StreamQueryUpdateRules get streamUpdateRules {
    return StreamQueryUpdateRules([
      WritePropagation(
        on: TableUpdateQuery.onTable(
          categories,
          limitUpdateKind: UpdateKind.delete,
        ),
        result: [
          TableUpdate.onTable(
            products,
            kind: UpdateKind.delete,
          ),
        ],
      ),
      WritePropagation(
        on: TableUpdateQuery.onTable(
          categories,
          limitUpdateKind: UpdateKind.update,
        ),
        result: [
          TableUpdate.onTable(
            products,
            kind: UpdateKind.update,
          ),
        ],
      ),
    ]);
  }

  @override
  MigrationStrategy get migration {
    return MigrationStrategy(
      beforeOpen: (details) async {
        // await customStatement('PRAGMA temp_store = MEMORY;');
        await customStatement('PRAGMA foreign_keys = ON;');
      },
    );
  }

  /// [Category Table Query]
  //? Order By CRUD Operations
  /// [CREATE]
  Future insertCategory(Category category) => into(categories).insert(category);

  /// [RETRIEVE]
  Stream<List<CategoryWithProductCount>> watchAllCategoryWithProductCount() {
    final productCount = products.productId.count();

    final query = (select(categories)
          ..orderBy(
            ([
              //? alphabetical sorting
              (t) => OrderingTerm(expression: t.categoryName),
            ]),
          ))
        .join([
      leftOuterJoin(
        products,
        products.categoryId.equalsExp(categories.categoryId),
        useColumns: false,
      ),
    ]);
    query
      ..addColumns([productCount])
      ..groupBy([categories.categoryId]);

    return query.watch().map((rows) {
      return rows.map((row) {
        return CategoryWithProductCount(
          row.readTable(categories),
          row.read(productCount),
        );
      }).toList();
    });
  }

  /// [UPDATE]
  Future updateCategory(Category category) =>
      update(categories).replace(category);

  /// [DELETE]
  Future deleteCateory(Category category) =>
      delete(categories).delete(category);
}
