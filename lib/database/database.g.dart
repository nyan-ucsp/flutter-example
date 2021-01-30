// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class Category extends DataClass implements Insertable<Category> {
  final int categoryId;
  final String categoryName;
  Category({@required this.categoryId, @required this.categoryName});
  factory Category.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    return Category(
      categoryId: intType
          .mapFromDatabaseResponse(data['${effectivePrefix}category_id']),
      categoryName: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}category_name']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || categoryId != null) {
      map['category_id'] = Variable<int>(categoryId);
    }
    if (!nullToAbsent || categoryName != null) {
      map['category_name'] = Variable<String>(categoryName);
    }
    return map;
  }

  CategoriesCompanion toCompanion(bool nullToAbsent) {
    return CategoriesCompanion(
      categoryId: categoryId == null && nullToAbsent
          ? const Value.absent()
          : Value(categoryId),
      categoryName: categoryName == null && nullToAbsent
          ? const Value.absent()
          : Value(categoryName),
    );
  }

  factory Category.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return Category(
      categoryId: serializer.fromJson<int>(json['categoryId']),
      categoryName: serializer.fromJson<String>(json['categoryName']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'categoryId': serializer.toJson<int>(categoryId),
      'categoryName': serializer.toJson<String>(categoryName),
    };
  }

  Category copyWith({int categoryId, String categoryName}) => Category(
        categoryId: categoryId ?? this.categoryId,
        categoryName: categoryName ?? this.categoryName,
      );
  @override
  String toString() {
    return (StringBuffer('Category(')
          ..write('categoryId: $categoryId, ')
          ..write('categoryName: $categoryName')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(categoryId.hashCode, categoryName.hashCode));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is Category &&
          other.categoryId == this.categoryId &&
          other.categoryName == this.categoryName);
}

class CategoriesCompanion extends UpdateCompanion<Category> {
  final Value<int> categoryId;
  final Value<String> categoryName;
  const CategoriesCompanion({
    this.categoryId = const Value.absent(),
    this.categoryName = const Value.absent(),
  });
  CategoriesCompanion.insert({
    this.categoryId = const Value.absent(),
    @required String categoryName,
  }) : categoryName = Value(categoryName);
  static Insertable<Category> custom({
    Expression<int> categoryId,
    Expression<String> categoryName,
  }) {
    return RawValuesInsertable({
      if (categoryId != null) 'category_id': categoryId,
      if (categoryName != null) 'category_name': categoryName,
    });
  }

  CategoriesCompanion copyWith(
      {Value<int> categoryId, Value<String> categoryName}) {
    return CategoriesCompanion(
      categoryId: categoryId ?? this.categoryId,
      categoryName: categoryName ?? this.categoryName,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (categoryId.present) {
      map['category_id'] = Variable<int>(categoryId.value);
    }
    if (categoryName.present) {
      map['category_name'] = Variable<String>(categoryName.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CategoriesCompanion(')
          ..write('categoryId: $categoryId, ')
          ..write('categoryName: $categoryName')
          ..write(')'))
        .toString();
  }
}

class $CategoriesTable extends Categories
    with TableInfo<$CategoriesTable, Category> {
  final GeneratedDatabase _db;
  final String _alias;
  $CategoriesTable(this._db, [this._alias]);
  final VerificationMeta _categoryIdMeta = const VerificationMeta('categoryId');
  GeneratedIntColumn _categoryId;
  @override
  GeneratedIntColumn get categoryId => _categoryId ??= _constructCategoryId();
  GeneratedIntColumn _constructCategoryId() {
    return GeneratedIntColumn('category_id', $tableName, false,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _categoryNameMeta =
      const VerificationMeta('categoryName');
  GeneratedTextColumn _categoryName;
  @override
  GeneratedTextColumn get categoryName =>
      _categoryName ??= _constructCategoryName();
  GeneratedTextColumn _constructCategoryName() {
    return GeneratedTextColumn('category_name', $tableName, false,
        minTextLength: 1, maxTextLength: 100, $customConstraints: 'UNIQUE');
  }

  @override
  List<GeneratedColumn> get $columns => [categoryId, categoryName];
  @override
  $CategoriesTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'categories';
  @override
  final String actualTableName = 'categories';
  @override
  VerificationContext validateIntegrity(Insertable<Category> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('category_id')) {
      context.handle(
          _categoryIdMeta,
          categoryId.isAcceptableOrUnknown(
              data['category_id'], _categoryIdMeta));
    }
    if (data.containsKey('category_name')) {
      context.handle(
          _categoryNameMeta,
          categoryName.isAcceptableOrUnknown(
              data['category_name'], _categoryNameMeta));
    } else if (isInserting) {
      context.missing(_categoryNameMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {categoryId};
  @override
  Category map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return Category.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $CategoriesTable createAlias(String alias) {
    return $CategoriesTable(_db, alias);
  }
}

class Product extends DataClass implements Insertable<Product> {
  final int productId;
  final int categoryId;
  final String productName;
  Product(
      {@required this.productId,
      @required this.categoryId,
      @required this.productName});
  factory Product.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    return Product(
      productId:
          intType.mapFromDatabaseResponse(data['${effectivePrefix}product_id']),
      categoryId: intType
          .mapFromDatabaseResponse(data['${effectivePrefix}category_id']),
      productName: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}product_name']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || productId != null) {
      map['product_id'] = Variable<int>(productId);
    }
    if (!nullToAbsent || categoryId != null) {
      map['category_id'] = Variable<int>(categoryId);
    }
    if (!nullToAbsent || productName != null) {
      map['product_name'] = Variable<String>(productName);
    }
    return map;
  }

  ProductsCompanion toCompanion(bool nullToAbsent) {
    return ProductsCompanion(
      productId: productId == null && nullToAbsent
          ? const Value.absent()
          : Value(productId),
      categoryId: categoryId == null && nullToAbsent
          ? const Value.absent()
          : Value(categoryId),
      productName: productName == null && nullToAbsent
          ? const Value.absent()
          : Value(productName),
    );
  }

  factory Product.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return Product(
      productId: serializer.fromJson<int>(json['productId']),
      categoryId: serializer.fromJson<int>(json['categoryId']),
      productName: serializer.fromJson<String>(json['productName']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'productId': serializer.toJson<int>(productId),
      'categoryId': serializer.toJson<int>(categoryId),
      'productName': serializer.toJson<String>(productName),
    };
  }

  Product copyWith({int productId, int categoryId, String productName}) =>
      Product(
        productId: productId ?? this.productId,
        categoryId: categoryId ?? this.categoryId,
        productName: productName ?? this.productName,
      );
  @override
  String toString() {
    return (StringBuffer('Product(')
          ..write('productId: $productId, ')
          ..write('categoryId: $categoryId, ')
          ..write('productName: $productName')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      productId.hashCode, $mrjc(categoryId.hashCode, productName.hashCode)));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is Product &&
          other.productId == this.productId &&
          other.categoryId == this.categoryId &&
          other.productName == this.productName);
}

class ProductsCompanion extends UpdateCompanion<Product> {
  final Value<int> productId;
  final Value<int> categoryId;
  final Value<String> productName;
  const ProductsCompanion({
    this.productId = const Value.absent(),
    this.categoryId = const Value.absent(),
    this.productName = const Value.absent(),
  });
  ProductsCompanion.insert({
    this.productId = const Value.absent(),
    @required int categoryId,
    @required String productName,
  })  : categoryId = Value(categoryId),
        productName = Value(productName);
  static Insertable<Product> custom({
    Expression<int> productId,
    Expression<int> categoryId,
    Expression<String> productName,
  }) {
    return RawValuesInsertable({
      if (productId != null) 'product_id': productId,
      if (categoryId != null) 'category_id': categoryId,
      if (productName != null) 'product_name': productName,
    });
  }

  ProductsCompanion copyWith(
      {Value<int> productId,
      Value<int> categoryId,
      Value<String> productName}) {
    return ProductsCompanion(
      productId: productId ?? this.productId,
      categoryId: categoryId ?? this.categoryId,
      productName: productName ?? this.productName,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (productId.present) {
      map['product_id'] = Variable<int>(productId.value);
    }
    if (categoryId.present) {
      map['category_id'] = Variable<int>(categoryId.value);
    }
    if (productName.present) {
      map['product_name'] = Variable<String>(productName.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ProductsCompanion(')
          ..write('productId: $productId, ')
          ..write('categoryId: $categoryId, ')
          ..write('productName: $productName')
          ..write(')'))
        .toString();
  }
}

class $ProductsTable extends Products with TableInfo<$ProductsTable, Product> {
  final GeneratedDatabase _db;
  final String _alias;
  $ProductsTable(this._db, [this._alias]);
  final VerificationMeta _productIdMeta = const VerificationMeta('productId');
  GeneratedIntColumn _productId;
  @override
  GeneratedIntColumn get productId => _productId ??= _constructProductId();
  GeneratedIntColumn _constructProductId() {
    return GeneratedIntColumn('product_id', $tableName, false,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _categoryIdMeta = const VerificationMeta('categoryId');
  GeneratedIntColumn _categoryId;
  @override
  GeneratedIntColumn get categoryId => _categoryId ??= _constructCategoryId();
  GeneratedIntColumn _constructCategoryId() {
    return GeneratedIntColumn(
      'category_id',
      $tableName,
      false,
    );
  }

  final VerificationMeta _productNameMeta =
      const VerificationMeta('productName');
  GeneratedTextColumn _productName;
  @override
  GeneratedTextColumn get productName =>
      _productName ??= _constructProductName();
  GeneratedTextColumn _constructProductName() {
    return GeneratedTextColumn('product_name', $tableName, false,
        minTextLength: 1, maxTextLength: 1000, $customConstraints: 'UNIQUE');
  }

  @override
  List<GeneratedColumn> get $columns => [productId, categoryId, productName];
  @override
  $ProductsTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'products';
  @override
  final String actualTableName = 'products';
  @override
  VerificationContext validateIntegrity(Insertable<Product> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('product_id')) {
      context.handle(_productIdMeta,
          productId.isAcceptableOrUnknown(data['product_id'], _productIdMeta));
    }
    if (data.containsKey('category_id')) {
      context.handle(
          _categoryIdMeta,
          categoryId.isAcceptableOrUnknown(
              data['category_id'], _categoryIdMeta));
    } else if (isInserting) {
      context.missing(_categoryIdMeta);
    }
    if (data.containsKey('product_name')) {
      context.handle(
          _productNameMeta,
          productName.isAcceptableOrUnknown(
              data['product_name'], _productNameMeta));
    } else if (isInserting) {
      context.missing(_productNameMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {productId};
  @override
  Product map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return Product.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $ProductsTable createAlias(String alias) {
    return $ProductsTable(_db, alias);
  }
}

abstract class _$Database extends GeneratedDatabase {
  _$Database(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  $CategoriesTable _categories;
  $CategoriesTable get categories => _categories ??= $CategoriesTable(this);
  $ProductsTable _products;
  $ProductsTable get products => _products ??= $ProductsTable(this);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [categories, products];
}
