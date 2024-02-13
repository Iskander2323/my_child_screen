import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'create_child_event.dart';
part 'create_child_state.dart';

class CreateChildBloc extends Bloc<CreateChildEvent, CreateChildState> {
  CreateChildBloc(this._childrenRepository)
      : super(const CreateChildState(status: CreateChildStatus.initial) {
    on<CreateChildEvent>(_createChild),
    };

  final ChildrenRepository _childrenRepository;

  Future<void> _creatingChild(CreatingChild event, Emitter<CreateChildState> emit) async{
      emit(state.copyWith(status: () => CreateChildStatus.creating));
      try {
        if(state.status == CreateChildStatus.creating){
        }
      } catch(e){

      }
  }

  Future<void> _addedChild(ChildAdded event,Emitter<CreateChildState> emit) async{
      emit(state);
  }
}
