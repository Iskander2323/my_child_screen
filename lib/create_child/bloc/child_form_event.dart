part of 'child_form_bloc.dart';

sealed class ChildFormEvent extends Equatable {
  @override
  List<Object> get props => [];
}

final class FormChild extends ChildFormEvent {}

class ChildAdded extends ChildFormEvent {
  final String name;

  ChildAdded({
    required this.name,
  });
}
