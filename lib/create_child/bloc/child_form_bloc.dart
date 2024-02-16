import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:my_child_screen/data/local_db.dart';
import 'package:my_child_screen/repository/children_repository.dart';
part 'child_form_event.dart';
part 'child_form_state.dart';

class ChildFormBloc extends Bloc<ChildFormEvent, CreateChildState> {
  ChildFormBloc(this._childrenRepository)
      : super(const CreateChildState(status: ChildFormStatus.initial)) {
    on<FormChild>(_formChild);
    on<ChildAdded>((event, emit) => _addChild(event, emit));
  }

  final ChildrenRepository _childrenRepository;

  Future<void> _formChild(
      FormChild event, Emitter<CreateChildState> emit) async {
    emit(state.copyWith(status: ChildFormStatus.edit));
  }

  Future<void> _addChild(
      ChildAdded event, Emitter<CreateChildState> emit) async {
    // final child = _childrenRepository.addChild();
    log(_childrenRepository.hashCode.toString(),name: 'CAME FROM CHILDFORM BLOC');
    _childrenRepository.insertChild(event.name);
    emit(state.copyWith(status: ChildFormStatus.success));
  }
}
