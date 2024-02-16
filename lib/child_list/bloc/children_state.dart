part of 'children_bloc.dart';

enum ChildStatus { initial, success, failure }

final class ChildrenState extends Equatable {
  const ChildrenState(
      {this.status = ChildStatus.initial,
      this.children = const <ChildModel?>[]});

  final ChildStatus status;
  final List<ChildModel?> children;
 

  ChildrenState copyWith({
    ChildStatus? status,
    List<ChildModel>? children,
  }) {
    return ChildrenState(
        status: status ?? this.status, children: children ?? this.children);
  }

  @override
  String toString() {
    return '''ChildState { status: $status, children: ${children.length} }''';
  }

  @override
  List<Object> get props => [status, children];
}
