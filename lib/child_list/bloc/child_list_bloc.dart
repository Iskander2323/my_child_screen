import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'child_list_event.dart';
part 'child_list_state.dart';

class ChildListBloc extends Bloc<ChildListEvent, ChildListState> {
  ChildListBloc() : super(ChildListInitial()) {
    on<ChildListEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
