class PageConfiguration {
  final bool unknown;
  final bool? projectsLoaded;
  final bool? timelineListLoaded;

  PageConfiguration.splash()
      : unknown = false,
        projectsLoaded = false,
        timelineListLoaded = false;

  PageConfiguration.home()
      : unknown = false,
        projectsLoaded = true,
        timelineListLoaded = true;

  PageConfiguration.unknown()
      : unknown = true,
        projectsLoaded = null,
        timelineListLoaded = null;

  bool get isUnknown => unknown == true;
  bool get isSplashPage =>
      unknown == false &&
      projectsLoaded == false &&
      timelineListLoaded == false;
  bool get isHomePage =>
      unknown == false && projectsLoaded == true && timelineListLoaded == true;
}
