import 'package:flutter/material.dart';
import 'package:my_child_screen/child_list/bloc/children_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_child_screen/child_list/view/children_list.dart';
import 'package:my_child_screen/data/local_db.dart';
import 'package:my_child_screen/repository/children_repository.dart';

class ChildrenPage extends StatefulWidget {
  const ChildrenPage({super.key});

  @override
  State<ChildrenPage> createState() => _ChildrenPageState();
}

class _ChildrenPageState extends State<ChildrenPage> {
  @override
  void initState() {
    super.initState();
    AppDatabase().testInsert();
    AppDatabase().getChildren();
  }

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
