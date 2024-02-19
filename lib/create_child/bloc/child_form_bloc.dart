import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:my_child_screen/child_list/model/child_model.dart';

import 'package:my_child_screen/repository/children_repository.dart';
part 'child_form_event.dart';
part 'child_form_state.dart';

class ChildFormBloc extends Bloc<ChildFormEvent, ChildFormState> {
  ChildFormBloc(this._childrenRepository)
      : super(ChildFormState()) {
    on<FormChild>(_formChild);
    on<SavedButtonPressed>((event, emit) => _saveButtonPressed(event, emit));
  }

  final ChildrenRepository _childrenRepository;

  Future<void> _formChild(
      FormChild event, Emitter<ChildFormState> emit) async {
   // emit(state.copyWith(status: ChildFormStatus.edit));
   if(state.runtimeType == ChildFormState){
        try{
        if(event.id != null){
        int id = int.tryParse(event.id!)?? 0;
        ChildModel child = await _childrenRepository.getChildById(id);
        child ??= ChildModel.defaultModel();
         emit(ChildFormEditableState(status: ChildFormStatus.edit, child: child));
        } else{
          ChildModel child = ChildModel.defaultModel();
         emit(ChildFormEditableState(status: ChildFormStatus.edit, child: child));
        }

    } catch(e){
      log(e.toString(), name: "FROM CHILD FORM BLOC");
    }
   }
    
  }

  Future<void> _saveButtonPressed(
    SavedButtonPressed event, Emitter<ChildFormState> emit) async {
      
      final ChildModel child = ChildModel(id: (state as ChildFormEditableState).child.id, name: event.name, childDateTime: event.dateTime, gender: event.gender);
      emit(ChildFormEditableState(status: ChildFormStatus.saving, child: child));
        _childrenRepository.saveOrUpdateChild(child);
      emit(ChildFormEditableState(status: ChildFormStatus.success, child: child));
  }

}
