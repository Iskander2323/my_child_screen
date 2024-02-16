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
    on<DeleteAll>((event, emit) {
      _childrenRepository.deleteAll();
    add(ChildFetched());});
    on<Updated>((event, emit) => emit(ChildState(children: state.children, status: state.status)));
  }

  final ChildrenRepository _childrenRepository;

  Future<void> _onChildFetched(
      ChildFetched event, Emitter<ChildState> emit) async {
    log('IS IT LOGGED', name: 'FROM CHILDBOC');
    //emit(const ChildState(status: ChildStatus.initial));

    if (state.status == ChildStatus.initial) {
      final children = await _childrenRepository.getChildren();
      log(children.toString(), name: 'FROM CHILDBOC children');
      if (children.isEmpty) {
        log('FROM IF');
        return emit(state.copyWith(
          status: ChildStatus.failure,
          children: children,
        ));
      } else {
         log(children.length.toString(), name:'FROM ELSE');
        return emit(ChildState(
          status: ChildStatus.success,
          children: children,
        ));
      }
    }
  }

  void fetchData() {
  add(ChildFetched());
}
}
