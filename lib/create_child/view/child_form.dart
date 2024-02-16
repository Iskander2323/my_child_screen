import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_child_screen/create_child/widgets/custom_container.dart';
import 'package:my_child_screen/create_child/widgets/custom_text_field.dart';
import 'package:my_child_screen/create_child/bloc/child_form_bloc.dart';
import 'package:routemaster/routemaster.dart';


class ChildForm extends StatefulWidget {
  const ChildForm({super.key});

  @override
  State<ChildForm> createState() => _ChildFormState();
}

class _ChildFormState extends State<ChildForm> {
  TextEditingController nameController = TextEditingController();
  TextEditingController birthdayController = TextEditingController();
  TextEditingController genderController= TextEditingController();


  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocListener<ChildFormBloc, CreateChildState>(
      listener: (context, state) {
        // TODO: implement listener
        if (state.status == ChildFormStatus.success) {
          Routemaster.of(context).push('/');
        }
      },
      child: BlocBuilder<ChildFormBloc, CreateChildState>(
        builder: (context, state) {
          return Scaffold(
            body: Form(
                key: formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    nameTextField(),
                    bitrhDayTextField(),
                    genderTextField(),
                    addChildButton(),
                  ],
                )),
          );
        },
      ),
    );
  }

  CustomContainer addChildButton() {
    return CustomContainer(
        child: ElevatedButton(
      child: const Text('Добавить ребенка'),
      onPressed: () {
        context
            .read<ChildFormBloc>()
            .add(ChildAdded(name: nameController.text));
      },
    ));
  }

  CustomTextField nameTextField() {
    return CustomTextField(
      controller: nameController,
      hintText: 'Name',
      obscureText: false,
      keyboardType: TextInputType.name,
      prefixIcon: const Icon(Icons.child_care),
      validator: (val) {
        if (val!.isEmpty) {
          return 'Empty';
        }
        return null;
      },
    );
  }

  CustomTextField bitrhDayTextField() {
    return CustomTextField(
      controller: birthdayController,
      hintText: 'Birthday',
      obscureText: false,
      keyboardType: TextInputType.name,
      prefixIcon: const Icon(Icons.person),
      validator: (val) {
        if (val!.isEmpty) {
          return 'Empty';
        }
        return null;
      },
    );
  }

  CustomTextField genderTextField() {
    return CustomTextField(
      controller: genderController,
      hintText: 'Gender',
      obscureText: false,
      keyboardType: TextInputType.name,
      prefixIcon: const Icon(Icons.person),
      validator: (val) {
        if (val!.isEmpty) {
          return 'Empty';
        }
        return null;
      },
    );
  }


  
}
