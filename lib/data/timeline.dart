class Timeline {
  String? name;
  DateTime? from;
  DateTime? to;
  bool? isDevRelated;

  Timeline({this.name, this.from, this.to, this.isDevRelated});
}

List<Timeline> sampleTimelineList = [
  Timeline(name: "유년기"),
  Timeline(name: "필리핀 유햑"),
  Timeline(name: "특전사 어학병"),
  Timeline(name: "고고테크 입사"),
  Timeline(name: "THE FUTURE")
];
