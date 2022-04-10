class Content {
  String? koreanName;
  String? englishName;
  String? urlSection;
  ContentSource? source;
  Content({
    required this.koreanName,
    required this.englishName,
    required this.urlSection,
    required this.source,
  });
}

enum ContentSource {
  fromScroll,
  fromButtonClick,
  fromBrowserAddressBar,
}

enum ContentIndex {
  home,
  flutter,
  info,
  timeline,
  projects,
  thankyou,
}

List<Content> contents = [
  Content(
    koreanName: "홈",
    englishName: "Home",
    urlSection: "home",
    source: ContentSource.fromBrowserAddressBar,
  ),
  Content(
    koreanName: "플러터",
    englishName: "Flutter",
    urlSection: "flutter",
    source: ContentSource.fromBrowserAddressBar,
  ),
  Content(
    koreanName: "개인정보",
    englishName: "Personal Information",
    urlSection: "info",
    source: ContentSource.fromBrowserAddressBar,
  ),
  Content(
    koreanName: "타임라인",
    englishName: "Timeline",
    urlSection: "timeline",
    source: ContentSource.fromBrowserAddressBar,
  ),
  Content(
    koreanName: "프로젝트",
    englishName: "Projects",
    urlSection: "projects",
    source: ContentSource.fromBrowserAddressBar,
  ),
  Content(
    koreanName: "감사합니다",
    englishName: "Thank you",
    urlSection: "thankyou",
    source: ContentSource.fromBrowserAddressBar,
  ),
];
