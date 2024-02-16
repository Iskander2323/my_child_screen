part of 'child_form_bloc.dart';

enum ChildFormStatus { initial, edit, success, failure }

final class ChildFormState extends Equatable {
  const ChildFormState({
    this.status = ChildFormStatus.initial,
    this.child = const ChildrenCompanion(),
  });

  final ChildFormStatus status;
  final ChildrenCompanion child;
  ChildFormState copyWith({
    required ChildFormStatus status,
  }) {
    return ChildFormState(
      status: status,
      child: child,
    );
  }

  @override
  List<Object> get props => [status, child];
}
