part of 'create_child_bloc.dart';

sealed class CreateChildEvent extends Equatable {

  @override
  List<Object> get props => [];
}

final class CreatingChild extends CreateChildEvent{}
final class ChildAdded extends CreateChildEvent{}
