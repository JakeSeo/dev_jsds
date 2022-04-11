import 'package:dev_jsds/common/ui.dart';
import 'package:dev_jsds/data/content.dart';
import 'package:dev_jsds/data/project.dart';
import 'package:dev_jsds/data/repository/projects_repository.dart';
import 'package:dev_jsds/data/repository/timeline_list_repository.dart';
import 'package:dev_jsds/router/custom_route_information_parser.dart';
import 'package:dev_jsds/router/custom_router_delegate.dart';
import 'package:flutter/material.dart';
import 'package:url_strategy/url_strategy.dart';

void main() {
  setPathUrlStrategy();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late CustomRouterDelegate delegate;
  late CustomRouteInformationParser informationParser;
  late ProjectsRepository projectsRepository;
  late TimelineListRepository timelineListRepository;

  final _contents = contents;

  @override
  void initState() {
    super.initState();
    projectsRepository = ProjectsRepository();
    timelineListRepository = TimelineListRepository();
    delegate = CustomRouterDelegate(
      _contents,
      projectsRepository,
      timelineListRepository,
    );
    informationParser = CustomRouteInformationParser(contents: _contents);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerDelegate: delegate,
      routeInformationParser: informationParser,
    );
  }
}
