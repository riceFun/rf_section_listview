import 'package:flutter/material.dart';

class IndexPath {
  final int section;
  final int row;

  IndexPath(this.section, this.row);
}

typedef NumberOfSection = int Function();
typedef NumberOfRowInSection = int Function(int section);
typedef CellForRowAtIndexPathBuilder = Widget Function(BuildContext context, IndexPath indexPath);
typedef SectionHeaderBuilder = Widget Function(BuildContext context, int section);
typedef SectionFooterBuilder = Widget Function(BuildContext context, int section);

class SectionListView extends StatefulWidget {
  NumberOfSection numberOfSection;
  NumberOfRowInSection numberOfRowInSection;
  CellForRowAtIndexPathBuilder cellForRowAtIndexPathBuilder;
  SectionHeaderBuilder? sectionHeaderBuilder;
  SectionFooterBuilder? sectionFooterBuilder;
  ScrollController? controller;

  SectionListView({
    Key? key,
    required this.numberOfSection,
    required this.numberOfRowInSection,
    required this.cellForRowAtIndexPathBuilder,
    this.sectionHeaderBuilder,
    this.sectionFooterBuilder,
    this.controller,
  });

  @override
  _SectionListViewState createState() => _SectionListViewState();
}

class _SectionListViewState extends State<SectionListView> {
  ScrollController? _controller;

  @override
  void initState() {
    super.initState();
  }

  Widget _itemBuilder(BuildContext context, int index) {
    //根据index计算 IndexPath
    int _count = 0;
    int section = widget.numberOfSection();
    int tempSection = 0;
    bool isSectionHeader = false;
    bool isSectionFooter = false;
    bool isNormalRow = true;
    late IndexPath pIndexPath;

    while (tempSection != section) {
      //是否需要sectionHeader
      if (widget.sectionHeaderBuilder != null) {
        _count++;
        if (_count == (index + 1)) {
          isSectionHeader = true;
          pIndexPath = IndexPath(tempSection, 0);
          break;
        }
      }

      int currentSectionRowCount = widget.numberOfRowInSection(tempSection);
      int tempCount = currentSectionRowCount + _count;
      if (tempCount >= (index + 1)) {//说明index就在这个section内
        pIndexPath = IndexPath(tempSection, index - _count);
        break;
      }
      _count = tempCount;

      //是否需要sectionFooter
      if (widget.sectionFooterBuilder != null) {
        _count++;
        if (_count == (index + 1)) {
          isSectionFooter = true;
          pIndexPath = IndexPath(tempSection, 0);
          break;
        }
      }
      tempSection++;
    }

    if (isSectionHeader) {
      return widget.sectionHeaderBuilder!(context, pIndexPath.section);
    } else if (isSectionFooter) {
      return widget.sectionFooterBuilder!(context, pIndexPath.section);
    } else {
      return widget.cellForRowAtIndexPathBuilder(context, pIndexPath);
    }
  }

  int _itemCount() {
    int _count = 0;
    int section = widget.numberOfSection();
    int i = 0;
    while (i != section) {
      //是否需要sectionHeader
      if (widget.sectionHeaderBuilder != null) {
        _count++;
      }
      _count = widget.numberOfRowInSection(i) + _count;
      //是否需要sectionFooter
      if (widget.sectionFooterBuilder != null) {
        _count++;
      }
      i++;
    }
    return _count;
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemBuilder: _itemBuilder,
        itemCount: _itemCount(),
        controller: widget.controller,
    );
  }
}
