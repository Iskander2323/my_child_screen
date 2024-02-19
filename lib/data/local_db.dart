import "dart:io";
import 'dart:developer';

import "package:drift/drift.dart";
import "package:drift/native.dart";
import "package:my_child_screen/child_list/model/child_model.dart";
import "package:my_child_screen/data/globals.dart";
import "package:path_provider/path_provider.dart";
import "package:sqlite3_flutter_libs/sqlite3_flutter_libs.dart";
import 'package:path/path.dart' as p;
// ignore: depend_on_referenced_packages
import 'package:sqlite3/sqlite3.dart';

part "local_db.g.dart";

class Children extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text().withLength(min: 1, max: 255)();
  DateTimeColumn get childDateTime => dateTime()();
  BoolColumn get gender => boolean()();
}

@DriftDatabase(tables: [Children])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  Future<int> insertChild(ChildrenCompanion childrenCompanion) async {
    late int result;
    try {
      result = await into(children).insert(childrenCompanion);
    } catch (e) {
      log(e.toString(), name: "FROM LOCALDB INSERT CHILD");
    }
    return result;
  }

  Future<List<ChildModel>> getChildren() async {
    var children = [];
    try {
      children = await select(database.children).get();
    } catch (e) {
      log(e.toString(), name: "FROM LOCALDB GET CHILDREN");
    }
    
    List<ChildModel> result = [];
    for (var child in children) {
      result.add(ChildModel.fromLocal(child));
    }
    return result;
  }

  Future<void> deleteAll() async {
    await delete(children).go();
  }

  Future<ChildModel> getChildById(int id) async {
    late ChildrenData child;
    try {
      child = await (select(children)
            ..where((tbl) => tbl.id.equals(id)))
          .getSingle();
    } catch (e) {
      log(e.toString(), name: "FROM LOCALDB FET CHILD BY ID");
    }
    return ChildModel.fromLocal(child);
  
  }

  Future<void> updateChild(ChildModel child) async {
    try{
    await (update(children)
    ..where((tbl) => tbl.id.equals(child.id))).write(
      ChildrenCompanion(
        name: Value(child.name),
        childDateTime: Value(child.childDateTime),
        gender: Value(child.gender)
      )
    );
    }catch(e){
      log(e.toString(), name: "FROM UPDATE CHILD");
    }
   
  }

//TODO Пока оставить делит ол так как сложная логика будет для статистики
  
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
