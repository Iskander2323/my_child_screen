import 'package:equatable/equatable.dart';
import 'package:my_child_screen/data/local_db.dart';

class ChildModel extends Equatable {
  const ChildModel(
      {required this.id,
      required this.name,
      required this.childDateTime,
      required this.gender});

  ChildModel.fromLocal(ChildListDataBaseData data)
      : id = data.id,
        name = data.name,
        childDateTime = data.childDateTime,
        gender = data.gender;

  final int id;
  final String name;
  final DateTime childDateTime;
  final bool gender;

  @override
  // TODO: implement props
  List<Object?> get props => [
        id,
        name,
        childDateTime,
      ];
}
