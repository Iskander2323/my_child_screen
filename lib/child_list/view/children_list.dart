import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_child_screen/child_list/bloc/children_bloc.dart';
import 'package:my_child_screen/child_list/widgets/bottom_loader.dart';
import 'package:my_child_screen/child_list/widgets/children_list_item.dart';
<<<<<<< Updated upstream
=======
import 'package:my_child_screen/repository/children_repository.dart';
import 'package:routemaster/routemaster.dart' as routemaster;
>>>>>>> Stashed changes

class ChildrenList extends StatefulWidget {
  const ChildrenList({super.key});

  @override
  State<ChildrenList> createState() => _ChildrenListState();
}

class _ChildrenListState extends State<ChildrenList> {
  
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChildBloc, ChildState>(builder: (context, state) {
<<<<<<< Updated upstream
      switch (state.status) {
        case ChildStatus.failure:
          return const Center(child: Text('failed to load children'));
        case ChildStatus.success:
          return ListView.builder(
              itemBuilder: (BuildContext context, int index) {
            return index >= state.children.length
                ? const BottomLoader()
                : ChildrenListItem(children: state.children[index]);
          });

        case ChildStatus.initial:
          return const Center(child: CircularProgressIndicator());
      }
=======
      switch(state.status){
        case ChildStatus.failure:
          return ListView.builder(
            itemBuilder: (context, index) {
                return TextButton(
                  onPressed:(){},
                child: const Text('Add child'),
                ); 
            }
          );
        case ChildStatus.success:
           return ListView.builder(
             itemCount: state.children.length+1,
             itemBuilder: (context, index) {
             return index == state.children.length ? Row(
               crossAxisAlignment: CrossAxisAlignment.end,
               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
               children: [
                 TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.blueAccent,
                    shape: const BeveledRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(5))),
                  ),
                  onPressed: (){
                     routemaster.Routemaster.of(context).push('/add');
                  },
                  child: const Text('Add',
                  style: TextStyle(
                    color: Colors.white,
                  ),)),
                  TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 170, 5, 5),
                    shape: const BeveledRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(5))),
                  ),
                  onPressed: (){
                     ChildrenRepository().deleteAll();
                     BlocProvider.of<ChildBloc>(context).fetchData();
                  },
                  child: const Text('Delete All',
                   style: TextStyle(
                    color: Colors.white,
                  ),)),
               ],
             ) : ChildrenListItem(
               children: state.children[index]!);
           });
           case ChildStatus.initial:
           return const BottomLoader();
        } 
>>>>>>> Stashed changes
    });
  }
}
