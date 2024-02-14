import 'package:flutter/material.dart';
import 'package:my_child_screen/child_list/model/child_model.dart';
import 'package:routemaster/routemaster.dart' as routemaster;

class ChildrenListItem extends StatelessWidget {
  const ChildrenListItem({required this.children, super.key});

  final ChildModel? children;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(children: [
        GestureDetector(
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              border: Border.all(color: Colors.black, width: 0.5),
            ),
            padding: const EdgeInsets.all(1.0),
            height: 245,
            width: 80,
            child: Column(children: [
              Text(children!.name),
            ]),
          ),
        ),
        TextButton(
            onPressed: () {
              routemaster.Routemaster.of(context).push('/add');
            },
            child: const Text('Add child'))
      ]),
    );
  }
}
