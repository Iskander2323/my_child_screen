
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:my_child_screen/create_child/bloc/child_form_bloc.dart';

class FieldsForm extends StatefulWidget{
    FieldsForm({super.key});

  @override
  State<FieldsForm> createState() => _FieldsFormState();
}

class _FieldsFormState extends State<FieldsForm> {

final _formKey = GlobalKey<FormBuilderState>();
final TextEditingController nameController = TextEditingController();
final TextEditingController birthdayController = TextEditingController();
final TextEditingController genderController= TextEditingController();
@override
Widget build(BuildContext context){
  return FormBuilder(
    key: _formKey,
    child: 
    Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
        SizedBox(
          height: 60,
          width: double.infinity,
          child: FormBuilderTextField(
            controller: nameController,
            name: 'Name',
            decoration:  InputDecoration(
            enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Colors.transparent),
          ),
            focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide:
                BorderSide(color: Theme.of(context).colorScheme.secondary),
          ),
          fillColor: Colors.grey.shade200,
          filled: true,
          hintText: 'Name',
            ),
          validator: (val) {
          if (val!.isEmpty) {
          return 'Empty';
           }
        return null;
      },
            ),
        ),
        SizedBox(
          height: 10,
        ),
          FormBuilderDateTimePicker(
            inputType: InputType.date,
            controller: birthdayController,
            name: 'birthday',
            decoration:  InputDecoration(
            enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Colors.transparent),
          ),
            focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide:
                BorderSide(color: Theme.of(context).colorScheme.secondary),
          ),
          fillColor: Colors.grey.shade200,
          filled: true,
          hintText: 'Birthday',
            ),
          ),
          Expanded(
              child: FormBuilderRadioGroup(
                name: 'gender', 
                options: const [
              FormBuilderFieldOption(
                value: true,
              child: Text('Мальчик'),
              ),
              FormBuilderFieldOption(
                value: false,
               child: Text('Девочка'),),
                      ]),
            ),
          ElevatedButton(onPressed: (){
            final validationSuccess = _formKey.currentState!.validate();
            if (validationSuccess) {
              context.read<ChildFormBloc>().add(SavedButtonPressed(
                name: nameController.text, dateTime: _formKey.currentState?.fields['birthday']?.value, gender: _formKey.currentState?.fields['gender']?.value));
            }
              
          }, 
          child: Text(
            'Сохранить'
          ),
          ),
      ]
      ,),
    )
  );
}
}