import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:my_child_screen/child_list/model/child_model.dart';
import 'package:my_child_screen/repository/children_repository.dart';

part 'children_event.dart';
part 'children_state.dart';

class ChildrenBloc extends Bloc<ChildrenEvent, ChildrenState> {
  ChildrenBloc(this._childrenRepository)
      : super(const ChildrenState(status: ChildStatus.initial, )) {
      _childrenRepository.insertStream.listen((inserted) {
      if (inserted) {
        add(ChildrenFetched());
      }
    });
    on<ChildrenFetched>((event, emit) => _onChildFetched(event, emit));
    on<DeleteAll>((event, emit) {
      _childrenRepository.deleteAll();
    add(ChildrenFetched());});
  }

  final ChildrenRepository _childrenRepository;

  Future<void> _onChildFetched(
      ChildrenFetched event, Emitter<ChildrenState> emit) async {
      final children = await _childrenRepository.getChildren();
      if (children.isEmpty) {
        return emit(state.copyWith(
          status: ChildStatus.failure,
          children: children,
        ));
      } else {
        return emit(ChildrenState(
          status: ChildStatus.success,
          children: children,
        ));
     }
  }

  void fetchData() {
  add(ChildrenFetched());
}
}
