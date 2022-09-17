import 'package:flex_test/src/bloc/test_bloc.dart';
import 'package:flex_test/src/bloc/test_bloc_state.dart';
import 'package:flex_test/src/model/test_group.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:url_strategy/url_strategy.dart';
import 'package:window_manager/window_manager.dart';
import 'package:woue_components/woue_components.dart';

class FlexTestApp extends StatelessWidget {
  final Map<DesignFramework, Widget Function(BuildContext)> testEnvironments;
  final List<TestGroup> tests;

  const FlexTestApp(this.testEnvironments, this.tests, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => TestBloc(tests, testEnvironments.keys.first),
      child: SelectEnvironment(testEnvironments),
    );
  }
}

class SelectEnvironment extends StatelessWidget {
  const SelectEnvironment(this.testEnvironments, {Key? key}) : super(key: key);
  final Map<DesignFramework, Widget Function(BuildContext)> testEnvironments;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TestBloc, TestBlocState>(builder: (context, state) {
      //Get the matching..

      var fn = testEnvironments[state.testEnvironment];
      if (fn != null) {
        return fn(context);
      }
      return Text("Unknown type");
      // return widget here based on BlocA's state
    });
  }
}
