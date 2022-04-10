class Project {
  String? name;
  String? description;
  DateTime? from;
  DateTime? to;

  Project({
    this.name,
    this.description,
    this.from,
    this.to,
  });
}

List<Project> sampleProjectList = [
  Project(name: "퓨어싱크", description: "환기청정기 연결 IoT 애플리케이션 및 통신모듈 개발"),
  Project(name: "덴티스 수술등"),
  Project(name: "오누이 메뉴판"),
];
