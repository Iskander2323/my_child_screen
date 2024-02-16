import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:my_child_screen/app.dart';
import 'package:my_child_screen/bloc_observer.dart';


import 'package:my_child_screen/repository/children_repository.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Bloc.observer = const SimpleBlocObserver();
  final childrenRepository = ChildrenRepository();
  runApp(startApp(childrenRepository));
}
