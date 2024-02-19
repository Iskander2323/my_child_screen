import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_child_screen/child_list/view/children_page.dart';
import 'package:my_child_screen/create_child/view/child_form_page.dart';

import 'package:my_child_screen/repository/children_repository.dart';
import 'package:routemaster/routemaster.dart';

final routes = RouteMap(
  routes: {
    '/': (_) => const MaterialPage(child: ChildrenPage()),
    '/add/': (_) => const MaterialPage(child: ChildFormPage()),
    '/add/:id': (routeData) {
        final id = routeData.pathParameters['id'] ?? '';

        return MaterialPage(child: ChildFormPage(id: id));
    },
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
