part of 'child_form_bloc.dart';

enum ChildFormStatus { initial, edit, saving, success, failure }

final class ChildFormState extends Equatable {
  @override
  List<Object> get props => [];
}

final class ChildFormEditableState extends ChildFormState {
  ChildFormEditableState({
    this.status = ChildFormStatus.initial,
    required this.child,
  });

  final ChildFormStatus status;
  final ChildModel child;
  ChildFormEditableState copyWith({
     required ChildFormStatus status,
     required ChildModel child,
  }) {
    return ChildFormEditableState(
      status: status,
      child: child,
    );
  }

  @override
  List<Object> get props => [status, child];
}
