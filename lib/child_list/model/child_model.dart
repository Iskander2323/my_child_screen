import 'package:drift/drift.dart';
import 'package:equatable/equatable.dart';
import 'package:my_child_screen/data/local_db.dart';

class ChildModel extends Equatable {
  const ChildModel(
      { required this.id, required this.name, required this.childDateTime, required this.gender});

  ChildModel.fromLocal(ChildrenData data)
      : id = data.id,
        name = data.name,
        childDateTime = data.childDateTime,
        gender = data.gender;
  final int id;
  final String name;
  final DateTime childDateTime;
  final bool gender;

  ChildModel.defaultModel(): id = 0,
      name = '',
      childDateTime = DateTime.now(),
      gender = true;

  ChildrenCompanion childModeloChildrenCompanion() {
   // final idChildrenCompanion = Value(id);
    final nameChildrenCompanion = Value<String>(name);
    final birthDay = Value<DateTime>(childDateTime!);
    final genderCompanion = Value<bool>(gender);
    return ChildrenCompanion(
//id: idChildrenCompanion,
        name: nameChildrenCompanion,
        childDateTime: birthDay,
        gender: genderCompanion,
        );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [
     //   id,
        name,
        childDateTime,
        gender,
      ];

  @override
  String toString() {
    // TODO: implement toString
    return 'name:$name,childDateTime:$childDateTime,gender:$gender';
  }
}
