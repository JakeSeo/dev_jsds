import 'package:dev_jsds/data/project.dart';
import 'package:dev_jsds/data/repository/projects_repository.dart';
import 'package:dev_jsds/router/page_configuration.dart';
import 'package:flutter/material.dart';

import '../data/repository/timeline_list_repository.dart';
import '../data/timeline.dart';

class CustomRouterDelegate extends RouterDelegate<PageConfiguration>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin<PageConfiguration> {
  final GlobalKey<NavigatorState> _navigatorKey = GlobalKey<NavigatorState>();
  final ProjectsRepository projectsRepository;
  final TimelineListRepository timelineListRepository;

  bool? _show404;
  bool? get show404 => _show404;
  set show404(bool? value) {
    _show404 = value;
    if (value == true) {
      _projectsLoaded = false;
      _timelineListLoaded = false;
    }
    notifyListeners();
  }

  List<Project>? _projects;
  List<Project>? get projects => _projects;
  set projects(List<Project>? value) {
    _projects = value;
    notifyListeners();
  }

  bool? _projectsLoaded;
  bool? get projectsLoaded => _projectsLoaded;
  set projectsLoaded(bool? value) {
    _projectsLoaded = value;
    notifyListeners();
  }

  List<Timeline>? _timelineList;
  List<Timeline>? get timelineList => _timelineList;
  set timelineList(List<Timeline>? value) {
    _timelineList = value;
    notifyListeners();
  }

  bool? _timelineListLoaded;
  bool? get timelineListLoaded => _timelineListLoaded;
  set timelineListLoaded(bool? value) {
    _timelineListLoaded = value;
    notifyListeners();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }

  @override
  PageConfiguration? get currentConfiguration {
    if (show404 == true) {
      return PageConfiguration.unknown();
    } else if (projectsLoaded == true && timelineListLoaded == true) {
      return PageConfiguration.home();
    } else {
      return null;
    }
  }

  @override
  GlobalKey<NavigatorState>? get navigatorKey => _navigatorKey;

  CustomRouterDelegate(this.projectsRepository, this.timelineListRepository) {
    _init();
  }

  _init() async {
    projects = await projectsRepository.fetchProjects();
    projectsLoaded = projects != null;
    timelineList = await timelineListRepository.fetchTimelineList();
    timelineListLoaded = timelineList != null;
  }

  @override
  Future<void> setNewRoutePath(PageConfiguration configuration) async {
    if (configuration.isUnknown) {
      show404 = true;
    } else if (configuration.isSplashPage) {
      show404 = false;
      projectsLoaded = false;
      timelineListLoaded = false;
    } else if (configuration.isHomePage) {
      show404 = false;
      projectsLoaded = true;
      timelineListLoaded = true;
    } else {
      print('Could not set new route');
    }
  }

  _clear() {
    show404 = null;
    projectsLoaded = null;
    timelineListLoaded = null;
  }
}
