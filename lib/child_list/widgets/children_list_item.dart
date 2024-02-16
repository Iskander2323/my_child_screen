import 'package:flutter/material.dart';
import 'package:my_child_screen/child_list/model/child_model.dart';
import 'package:routemaster/routemaster.dart' as routemaster;

class ChildrenListItem extends StatelessWidget {
  const ChildrenListItem({required this.children, super.key});

  final ChildModel? children;

  @override
  Widget build(BuildContext context) {
    return Padding(
<<<<<<< Updated upstream
      padding: const EdgeInsets.all(8.0),
=======
      padding: const EdgeInsets.all(15.0),
>>>>>>> Stashed changes
      child: Column(children: [
        GestureDetector(
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              border: Border.all(color: Colors.black, width: 0.5),
            ),
            padding: const EdgeInsets.all(1.0),
<<<<<<< Updated upstream
            height: 245,
            width: 80,
            child: Column(children: [
              Text(children.name),
            ]),
          ),
        ),
        TextButton(
            onPressed: () {
              routemaster.Routemaster.of(context).push('/add');
            },
            child: const Text('Add child'))
=======
            height: 200,
            width: double.infinity,
            child: Column(children: [
              CircleAvatar(
                radius: 56,
             backgroundColor: Color.fromARGB(255, 135, 202, 27),
),
              Text(children!.name),
            ]),
          ),
        ),
>>>>>>> Stashed changes
      ]),
    );
  }
}
