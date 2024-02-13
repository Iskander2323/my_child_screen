import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:my_child_screen/child_list/model/child_model.dart';
import 'package:my_child_screen/repository/children_repository.dart';

part 'children_event.dart';
part 'children_state.dart';

class ChildBloc extends Bloc<ChildEvent, ChildState> {
  ChildBloc(this._childrenRepository)
      : super(const ChildState(status: ChildStatus.initial)) {
    on<ChildFetched>(
      _onChildFetched,
    );
  }
  final ChildrenRepository _childrenRepository;
  Future<void> _onChildFetched(
      ChildFetched event, Emitter<ChildState> emit) async {
    emit(const ChildState(status: ChildStatus.initial));
    try {
      if (state.status == ChildStatus.initial) {
        final children = await _childrenRepository.getChildren();
        if (children != null) {
          return emit(state.copyWith(
            status: ChildStatus.success,
            children: children,
          ));
        } else {
          return emit(state.copyWith(
            status: ChildStatus.failure,
            children: children,
          ));
        }
      }
    } catch (_) {
      emit(state.copyWith(status: ChildStatus.failure));
    }
  }
}
