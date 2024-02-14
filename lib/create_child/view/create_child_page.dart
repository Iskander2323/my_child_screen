import 'package:flutter/material.dart';

class CreateChildPage extends StatelessWidget {
  const CreateChildPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: double.infinity,
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
          ),
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color.fromARGB(255, 41, 1, 153),
                Color.fromARGB(255, 0, 212, 184),
              ])),
    );
  }
}
