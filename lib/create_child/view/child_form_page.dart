import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_child_screen/create_child/bloc/child_form_bloc.dart';
import 'package:my_child_screen/create_child/view/child_form.dart';
import 'package:my_child_screen/repository/children_repository.dart';

class ChildFormPage extends StatelessWidget {
  const ChildFormPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => ChildFormBloc(context.read<ChildrenRepository>()),
        child: const ChildForm(),
      ),
    );
  }
}
