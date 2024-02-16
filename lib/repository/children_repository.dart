import 'dart:async';


import 'package:my_child_screen/child_list/model/child_model.dart';
import 'package:my_child_screen/data/globals.dart';
import 'package:my_child_screen/data/local_db.dart';

class ChildrenRepository {

  StreamController<bool> _insertStreamController = StreamController<bool>.broadcast();

  Stream<bool> get insertStream => _insertStreamController.stream;

  Future<void> insertChild(ChildModel child) async {
    ChildrenCompanion childrenCompanion =
        ChildModel(name: child.name, childDateTime: DateTime.now(), gender: true, id: 10)
            .childModeloChildrenCompanion();
    database.insertChild(childrenCompanion);
    _insertStreamController.add(true);
  }

  Future<void> deleteAll() async {
    database.deleteAll();
  }

  Future<List<ChildModel>> getChildren() async {
    final children = await database.getChildren();
    return children;
  }

}
