import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_child_screen/child_list/bloc/children_bloc.dart';
import 'package:my_child_screen/child_list/widgets/bottom_loader.dart';
import 'package:my_child_screen/child_list/widgets/children_list_item.dart';

class ChildrenList extends StatefulWidget {
  const ChildrenList({super.key});

  @override
  State<ChildrenList> createState() => _ChildrenListState();
}

class _ChildrenListState extends State<ChildrenList> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChildBloc, ChildState>(builder: (context, state) {
      switch (state.status) {
        case ChildStatus.failure:
          return const Center(child: Text('failed to load children'));
        case ChildStatus.success:
          return ListView.builder(
              itemBuilder: (BuildContext context, int index) {
            return index >= state.children.length
                ? const BottomLoader()
                : ChildrenListItem(children: state.children[index]);
          });

        case ChildStatus.initial:
          return const Center(child: CircularProgressIndicator());
      }
    });
  }
}
