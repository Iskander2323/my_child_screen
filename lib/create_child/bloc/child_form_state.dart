part of 'child_form_bloc.dart';

enum ChildFormStatus { initial, edit, success, failure }

final class CreateChildState extends Equatable {
  const CreateChildState({
    this.status = ChildFormStatus.initial,
    this.child = const ChildrenCompanion(),
  });

  final ChildFormStatus status;
  final ChildrenCompanion child;
  CreateChildState copyWith({
    required ChildFormStatus status,
  }) {
    return CreateChildState(
      status: status,
      child: child,
    );
  }

  @override
  List<Object> get props => [status];
}
