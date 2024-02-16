import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_child_screen/child_list/bloc/children_bloc.dart';

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
  Widget build(BuildContext context) {
    return
      BlocBuilder<ChildrenBloc, ChildrenState>(builder: (context, state) {
        switch(state.status) {
          case ChildStatus.failure:
               return ListView.builder(
              itemBuilder: (BuildContext context, int index) {
                return index == state.children.length
                    ? Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        TextButton(onPressed: (){
                          routemaster.Routemaster.of(context).push('/add/');
                        },
                        style: TextButton.styleFrom(
                          shape: const BeveledRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(5))),
                          backgroundColor: Color.fromARGB(255, 5, 97, 172),
                        ),
                         child: Text('Add', style: TextStyle(color: Colors.white),)),
                        TextButton(
                          style: TextButton.styleFrom(
                            shape: const BeveledRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(5))),
                            backgroundColor: Colors.red,
      
                          ),
                          onPressed: (){
                            context.read<ChildrenBloc>().add(DeleteAll());
                          }, child: Text('Delete All',  style: TextStyle(color: Colors.white))),
                      ],
                    )
                    : ChildrenListItem(children: state.children[index]!);
              },
              itemCount: state.children.length+1,
            );
            case ChildStatus.success:
             return ListView.builder(
              itemBuilder: (BuildContext context, int index) {
                return index == state.children.length
                    ? Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        TextButton(onPressed: (){
                          routemaster.Routemaster.of(context).push('/add/');
                        },
                        style: TextButton.styleFrom(
                          shape: const BeveledRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(5))),
                          backgroundColor: Color.fromARGB(255, 5, 97, 172),
                        ),
                         child: Text('Add', style: TextStyle(color: Colors.white),)),
                        TextButton(
                          style: TextButton.styleFrom(
                            shape: const BeveledRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(5))),
                            backgroundColor: Colors.red,
      
                          ),
                          onPressed: (){
                            context.read<ChildrenBloc>().add(DeleteAll());
                          }, child: Text('Delete All',  style: TextStyle(color: Colors.white))),
                      ],
                    )
                    : ChildrenListItem(children: state.children[index]!);
              },
              itemCount: state.children.length+1,
            );
            case ChildStatus.initial:
            return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
