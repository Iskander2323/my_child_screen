import 'dart:async';
import 'dart:math';


import 'package:my_child_screen/child_list/model/child_model.dart';
import 'package:my_child_screen/data/globals.dart';
import 'package:my_child_screen/data/local_db.dart';

class ChildrenRepository {

  StreamController<bool> _insertStreamController = StreamController<bool>.broadcast();

  Stream<bool> get insertStream => _insertStreamController.stream;

  Future<void> saveOrUpdateChild(ChildModel child) async {
    if(child.id == 0){
      ChildrenCompanion childrenCompanion =
        ChildModel(id: child.id, name: child.name, childDateTime: child.childDateTime, gender: child.gender)
            .childModeloChildrenCompanion();
    database.insertChild(childrenCompanion);
    } else {
      database.updateChild(child);
    }
   
    _insertStreamController.add(true);
  }

  Future<ChildModel> getChildById(int id)async {
     late ChildModel result;
     try{
        result = await database.getChildById(id);
     } catch(e){
        log(e as num);
     }
     return result;
  }

  Future<void> deleteAll() async {
    database.deleteAll();
  }

  Future<List<ChildModel>> getChildren() async {
    final children = await database.getChildren();
    return children;
  }

}
