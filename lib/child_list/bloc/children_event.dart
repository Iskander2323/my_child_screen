part of 'children_bloc.dart';

sealed class ChildrenEvent extends Equatable {
  @override
  List<Object> get props => [];
}

final class ChildrenFetched extends ChildrenEvent {}

class ChildFormOpen extends ChildrenEvent{}

class DeleteAll extends ChildrenEvent{}

class EditChild extends ChildrenEvent{}