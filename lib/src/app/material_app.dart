import 'package:flex_test/src/widgets/test_tool_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppMaterial extends StatelessWidget {
  const AppMaterial({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material Test App',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Material Test App'),
          actions: [TestToolBar()],
        ),
        body: const Center(
          child: MaterialTestPage(),
        ),
      ),
    );
  }
}
