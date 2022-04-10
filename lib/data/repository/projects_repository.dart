import 'package:dev_jsds/data/project.dart';

class ProjectsRepository {
  Future<List<Project>> fetchProjects() async {
    return Future.delayed(const Duration(seconds: 3)).then((value) {
      return sampleProjectList;
    });
  }
}
