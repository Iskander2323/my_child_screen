import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:my_child_screen/child_list/model/child_model.dart';

import 'package:my_child_screen/data/local_db.dart';
import 'package:my_child_screen/repository/children_repository.dart';
part 'child_form_event.dart';
part 'child_form_state.dart';

class ChildFormBloc extends Bloc<ChildFormEvent, ChildFormState> {
  ChildFormBloc(this._childrenRepository)
      : super(const ChildFormState(status: ChildFormStatus.initial)) {
    on<FormChild>(_formChild);
    on<SavedButtonPressed>((event, emit) => _saveButtonPressed(event, emit));
  }

  final ChildrenRepository _childrenRepository;

  Future<void> _formChild(
      FormChild event, Emitter<ChildFormState> emit) async {
    emit(state.copyWith(status: ChildFormStatus.edit));
  }

  Future<void> _saveButtonPressed(
    SavedButtonPressed event, Emitter<ChildFormState> emit) async {
      emit(state.copyWith(status: ChildFormStatus.initial));
      
  }

}
