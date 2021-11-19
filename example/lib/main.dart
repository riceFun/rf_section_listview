import 'package:example/TestData.dart';
import 'package:flutter/material.dart';
import 'package:rf_section_listview/rf_section_listview.dart';

void main() {

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  ScrollController? controller;

  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  int _numberOfSection() {
    return personGroups.length;
  }

  int _numberOfRowInSection(int section) {
    return personGroups[section].persons.length;
  }

  void _onClickCellItem(IndexPath indexPath) {
    print('点击了 第${indexPath.section}组, 第${indexPath.row}行');
  }

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

  Widget _sectionHeaderBuilder(BuildContext context, int section) {
    final personGroup = personGroups[section];
    return Text('${personGroup.groupName} header');
  }

  Widget _sectionFooterBuilder(BuildContext context, int section) {
    final personGroup = personGroups[section];
    return Text('${personGroup.groupName} footer');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: SectionListView(
        numberOfSection: _numberOfSection,
        numberOfRowInSection: _numberOfRowInSection,
        cellForRowAtIndexPathBuilder: _cellForRowAtIndexPathBuilder,
        sectionHeaderBuilder: _sectionHeaderBuilder,
        sectionFooterBuilder: _sectionFooterBuilder,
        controller: controller
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
