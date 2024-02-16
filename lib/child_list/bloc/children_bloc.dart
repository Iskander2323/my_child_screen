import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:my_child_screen/child_list/model/child_model.dart';
import 'package:my_child_screen/repository/children_repository.dart';

part 'children_event.dart';
part 'children_state.dart';

class ChildBloc extends Bloc<ChildEvent, ChildState> {
  ChildBloc({required this.childrenRepository})
      : super(const ChildState(status: ChildStatus.initial)) {
        
    on<ChildFetched>(_onChildFetched);
    on<InitStateFetchedData>(_onFetchInit);
  
  }

  final ChildrenRepository childrenRepository;
  Future<void> _onFetchInit(InitStateFetchedData event, Emitter<ChildState> emit) async{
    log('InitStateFetchedData is done and we go fetced data');
    add(ChildFetched());
  }

  Future<void> _onChildFetched(
      ChildFetched event, Emitter<ChildState> emit) async {
    log('IS IT LOGGED', name: 'FROM CHILDBOC');
    emit(ChildState(status: ChildStatus.initial));
      var children = <ChildModel>[];
    if (state.status == ChildStatus.initial) {
      await childrenRepository.createTestChild();
      try{
        children = await childrenRepository.getChildren();
      }
      catch(e){
      log('$e');
      }
      log(children.toString(), name: 'FROM CHILDBOC children');
      if (children.isEmpty) {
        log('IT IF  ');
        return emit(state.copyWith(
          status: ChildStatus.failure,
          children: children,
        ));
      } else {
        log('IT IS ELSE  ');

        return emit(state.copyWith(
          status: ChildStatus.success,
          children: children,
        ));
      }}

  }

  void fetchData() {
  add(ChildFetched());
}

}
