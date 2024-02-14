import 'package:flutter/material.dart';
import 'package:my_child_screen/data/local_db.dart';

class FormChild extends StatelessWidget {
  const FormChild({required this.child, super.key});

  final ChildrenCompanion child;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                border: Border.all(
                  color: Colors.black,
                  width: 0.5,
                )),
            padding: const EdgeInsets.all(1.0),
            height: 245,
            width: 80,
            child: Text('smth')));
  }
}
