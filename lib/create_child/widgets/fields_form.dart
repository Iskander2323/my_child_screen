
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:my_child_screen/create_child/bloc/child_form_bloc.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:intl/intl.dart';
import 'package:routemaster/routemaster.dart' as routemaster;

class FieldsForm extends StatefulWidget{
    const FieldsForm({super.key, required this.name, required this.childDateTime, required this.gender});

   final String name;
   final DateTime childDateTime;
   final bool gender;

  @override
  State<FieldsForm> createState() => _FieldsFormState();
}

class _FieldsFormState extends State<FieldsForm> {

final _formKey = GlobalKey<FormBuilderState>();
final TextEditingController nameController = TextEditingController();

@override
  void initState() {
    nameController.text = widget.name;
    super.initState();
  }

@override
Widget build(BuildContext context){
  return Padding(
    padding: const EdgeInsets.all(20.0),
    child: FormBuilder(
        key: _formKey,
        child: 
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          SizedBox(
            height: 60,
            width: double.infinity,
            child: FormBuilderTextField(
              validator: FormBuilderValidators.required(),
              keyboardType: TextInputType.name,
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
              )
              ),
          ),
          const SizedBox(
            height: 10,
          ),
            FormBuilderDateTimePicker(
              format:  DateFormat(DateFormat.YEAR_MONTH_DAY),
              initialValue: widget.childDateTime,
              inputType: InputType.date,
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
            validator: FormBuilderValidators.required()
            ),
            Flexible(
                child: FormBuilderRadioGroup(
                  wrapAlignment: WrapAlignment.center,
                  initialValue: widget.gender,
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
               const SizedBox(
            height: 10,
          ),
            ElevatedButton(onPressed: (){
              final validationSuccess = _formKey.currentState!.validate();
              if (validationSuccess) {
                context.read<ChildFormBloc>().add(SavedButtonPressed(
              
                  name: nameController.text, 
                  dateTime: _formKey.currentState?.fields['birthday']?.value, 
                  gender: _formKey.currentState?.fields['gender']?.value));
                 routemaster.Routemaster.of(context).pop();
              }
             }, 
            child: const Text(
              'Сохранить'
            ),
            ),
        ]
        ,)
      ),
  );
}
}