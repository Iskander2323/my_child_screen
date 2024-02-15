import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'create_child_event.dart';
part 'create_child_state.dart';

class CreateChildBloc extends Bloc<CreateChildEvent, CreateChildState> {
<<<<<<< Updated upstream
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
=======
  CreateChildBloc({required this.childrenRepository})
      : super(const CreateChildState(status: CreateChildStatus.initial)) {
    on<FormChild>(_formChild);
    on<ChildAdded>((event, emit) => _addChild(event, emit));
  }

  final ChildrenRepository childrenRepository;
  Future<void> _formChild(
      FormChild event, Emitter<CreateChildState> emit) async {
    emit(state.copyWith(status: CreateChildStatus.edit));
  }

  Future<void> _addChild(
      ChildAdded event, Emitter<CreateChildState> emit) async {
    // final child = _childrenRepository.addChild();
    childrenRepository.insertChild(event.name);
    emit(state.copyWith(status: CreateChildStatus.success));
>>>>>>> Stashed changes
  }
}
