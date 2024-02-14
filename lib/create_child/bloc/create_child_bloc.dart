import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:my_child_screen/data/local_db.dart';
import 'package:my_child_screen/repository/children_repository.dart';
part 'create_child_event.dart';
part 'create_child_state.dart';

class CreateChildBloc extends Bloc<CreateChildEvent, CreateChildState> {
  CreateChildBloc()
      : super(const CreateChildState(status: CreateChildStatus.initial)) {
    on<FormChild>(_formChild);
    on<ChildAdded>((event, emit) => _addChild(event, emit));
  }

  final ChildrenRepository _childrenRepository = ChildrenRepository();

  Future<void> _formChild(
      FormChild event, Emitter<CreateChildState> emit) async {
    emit(state.copyWith(status: CreateChildStatus.edit));
  }

  Future<void> _addChild(
      ChildAdded event, Emitter<CreateChildState> emit) async {
    // final child = _childrenRepository.addChild();
    _childrenRepository.insertChild(event.name);
    emit(state.copyWith(status: CreateChildStatus.success));
  }
}
