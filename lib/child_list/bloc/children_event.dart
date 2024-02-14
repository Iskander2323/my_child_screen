part of 'children_bloc.dart';

sealed class ChildEvent extends Equatable {
  @override
  List<Object> get props => [];
}

final class ChildFetched extends ChildEvent {}

class ChildFormOpen extends ChildEvent{}