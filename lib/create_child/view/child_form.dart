import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:my_child_screen/create_child/bloc/child_form_bloc.dart';
import 'package:my_child_screen/create_child/widgets/fields_form.dart';
import 'package:routemaster/routemaster.dart' as routemaster;


class ChildForm extends StatefulWidget {
  const ChildForm({super.key});

  @override
  State<ChildForm> createState() => _ChildFormState();
}

class _ChildFormState extends State<ChildForm> {

  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return  BlocBuilder<ChildFormBloc, ChildFormState>(
        builder: (context, state) {
            if (state.runtimeType == ChildFormEditableState){

           switch ((state as ChildFormEditableState).status) {
              case ChildFormStatus.initial: 
              return const Center(child: CircularProgressIndicator());
              case ChildFormStatus.success:
               routemaster.Routemaster.of(context).pop();
              return const Center(child: CircularProgressIndicator());
              case ChildFormStatus.edit:
              return FieldsForm( name: state.child.name, childDateTime: state.child.childDateTime, gender: state.child.gender,);
              case ChildFormStatus.saving: 
              return const Center(child: CircularProgressIndicator());
              case ChildFormStatus.failure: 
               return const Center(child: Text('ERROR'),);
          }      
            } else {
              return const Center(child: CircularProgressIndicator());
            }
        },
      ); 
  } 
}
