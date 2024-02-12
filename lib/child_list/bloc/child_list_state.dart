part of 'child_list_bloc.dart';

sealed class ChildListState extends Equatable {
  const ChildListState();
  
  @override
  List<Object> get props => [];
}

final class ChildListInitial extends ChildListState {}
