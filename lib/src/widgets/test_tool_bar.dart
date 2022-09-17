import 'package:flex_test/src/bloc/test_bloc.dart';
import 'package:flex_test/src/bloc/test_bloc_event.dart';
import 'package:flutter/material.dart' as m;
import 'package:flutter/cupertino.dart' as c;

import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:woue_components/woue_components.dart';

class TestToolBar extends StatelessWidget {
  const TestToolBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return m.Card(
        child: Row(
      children: [
        m.IconButton(
            onPressed: () => BlocProvider.of<TestBloc>(context)
                .add(TestBlocEventSelectEnvironment(DesignFramework.material)),
            icon: Icon(m.Icons.android)),
        m.IconButton(
            onPressed: () => BlocProvider.of<TestBloc>(context)
                .add(TestBlocEventSelectEnvironment(DesignFramework.fluent)),
            icon: Icon(m.Icons.window_sharp)),
        m.IconButton(
            onPressed: () => BlocProvider.of<TestBloc>(context)
                .add(TestBlocEventSelectEnvironment(DesignFramework.macos)),
            icon: Icon(m.Icons.apple)),
        m.IconButton(
            onPressed: () => BlocProvider.of<TestBloc>(context)
                .add(TestBlocEventSelectEnvironment(DesignFramework.cupertino)),
            icon: Icon(m.Icons.mobile_friendly_sharp)),
        m.IconButton(
            onPressed: () => BlocProvider.of<TestBloc>(context)
                .add(TestBlocEventSelectEnvironment(DesignFramework.yaru)),
            icon: Icon(m.Icons.library_books_sharp)),
      ],
    ));
  }
}
