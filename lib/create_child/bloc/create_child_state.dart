part of 'create_child_bloc.dart';

sealed class CreateChildState extends Equatable {
  const CreateChildState();
  
  @override
  List<Object> get props => [];
}

final class CreateChildInitial extends CreateChildState {}
