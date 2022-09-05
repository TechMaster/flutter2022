import 'dart:developer';

import 'package:flutter/material.dart';

class DemoListWheelScrollView extends StatefulWidget {
  const DemoListWheelScrollView({Key? key}) : super(key: key);

  @override
  _DemoListWheelScrollViewState createState() =>
      _DemoListWheelScrollViewState();
}

class _DemoListWheelScrollViewState extends State<DemoListWheelScrollView> {
  double _diameterRatio = 2;

  double _offAxisFraction = 0;

  double _magnification = 1;

  final ScrollController _controller = ScrollController();

  initListData(_) async {
    // _controller.jumpTo();
  }

  @override
  void initState() {
    super.initState();
  }

  void _onTestTimeLine() async {
    Timeline.startSync('_onTestTimeLine');
    print('handle _onTestTimeLine');
    Timeline.finishSync();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ListWheelScrollView demo'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Spacer(),
            SizedBox(
              height: 300,
              child: ListWheelScrollView(
                useMagnifier: true,
                magnification: 1.5,
                diameterRatio: 2,
                onSelectedItemChanged: (index) {},
                itemExtent: 100,
                children: <Widget>[
                  for (int i = 0; i < 10; i++) MyItem(index: i + 1)
                ],
              ),
            ),
            Spacer(),
            InkWell(
              child: Text('offAxisFraction'),
              onTap: _onTestTimeLine,
            ),
            Slider(
              value: _offAxisFraction,
              onChanged: (newValue) =>
                  setState(() => _offAxisFraction = newValue),
              min: -2,
              max: 2,
            ),
            Text('diameterRatio'),
            Slider(
              value: _diameterRatio,
              onChanged: (newValue) =>
                  setState(() => _diameterRatio = newValue),
              min: 0.1,
              max: 10,
            ),
            Text('magnification'),
            Slider(
              value: _magnification,
              onChanged: (newValue) =>
                  setState(() => _magnification = newValue),
              min: 1,
              max: 3,
            ),
          ],
        ),
      ),
    );
  }
}

class MyItem extends StatelessWidget {
  final int index;

  MyItem({required this.index, Key? key}) : super(key: key);

  static const colors = [
    Colors.pink,
    Colors.indigo,
    Colors.grey,
    Colors.red,
    Colors.blue,
    Colors.green,
    Colors.yellow,
  ];

  @override
  Widget build(BuildContext context) {
    print('MyItem: $index');
    return AspectRatio(
      aspectRatio: 16 / 9,
      child: Container(
        color: colors[index % colors.length],
        child: Center(
            child: Text(
          '$index',
          style: TextStyle(color: Colors.white),
        )),
      ),
    );
  }
}
