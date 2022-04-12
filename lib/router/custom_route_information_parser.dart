import 'package:dev_jsds/data/content.dart';
import 'package:flutter/material.dart';

import 'page_configuration.dart';

class CustomRouteInformationParser
    extends RouteInformationParser<PageConfiguration> {
  final List<Content> contents;
  CustomRouteInformationParser({required this.contents});
  @override
  Future<PageConfiguration> parseRouteInformation(
      RouteInformation routeInformation) async {
    final uri = Uri.parse(routeInformation.location!);
    if (uri.pathSegments.isEmpty) {
      return PageConfiguration.home();
    } else if (uri.pathSegments.length == 1) {
      final first = uri.pathSegments[0].toLowerCase();
      int index = _getIndexOfURLSection(first);
      if (index >= 0) {
        return PageConfiguration.home(content: contents[index]);
      } else {
        return PageConfiguration.unknown();
      }
    } else if (uri.pathSegments.length == 2) {
      final first = uri.pathSegments[0].toLowerCase();
      final second = uri.pathSegments[0].toLowerCase();
      print(first + " " + second);
      int index = _getIndexOfURLSection(second);
      if (index >= 0) {
        return PageConfiguration.home(content: contents[index]);
      } else {
        return PageConfiguration.unknown();
      }
    } else {
      return PageConfiguration.unknown();
    }
  }

  @override
  RouteInformation? restoreRouteInformation(PageConfiguration configuration) {
    if (configuration.isUnknown) {
      return RouteInformation(location: '/unknown');
    } else if (configuration.isSplashPage) {
      return null;
    } else if (configuration.isHomePage) {
      return RouteInformation(
          location: '/${configuration.content?.urlSection}');
    } else {
      return null;
    }
  }

  int _getIndexOfURLSection(String urlSection) {
    final List<String?> urlSections = contents.map((e) {
      return e.urlSection;
    }).toList();

    return urlSections.indexOf(urlSection);
  }
}
