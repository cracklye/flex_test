import 'package:flex_test/src/model/test_definition.dart';
import 'package:flex_test/src/model/test_group.dart';
import 'package:woue_components/woue_components.dart';

abstract class TestBlocEvent {}

class TestBlocEventSelectEnvironment extends TestBlocEvent {
  final DesignFramework environment;
  TestBlocEventSelectEnvironment(this.environment);
}

class TestBlocEventSelectTestCase extends TestBlocEvent {
  final TestGroup? testGroup;
  final TestDefinition? test;
  TestBlocEventSelectTestCase({this.test, this.testGroup});
}
