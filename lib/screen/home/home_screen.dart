import 'package:dev_jsds/data/content.dart';
import 'package:dev_jsds/data/project.dart';
import 'package:dev_jsds/data/timeline.dart';
import 'package:dev_jsds/screen/home/components/content_section.dart';
import 'package:dev_jsds/screen/home/components/top_bar.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  final List<Content> contents;
  final ValueNotifier<Content?> contentNotifier;
  HomeScreen({
    Key? key,
    required this.contents,
    required this.contentNotifier,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          TopBar(),
          Expanded(
            child: ContentSection(
              contents: contents,
              contentNotifier: contentNotifier,
            ),
          ),
        ],
      ),
    );
  }
}
