part of 'create_child_bloc.dart';

sealed class CreateChildEvent extends Equatable {
  @override
  List<Object> get props => [];
}

final class FormChild extends CreateChildEvent {}

class ChildAdded extends CreateChildEvent {
  final String name;

  ChildAdded({
    required this.name,
  });
}
