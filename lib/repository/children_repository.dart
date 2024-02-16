<<<<<<< Updated upstream
=======
import 'dart:async';
import 'dart:developer';

>>>>>>> Stashed changes
import 'package:my_child_screen/child_list/model/child_model.dart';
import 'package:my_child_screen/data/local_db.dart';

class ChildrenRepository {
<<<<<<< Updated upstream
  final database = AppDatabase();

  Future<List<ChildModel>?> getChildren() async {
=======

  final StreamController<bool> _insertStreamController = StreamController<bool>.broadcast();
  
  Stream<bool> get insertStream => _insertStreamController.stream;
  

  Future<void> createTestChild() async {
    await database.testInsert();
  }

  Future<void> insertChild(String name) async {
    ChildrenCompanion childrenCompanion =
        ChildModel(name: name, childDateTime: DateTime.now(), gender: true)
            .childModeloChildrenCompanion();
    database.insertChild(childrenCompanion);
    log('Это лог перед инсерт контроллер адд');
    _insertStreamController.add(true);
     log('Это лог после инсерт контроллер адд');
  }

  Future<int> deleteAll() async {
     return  database.deleteAll();
  }

  Future<List<ChildModel>> getChildren() async {
>>>>>>> Stashed changes
    final children = await database.getChildren();
    return children;
  }
}
