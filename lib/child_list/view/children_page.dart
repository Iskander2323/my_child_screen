import 'package:flutter/material.dart';
import 'package:my_child_screen/child_list/bloc/children_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_child_screen/child_list/view/children_list.dart';
import 'package:my_child_screen/repository/children_repository.dart';

class ChildrenPage extends StatelessWidget {
  const ChildrenPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) =>
            ChildBloc(context.read<ChildrenRepository>())..add(ChildFetched()),
        child: const ChildrenList(),
      ),
    );
  }
}
