class PageConfiguration {
  final bool unknown;
  final bool? dataLoaded;

  PageConfiguration.splash()
      : unknown = false,
        dataLoaded = false;

  PageConfiguration.home()
      : unknown = false,
        dataLoaded = true;

  PageConfiguration.unknown()
      : unknown = true,
        dataLoaded = null;

  bool get isUnknown => unknown == true;
  bool get isSplashPage => unknown == false && dataLoaded == false;
  bool get isHomePage => unknown == false && dataLoaded == true;
}
