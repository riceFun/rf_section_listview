# rf_section_listview
the section listview package for flutter
仿iOS group tableview的小组件- [rf_section_listview](https://pub.flutter-io.cn/packages/rf_section_listview/install)，支持 自定义分组，自定义组头、自定义组尾，使用和iOS  tableview代理类似，非常方便。

![Simulator Screen Shot - iPhone 12 - 2021-11-19 at 16.03.19.png](https://p1-juejin.byteimg.com/tos-cn-i-k3u1fbpfcp/8dc56731c5bf49b2962983d12d54d69b~tplv-k3u1fbpfcp-watermark.image?)

## 使用
```
class _MyHomePageState extends State<MyHomePage> {
  ScrollController? controller;

  //返回多少组
  int _numberOfSection() {
    return personGroups.length;
  }

  //每组多少行
  int _numberOfRowInSection(int section) {
    return personGroups[section].persons.length;
  }

  // 每行的样式
  Widget _cellForRowAtIndexPathBuilder(BuildContext context, IndexPath indexPath) {
    final person = personGroups[indexPath.section].persons[indexPath.row];
    return GestureDetector(
      onTap: () {
        _onClickCellItem(indexPath);
      },
      child: Padding(padding: EdgeInsets.all(8.0),child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(person.name),
          Text('${person.height}'),
        ],)
      ),
    );
  }

  //组头样式
  Widget _sectionHeaderBuilder(BuildContext context, int section) {
    final personGroup = personGroups[section];
    return Text('${personGroup.groupName} header');
  }

  //组尾样式
  Widget _sectionFooterBuilder(BuildContext context, int section) {
    final personGroup = personGroups[section];
    return Text('${personGroup.groupName} footer');
  }

  //点击事件
  void _onClickCellItem(IndexPath indexPath) {
    print('点击了 第${indexPath.section}组, 第${indexPath.row}行');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text('rf_section_listview demo'),
      ),
      body: SectionListView(
        numberOfSection: _numberOfSection,
        numberOfRowInSection: _numberOfRowInSection,
        cellForRowAtIndexPathBuilder: _cellForRowAtIndexPathBuilder,
        sectionHeaderBuilder: _sectionHeaderBuilder, //可选
        sectionFooterBuilder: _sectionFooterBuilder, // 可选
        controller: controller //可选
      ),
    );
  }
}
```

