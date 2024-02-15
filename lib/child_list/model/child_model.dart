import 'package:drift/drift.dart';
import 'package:equatable/equatable.dart';
import 'package:my_child_screen/data/local_db.dart';

class ChildModel extends Equatable {
  const ChildModel(
      {required this.name, required this.childDateTime, required this.gender});

  ChildModel.fromLocal(ChildrenData data)
      : name = data.name,
        childDateTime = data.childDateTime,
        gender = data.gender;

  final String name;
  final DateTime childDateTime;
  final bool gender;

  ChildrenCompanion childModeloChildrenCompanion() {
    final nameChildrenCompanion = Value<String>(name);
    final birthDay = Value<DateTime>(DateTime.now());

    return ChildrenCompanion(
        name: nameChildrenCompanion,
        childDateTime: birthDay,
        gender: const Value<bool>(true));
  }

  @override
  // TODO: implement props
  List<Object?> get props => [
        name,
        childDateTime,
      ];

  @override
  String toString() {
    // TODO: implement toString
    return 'name:$name,childDateTime:$childDateTime,gender:$gender';
  }
}
