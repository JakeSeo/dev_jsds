import 'package:dev_jsds/data/content.dart';

class PageConfiguration {
  final bool unknown;
  final Content? content;

  PageConfiguration.splash()
      : unknown = false,
        content = null;

  PageConfiguration.home({Content? content})
      : unknown = false,
        content = content;

  PageConfiguration.unknown()
      : unknown = true,
        content = null;

  bool get isUnknown => unknown == true;
  bool get isSplashPage => unknown == false && content == null;
  bool get isHomePage => unknown == false && content != null;
}
