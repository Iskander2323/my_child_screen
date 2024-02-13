part of 'create_child_bloc.dart';

enum CreateChildStatus { initial, creating, success, failure }

final class CreateChildState extends Equatable {
  const CreateChildState({
    this.status = CreateChildStatus.initial,
    this.child = const ChildModel,
  });

  final CreateChildStatus status;
  final ChildModel child;

  CreateChildState copyWith({
    required CreateChildStatus status,
    ChildModel child,
  }) {
    return CreateChildState(
      status: status,
      child: child,
    );
  }

  @override
  List<Object> get props => [status, child];
}

