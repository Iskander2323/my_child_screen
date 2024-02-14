import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_child_screen/child_list/bloc/children_bloc.dart';
import 'package:my_child_screen/child_list/model/child_model.dart';

import 'package:my_child_screen/child_list/widgets/children_list_item.dart';

import 'package:routemaster/routemaster.dart';

class ChildrenList extends StatefulWidget {
  const ChildrenList({super.key});

  @override
  State<ChildrenList> createState() => _ChildrenListState();
}

class _ChildrenListState extends State<ChildrenList> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChildBloc, ChildState>(builder: (context, state) {
      List<ChildModel?> listChild = state.children;
      log(listChild.length.toString(), name: "ListChild length");
      return ListView.builder(
        itemBuilder: (context, index) {
          if (index == 0) {
            return TextButton(
                onPressed: () {
                  Routemaster.of(context).push('/add');
                },
                child: const Text('Add'));
          }
          return ChildrenListItem(
            children: listChild[index]!,
          );
        },
        itemCount: listChild.length + 1,
      );
    });
  }
}
