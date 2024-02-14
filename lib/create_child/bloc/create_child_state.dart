part of 'create_child_bloc.dart';

enum CreateChildStatus { initial, edit, success, failure }

final class CreateChildState extends Equatable {
  const CreateChildState({
    this.status = CreateChildStatus.initial,
    this.child = const ChildrenCompanion(),
  });

  final CreateChildStatus status;
  final ChildrenCompanion child;
  CreateChildState copyWith({
    required CreateChildStatus status,
  }) {
    return CreateChildState(
      status: status,
      child: child,
    );
  }

  @override
  List<Object> get props => [status];
}
