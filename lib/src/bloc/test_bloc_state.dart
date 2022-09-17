import 'package:flex_test/src/model/test_definition.dart';
import 'package:flex_test/src/model/test_group.dart';
import 'package:woue_components/woue_components.dart';

class TestBlocState {
  final List<TestGroup> tests;
  final DesignFramework? testEnvironment;
  final TestGroup? selectedGroup;
  final TestDefinition? selectedTest;

  TestBlocState(this.tests, this.testEnvironment,
      {this.selectedTest, this.selectedGroup});

  TestBlocState copy(
      {DesignFramework? testEnvironment,
      TestDefinition? selectedTest,
      TestGroup? selectedGroup}) {
    return TestBlocState(
      tests,
      testEnvironment ?? this.testEnvironment,
      selectedTest: selectedTest ?? this.selectedTest,
      selectedGroup: selectedGroup ?? this.selectedGroup,
    );
  }
}
