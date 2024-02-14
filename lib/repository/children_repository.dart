import 'package:my_child_screen/child_list/model/child_model.dart';
import 'package:my_child_screen/data/local_db.dart';

class ChildrenRepository {
  final database = AppDatabase();

  Future<List<ChildModel>> getChildren() async {
    final children = await database.getChildren();
    return children;
  }

  // Future<int> addChild(ChildListDataBaseCompanion child) async {
  //   final result = await database.insertChild(child);
  //   return result;
  // }
}
