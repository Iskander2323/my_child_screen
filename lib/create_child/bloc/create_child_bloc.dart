import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'create_child_event.dart';
part 'create_child_state.dart';

class CreateChildBloc extends Bloc<CreateChildEvent, CreateChildState> {
  CreateChildBloc() : super(CreateChildInitial()) {
    on<CreateChildEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
