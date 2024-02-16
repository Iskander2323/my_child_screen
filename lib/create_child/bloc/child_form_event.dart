part of 'child_form_bloc.dart';

sealed class ChildFormEvent extends Equatable {
  @override
  List<Object> get props => [];
}

final class FormChild extends ChildFormEvent {}

class ChildAdded extends ChildFormEvent {
  
}

class SavedButtonPressed extends ChildFormEvent{
final String name;
final DateTime dateTime;
final bool gender;

  SavedButtonPressed({
    required this.name,
    required this.dateTime,
    required this.gender,
  });
}
