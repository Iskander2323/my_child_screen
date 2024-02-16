import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_child_screen/child_list/bloc/children_bloc.dart';
import 'package:my_child_screen/child_list/model/child_model.dart';

import 'package:my_child_screen/child_list/widgets/children_list_item.dart';
import 'package:my_child_screen/repository/children_repository.dart';

import 'package:routemaster/routemaster.dart' as routemaster;

class ChildrenList extends StatefulWidget {
  const ChildrenList( { required this.childrenRepository, super.key});

  final ChildrenRepository childrenRepository;

  @override
  State<ChildrenList> createState() => _ChildrenListState();
}

class _ChildrenListState extends State<ChildrenList> {
  @override
  void initState() {
    super.initState();
    // Подписываемся на стрим для отслеживания вставок
    ChildrenRepository().insertStream.listen((inserted) {
      if (inserted) {
        context.read<ChildBloc>().fetchData();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<ChildBloc,ChildState>(
      listener: (context,state){
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.children.length.toString()),duration : const Duration(seconds: 1)));
      },
      child: BlocBuilder<ChildBloc, ChildState>(builder: (context, state) {
        List<ChildModel?> listChild = state.children;
        log(listChild.length.toString(), name: "ListChild length");
         return ListView.builder(
              itemBuilder: (BuildContext context, int index) {
                return index == state.children.length
                    ? Row(
                      children: [
                        TextButton(onPressed: (){
                          routemaster.Routemaster.of(context).push('/add/');
                        },
                        style: TextButton.styleFrom(
                          shape: const BeveledRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(5))),
                          backgroundColor: Color.fromARGB(255, 5, 97, 172),
                          // minimumSize: const Size.fromWidth(30),
                          //   maximumSize: const Size.fromWidth(30)
                        ),
                         child: Text('Add', style: TextStyle(color: Colors.white),)),
                        TextButton(
                          style: TextButton.styleFrom(
                            shape: const BeveledRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(5))),
                            backgroundColor: Colors.red,
      
                          ),
                          onPressed: (){
                            context.read<ChildBloc>().add(DeleteAll());
                            //BlocProvider.of<ChildBloc>(context).fetchData();
                          }, child: Text('Delete All',  style: TextStyle(color: Colors.white))),
                           TextButton(onPressed: (){
                                context.read<ChildBloc>().add(Updated());
                        },
                        style: TextButton.styleFrom(
                          shape: const BeveledRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(5))),
                          backgroundColor: Color.fromARGB(255, 5, 97, 172),
                          // minimumSize: const Size.fromWidth(30),
                          //   maximumSize: const Size.fromWidth(30)
                        ),
                         child: Text('UPDATE', style: TextStyle(color: Colors.white),)),
                         TextButton(onPressed: (){
                                context.read<ChildBloc>().add(ChildFetched());
                        },
                        style: TextButton.styleFrom(
                          shape: const BeveledRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(5))),
                          backgroundColor: Color.fromARGB(255, 5, 97, 172),
                          // minimumSize: const Size.fromWidth(30),
                          //   maximumSize: const Size.fromWidth(30)
                        ),
                         child: Text('FetchedDAATA', style: TextStyle(color: Colors.white),)),
                      ],
                    )
                    : ChildrenListItem(children: state.children[index]!);
              },
              itemCount: state.children.length+1,
            );
      }),
    );
  }
}
