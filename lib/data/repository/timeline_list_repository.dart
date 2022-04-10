import 'package:dev_jsds/data/timeline.dart';

class TimelineListRepository {
  Future<List<Timeline>> fetchTimelineList() async {
    return Future.delayed(const Duration(seconds: 3)).then((value) {
      return sampleTimelineList;
    });
  }
}
