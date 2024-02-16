import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
<<<<<<< Updated upstream
=======
import 'package:my_child_screen/create_child/child_form/register_from.dart';
>>>>>>> Stashed changes
import 'package:my_child_screen/child_list/view/children_page.dart';
import 'package:my_child_screen/create_child/view/create_child_page.dart';
import 'package:my_child_screen/repository/children_repository.dart';
import 'package:routemaster/routemaster.dart';

final routes = RouteMap(
  routes: {
    '/': (_) => const MaterialPage(child: ChildrenPage()),
<<<<<<< Updated upstream
    '/add/': (_) => const MaterialPage(child: CreateChildPage())
=======
    '/add/': (_) => const MaterialPage(child: ChildFormProvider())
>>>>>>> Stashed changes
  },
);

class App extends MaterialApp {
  const App({
    super.key,
    required RouterDelegate<Object> routedDelegate,
    required RouteInformationParser<Object> routeInformationParser,
  }) : super.router(
            routerDelegate: routedDelegate,
            routeInformationParser: routeInformationParser);
}

Widget startApp(ChildrenRepository postsRepository) {
  return RepositoryProvider.value(
    value: postsRepository,
    child: App(
      routedDelegate: RoutemasterDelegate(routesBuilder: (context) => routes),
      routeInformationParser: const RoutemasterParser(),
    ),
  );
}
