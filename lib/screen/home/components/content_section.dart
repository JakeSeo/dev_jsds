import 'package:dev_jsds/data/content.dart';
import 'package:flutter/material.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class ContentSection extends StatefulWidget {
  final List<Content>? contents;
  final ValueNotifier<Content?> contentNotifier;
  const ContentSection({
    Key? key,
    required this.contents,
    required this.contentNotifier,
  }) : super(key: key);

  @override
  State<ContentSection> createState() => _ContentSectionState();
}

class _ContentSectionState extends State<ContentSection> {
  /// Controller to scroll or jump to a particular item.
  final ItemScrollController _itemScrollController = ItemScrollController();

  /// Listener that reports the position of items when the list is scrolled.
  final ItemPositionsListener _itemPositionsListener =
      ItemPositionsListener.create();

  int get trailingIndex {
    /// Determine the first visible item by finding the item with the
    /// smallest trailing edge that is greater than 0.  i.e. the first
    /// item whose trailing edge in visible in the viewport.
    final firstVisibleContentIndex = _itemPositionsListener.itemPositions.value
        .where((ItemPosition position) => position.itemTrailingEdge > 0)
        .reduce((ItemPosition min, ItemPosition position) =>
            position.itemTrailingEdge < min.itemTrailingEdge ? position : min)
        .index;
    return firstVisibleContentIndex;
  }

  int get contentIndex {
    int index = widget.contents!.indexWhere((element) {
      final urlSection = widget.contentNotifier.value?.urlSection;
      return element.urlSection == urlSection;
    });
    return index > -1 ? index : 0;
  }

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance!.addPostFrameCallback((_) {
      _scrollToIndex();
      widget.contentNotifier.addListener(() {
        final fromScroll =
            widget.contentNotifier.value?.source == ContentSource.fromScroll;
        if (_itemScrollController.isAttached && !fromScroll) {
          _scrollToIndex();
        }
      });
    });
  }

  void _scrollToIndex() {
    _itemScrollController.scrollTo(
      index: contentIndex,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOutCubic,
    );
  }

  Widget _getContent(index) {
    print(index);
    print(ContentIndex.flutter.index);
    switch (ContentIndex.values[index]) {
      case ContentIndex.home:
        return Container(
          height: 1000,
          child: Text("home"),
        );
      case ContentIndex.flutter:
        return Container(
          height: 500,
          child: Text("flutter"),
        );
      case ContentIndex.info:
        return Container(
          height: 500,
          child: Text("info"),
        );
      case ContentIndex.timeline:
        return Container(
          height: 500,
          child: Text("timeline"),
        );
      case ContentIndex.projects:
        return Container(
          height: 500,
          child: Text("projects"),
        );
      case ContentIndex.thankyou:
        return Container(
          height: 500,
          child: Text("thankyou"),
        );
    }
    return Container(
      child: Text("unknown"),
    );
  }

  ScrollablePositionedList _scrollablePositionedList() {
    return ScrollablePositionedList.builder(
      itemScrollController: _itemScrollController,
      itemPositionsListener: _itemPositionsListener,
      itemCount: widget.contents!.length,
      physics: AlwaysScrollableScrollPhysics(),
      itemBuilder: (BuildContext context, int index) {
        return Container(
          alignment: Alignment.center,
          child: _getContent(index),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return NotificationListener<ScrollNotification>(
      onNotification: (notification) {
        if (notification is UserScrollNotification) {
          Content content = widget.contents![trailingIndex];
          widget.contentNotifier.value = Content(
            koreanName: content.koreanName,
            englishName: content.englishName,
            urlSection: content.urlSection,
            source: ContentSource.fromScroll,
          );
        }
        return true;
      },
      child: _scrollablePositionedList(),
    );
  }
}
