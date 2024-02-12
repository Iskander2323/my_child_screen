import "package:drift/drift.dart";

part "local_db.g.dart";

class ChildListDataBase extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text().withLength(min: 1, max: 255)();
  DateTimeColumn get childDateTime => dateTime()();
  BoolColumn get gender => boolean()();
}

@DriftDatabase(tables: [ChildListDataBase])
class AppDatabase extends _$AppDatabase {}
