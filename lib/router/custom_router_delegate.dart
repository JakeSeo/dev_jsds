import 'package:dev_jsds/data/content.dart';
import 'package:dev_jsds/data/project.dart';
import 'package:dev_jsds/data/repository/projects_repository.dart';
import 'package:dev_jsds/router/page_configuration.dart';
import 'package:dev_jsds/screen/home/home_screen.dart';
import 'package:dev_jsds/screen/unknown_screen.dart';
import 'package:flutter/material.dart';

import '../data/repository/timeline_list_repository.dart';
import '../data/timeline.dart';

class CustomRouterDelegate extends RouterDelegate<PageConfiguration>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin<PageConfiguration> {
  final GlobalKey<NavigatorState> _navigatorKey = GlobalKey<NavigatorState>();
  final ProjectsRepository projectsRepository;
  final TimelineListRepository timelineListRepository;

  final ValueNotifier<Content?> _contentNotifier = ValueNotifier(null);
  final ValueNotifier<bool?> _unknownStateNotifier = ValueNotifier(null);

  late Page _homePage;

  final List<Content> contents;
  Content get defaultContent => contents.first;

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: navigatorKey,
      pages: _unknownStateNotifier.value == true
          ? [
              MaterialPage(
                key: ValueKey<String>("Unknown"),
                child: UnknownScreen(),
              )
            ]
          : [
              _homePage,
            ],
      onPopPage: (route, result) {
        if (!route.didPop(result)) return false;
        return true;
      },
    );
  }

  @override
  PageConfiguration? get currentConfiguration {
    if (_unknownStateNotifier.value == true) {
      return PageConfiguration.unknown();
    } else if (_contentNotifier.value != null) {
      return PageConfiguration.home(content: _contentNotifier.value);
    } else {
      return null;
    }
  }

  @override
  GlobalKey<NavigatorState>? get navigatorKey => _navigatorKey;

  CustomRouterDelegate(
    this.contents,
    this.projectsRepository,
    this.timelineListRepository,
  ) {
    _homePage = MaterialPage(
      key: ValueKey<String>("HomePage"),
      child: HomeScreen(
        contents: contents,
        contentNotifier: _contentNotifier,
      ),
    );
    Listenable.merge([
      _contentNotifier,
      _unknownStateNotifier,
    ])
      ..addListener(() {
        notifyListeners();
      });
    _init();
  }

  _init() async {}

  @override
  Future<void> setNewRoutePath(PageConfiguration configuration) async {
    if (configuration.isUnknown) {
      _unknownStateNotifier.value = true;
      _contentNotifier.value = null;
    } else if (configuration.isSplashPage) {
    } else if (configuration.isHomePage) {
      _unknownStateNotifier.value = false;
      Content? currentContent = configuration.content;
      _contentNotifier.value = Content(
        koreanName: currentContent != null
            ? currentContent.koreanName
            : defaultContent.koreanName,
        englishName: currentContent != null
            ? currentContent.englishName
            : defaultContent.englishName,
        urlSection: currentContent != null
            ? currentContent.urlSection
            : defaultContent.urlSection,
        source: ContentSource.fromBrowserAddressBar,
      );
    } else {
      print('Could not set new route');
    }
  }

  _clear() {}
}
