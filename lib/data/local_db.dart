import "dart:io";
import "dart:math";

import 'dart:developer' as d;

import "package:drift/drift.dart";
import "package:drift/native.dart";
import "package:my_child_screen/child_list/model/child_model.dart";
import "package:path_provider/path_provider.dart";
import "package:sqlite3_flutter_libs/sqlite3_flutter_libs.dart";
import 'package:path/path.dart' as p;
// ignore: depend_on_referenced_packages
import 'package:sqlite3/sqlite3.dart';

part "local_db.g.dart";

class ChildListDataBase extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text().withLength(min: 1, max: 255)();
  DateTimeColumn get childDateTime => dateTime()();
  BoolColumn get gender => boolean()();
}

@DriftDatabase(tables: [ChildListDataBase])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  Future<void> testInsert() async {
    ChildListDataBaseData test = ChildListDataBaseData(
        id: 1, name: 'Test', childDateTime: DateTime.now(), gender: true);
    await into(childListDataBase).insert(test);
    d.log('ITS FROM @DRIFTDatabase class ');
    d.log('${AppDatabase().getChildren()}');
  }

  Future<int> insertChild(ChildListDataBaseCompanion child) async {
    late int result;
    try {
      result = await into(childListDataBase).insert(child);
    } catch (e) {
      log('$e' as num);
    }
    return result;
  }

  Future<List<ChildModel>> getChildren() async {
    var children = <ChildListDataBaseData>[];
    try {
      children = await select(childListDataBase).get();
    } catch (e) {
      log('$e' as num);
    }

    List<ChildModel> result = [];
    for (var child in children) {
      result.add(ChildModel.fromLocal(child));
    }
    return result;
  }

  Future<ChildModel?> getChild(int id) async {
    late ChildListDataBaseData child;
    try {
      child = await (select(childListDataBase)
            ..where((tbl) => tbl.id.equals(id)))
          .getSingle();
    } catch (e) {
      log('$e' as num);
    }
    return ChildModel.fromLocal(child);
  }

  Future<bool> updateChild(ChildListDataBaseCompanion child) async {
    late bool flag;
    try {
      flag = await update(childListDataBase).replace(child);
    } catch (e) {
      log('$e' as num);
    }
    if (flag == true) {
      return true;
    } else {
      return false;
    }
  }

  // Future<int> deleteChild(int id) async {
  //   late int result;
  //   try{//TODO Пока оставить делит ол так как сложная логика будет для статистики
  //     result = await (delete(childListDataBase)..where((tbl) => tbl.id.equals));
  //   }
  //   return;
  // }
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'db.sqlite'));

    if (Platform.isAndroid) {
      await applyWorkaroundToOpenSqlite3OnOldAndroidVersions();
    }
    final cachebase = (await getTemporaryDirectory()).path;

    sqlite3.tempDirectory = cachebase;

    return NativeDatabase.createInBackground(file);
  });
}
