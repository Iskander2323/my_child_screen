import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_child_screen/child_form/custom_container.dart';
import 'package:my_child_screen/child_form/custom_text_field.dart';
import 'package:my_child_screen/create_child/bloc/create_child_bloc.dart';
import 'package:routemaster/routemaster.dart';

class RegisterFromProvider extends StatelessWidget {
  const RegisterFromProvider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CreateChildBloc(),
      child: const RegisterFrom(),
    );
  }
}

class RegisterFrom extends StatefulWidget {
  const RegisterFrom({super.key});

  @override
  State<RegisterFrom> createState() => _RegisterFromState();
}

class _RegisterFromState extends State<RegisterFrom> {
  TextEditingController nameController = TextEditingController();
  TextEditingController someThingController1 = TextEditingController();
  TextEditingController someThingController2 = TextEditingController();
  TextEditingController someThingController3 = TextEditingController();
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocListener<CreateChildBloc, CreateChildState>(
      listener: (context, state) {
        // TODO: implement listener
        if (state.status == CreateChildStatus.success) {
          Routemaster.of(context).pop();
        }
      },
      child: BlocBuilder<CreateChildBloc, CreateChildState>(
        builder: (context, state) {
          return Scaffold(
            body: Form(
                key: formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    nameTextField(),
                    something1TextField(),
                    something2TextField(),
                    something3TextField(),
                    signElevatedButton(),
                    CustomContainer(
                        child: ElevatedButton(
                            onPressed: () {
                              showDialog(
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                      title:
                                          const Text('Точно хотите пропустить'),
                                      actions: [
                                        ElevatedButton(
                                            onPressed: () {
                                              Routemaster.of(context).pop();
                                            },
                                            child: const Text('НЕТ')),
                                        ElevatedButton(
                                            onPressed: () {
                                              Routemaster.of(context).pop();
                                              Routemaster.of(context).replace(
                                                  '/home'); // TODO Кнопка назад работатет ANdroid
                                            },
                                            child: const Text('ДА'))
                                      ],
                                    );
                                  });
                            },
                            child: const Text('Skip')))
                  ],
                )),
          );
        },
      ),
    );
  }

  CustomContainer signElevatedButton() {
    return CustomContainer(
        child: ElevatedButton(
      child: const Text('Далее'),
      onPressed: () {
        context
            .read<CreateChildBloc>()
            .add(ChildAdded(name: nameController.text));
      },
    ));
  }

  CustomTextField something1TextField() {
    return CustomTextField(
      controller: someThingController1,
      hintText: 'Something1',
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

  CustomTextField something2TextField() {
    return CustomTextField(
      controller: someThingController2,
      hintText: 'Something2',
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

  CustomTextField something3TextField() {
    return CustomTextField(
      controller: someThingController3,
      hintText: 'Something3',
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

  CustomTextField nameTextField() {
    return CustomTextField(
      controller: nameController,
      hintText: 'Name',
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
