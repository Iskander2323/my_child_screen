import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_child_screen/create_child/bloc/child_form_bloc.dart';
import 'package:my_child_screen/create_child/widgets/fields_form.dart';
import 'package:routemaster/routemaster.dart';


class ChildForm extends StatefulWidget {
  const ChildForm({super.key});

  @override
  State<ChildForm> createState() => _ChildFormState();
}

class _ChildFormState extends State<ChildForm> {

  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocListener<ChildFormBloc, ChildFormState>(
      listener: (context, state) {
        // TODO: implement listener
        if (state.status == ChildFormStatus.success) {
          Routemaster.of(context).pop();
        }
      },
      child: BlocBuilder<ChildFormBloc, ChildFormState>(
        builder: (context, state) {
          return Scaffold(
            body: FieldsForm()
          );
        },
      ),
    );
  }



  
}
