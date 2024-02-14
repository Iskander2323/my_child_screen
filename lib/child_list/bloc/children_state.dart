part of 'children_bloc.dart';

enum ChildStatus { initial, success, failure }

final class ChildState extends Equatable {
  const ChildState(
      {this.status = ChildStatus.initial,
      this.children = const <ChildModel?>[]});

  final ChildStatus status;
  final List<ChildModel?> children;

  ChildState copyWith({
    ChildStatus? status,
    List<ChildModel>? children,
  }) {
    return ChildState(
        status: status ?? this.status, children: children ?? this.children);
  }

  @override
  String toString() {
    return '''ChildState { status: $status, posts: ${children.length} }''';
  }

  @override
  List<Object> get props => [];
}
