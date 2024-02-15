import "dart:io";

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
<<<<<<< Updated upstream

  Future<List<ChildModel>?> getChildren() async {
    final children = await select(childListDataBase).get();
=======
  Future<void> testInsert() async {
    await into(children).insert(ChildrenCompanion.insert(
        name: '${DateTime.now().hashCode}',
        childDateTime: DateTime.now(),
        gender: true));
    d.log('ITS FROM @DRIFTDatabase class ');
    List<ChildModel> childrens = await getChildren();
    d.log(childrens.toString(), name: 'ELEMENTS FROM Database getChildren: ');
  }

  Future<int> insertChild(ChildrenCompanion childrenCompanion) async {
    late int result;
    try {
      result = await into(children).insert(childrenCompanion);
    } catch (result) {
      d.log(result.toString(), name: 'Inserted child');
    }
    return result;
  }

  Future<List<ChildModel>> getChildren() async {
    List<ChildrenData> children = [];
    try {
      children = await select(database.children).get();
    } catch (e) {
      log('$e' as num);
    }
>>>>>>> Stashed changes

    List<ChildModel> result = [];
    for (var child in children) {
      result.add(ChildModel.fromLocal(child));
    }
    return result;
  }
<<<<<<< Updated upstream
=======

  // Future<ChildModel?> getChild(int id) async {
  //   late Children child;
  //   try {
  //     child = await (select(Children)
  //           ..where((tbl) => tbl.id.equals(id)))
  //         .getSingle();
  //   } catch (e) {
  //     log('$e' as num);
  //   }
  //   return ChildModel.fromLocal(child);
  // }

  // Future<bool> updateChild(ChildListDataBaseCompanion child) async {
  //   late bool flag;
  //   try {
  //     flag = await update(Children).replace(child);
  //   } catch (e) {
  //     log('$e' as num);
  //   }
  //   if (flag == true) {
  //     return true;
  //   } else {
  //     return false;
  //   }
  // }
//TODO Пока оставить делит ол так как сложная логика будет для статистики

  Future<int> deleteAll() {
    final result = delete(children).go();
    return result;
  }
>>>>>>> Stashed changes
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
