// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'local_db.dart';

// ignore_for_file: type=lint
class $ChildListDataBaseTable extends ChildListDataBase
    with TableInfo<$ChildListDataBaseTable, ChildListDataBaseData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ChildListDataBaseTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 255),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _childDateTimeMeta =
      const VerificationMeta('childDateTime');
  @override
  late final GeneratedColumn<DateTime> childDateTime =
      GeneratedColumn<DateTime>('child_date_time', aliasedName, false,
          type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _genderMeta = const VerificationMeta('gender');
  @override
  late final GeneratedColumn<bool> gender = GeneratedColumn<bool>(
      'gender', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("gender" IN (0, 1))'));
  @override
  List<GeneratedColumn> get $columns => [id, name, childDateTime, gender];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'child_list_data_base';
  @override
  VerificationContext validateIntegrity(
      Insertable<ChildListDataBaseData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('child_date_time')) {
      context.handle(
          _childDateTimeMeta,
          childDateTime.isAcceptableOrUnknown(
              data['child_date_time']!, _childDateTimeMeta));
    } else if (isInserting) {
      context.missing(_childDateTimeMeta);
    }
    if (data.containsKey('gender')) {
      context.handle(_genderMeta,
          gender.isAcceptableOrUnknown(data['gender']!, _genderMeta));
    } else if (isInserting) {
      context.missing(_genderMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ChildListDataBaseData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ChildListDataBaseData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      childDateTime: attachedDatabase.typeMapping.read(
          DriftSqlType.dateTime, data['${effectivePrefix}child_date_time'])!,
      gender: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}gender'])!,
    );
  }

  @override
  $ChildListDataBaseTable createAlias(String alias) {
    return $ChildListDataBaseTable(attachedDatabase, alias);
  }
}

class ChildListDataBaseData extends DataClass
    implements Insertable<ChildListDataBaseData> {
  final int id;
  final String name;
  final DateTime childDateTime;
  final bool gender;
  const ChildListDataBaseData(
      {required this.id,
      required this.name,
      required this.childDateTime,
      required this.gender});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['child_date_time'] = Variable<DateTime>(childDateTime);
    map['gender'] = Variable<bool>(gender);
    return map;
  }

  ChildListDataBaseCompanion toCompanion(bool nullToAbsent) {
    return ChildListDataBaseCompanion(
      id: Value(id),
      name: Value(name),
      childDateTime: Value(childDateTime),
      gender: Value(gender),
    );
  }

  factory ChildListDataBaseData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ChildListDataBaseData(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      childDateTime: serializer.fromJson<DateTime>(json['childDateTime']),
      gender: serializer.fromJson<bool>(json['gender']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'childDateTime': serializer.toJson<DateTime>(childDateTime),
      'gender': serializer.toJson<bool>(gender),
    };
  }

  ChildListDataBaseData copyWith(
          {int? id, String? name, DateTime? childDateTime, bool? gender}) =>
      ChildListDataBaseData(
        id: id ?? this.id,
        name: name ?? this.name,
        childDateTime: childDateTime ?? this.childDateTime,
        gender: gender ?? this.gender,
      );
  @override
  String toString() {
    return (StringBuffer('ChildListDataBaseData(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('childDateTime: $childDateTime, ')
          ..write('gender: $gender')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, childDateTime, gender);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ChildListDataBaseData &&
          other.id == this.id &&
          other.name == this.name &&
          other.childDateTime == this.childDateTime &&
          other.gender == this.gender);
}

class ChildListDataBaseCompanion
    extends UpdateCompanion<ChildListDataBaseData> {
  final Value<int> id;
  final Value<String> name;
  final Value<DateTime> childDateTime;
  final Value<bool> gender;
  const ChildListDataBaseCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.childDateTime = const Value.absent(),
    this.gender = const Value.absent(),
  });
  ChildListDataBaseCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required DateTime childDateTime,
    required bool gender,
  })  : name = Value(name),
        childDateTime = Value(childDateTime),
        gender = Value(gender);
  static Insertable<ChildListDataBaseData> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<DateTime>? childDateTime,
    Expression<bool>? gender,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (childDateTime != null) 'child_date_time': childDateTime,
      if (gender != null) 'gender': gender,
    });
  }

  ChildListDataBaseCompanion copyWith(
      {Value<int>? id,
      Value<String>? name,
      Value<DateTime>? childDateTime,
      Value<bool>? gender}) {
    return ChildListDataBaseCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      childDateTime: childDateTime ?? this.childDateTime,
      gender: gender ?? this.gender,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (childDateTime.present) {
      map['child_date_time'] = Variable<DateTime>(childDateTime.value);
    }
    if (gender.present) {
      map['gender'] = Variable<bool>(gender.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ChildListDataBaseCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('childDateTime: $childDateTime, ')
          ..write('gender: $gender')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  late final $ChildListDataBaseTable childListDataBase =
      $ChildListDataBaseTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [childListDataBase];
}
