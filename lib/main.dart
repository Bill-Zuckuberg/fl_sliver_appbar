import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Sliver AppBar',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const SliverAppBaExamble(title: 'Sliver AppBar'),
    );
  }
}

class SliverAppBaExamble extends StatefulWidget {
  const SliverAppBaExamble({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<SliverAppBaExamble> createState() => _SliverAppBaExambleState();
}

class _SliverAppBaExambleState extends State<SliverAppBaExamble> {
  bool _pinned = true;
  bool _snap = false;
  bool _floating = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            pinned: _pinned,
            snap: _snap,
            floating: _floating,
            expandedHeight: 160.0,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(widget.title),
              background: Container(
                color: Colors.green,
                height: 160.0,
              ),
            ),
          ),
          const SliverFillRemaining(
              child: Center(
            child: Text('Hello'),
          ))
        ],
      ),
      bottomNavigationBar: _getBottomAppbar(),
    );
  }

  Widget _getBottomAppbar() {
    return BottomAppBar(
        child: Row(
      children: [
        const Text('Pinned'),
        Switch(
            value: _pinned,
            onChanged: (bool val) {
              setState(() {
                _pinned = val;
              });
            }),
        const Text('Snap'),
        Switch(
            value: _snap,
            onChanged: (bool val) {
              setState(() {
                _snap = val;
              });
            }),
        const Text('Float'),
        Switch(
            value: _floating,
            onChanged: (bool val) {
              setState(() {
                _floating = val;
              });
            })
      ],
    ));
  }
}
