import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:my_child_screen/child_list/model/child_model.dart';
import 'package:my_child_screen/repository/children_repository.dart';

part 'children_event.dart';
part 'children_state.dart';

class ChildBloc extends Bloc<ChildEvent, ChildState> {
  ChildBloc(this._childrenRepository)
      : super(const ChildState(status: ChildStatus.initial)) {
    on<ChildFetched>((event, emit) => _onChildFetched(event, emit));
  }
  final ChildrenRepository _childrenRepository;
  Future<void> _onChildFetched(
      ChildFetched event, Emitter<ChildState> emit) async {
    log('IS IT LOGGED', name: 'FROM CHILDBOC');
    emit(const ChildState(status: ChildStatus.initial));

    if (state.status == ChildStatus.initial) {
      final children = await _childrenRepository.getChildren();
      log(children.toString(), name: 'FROM CHILDBOC children');
      if (children.isEmpty) {
        return emit(state.copyWith(
          status: ChildStatus.failure,
          children: children,
        ));
      } else {
        return emit(state.copyWith(
          status: ChildStatus.success,
          children: children,
        ));
      }
    }
  }
}
