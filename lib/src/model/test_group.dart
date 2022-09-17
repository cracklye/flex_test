import 'package:flex_test/src/model/test_definition.dart';

enum TestPageType { grid, listview, tab, column }

class TestGroup {
  final String name;
  final String? description;

  final List<TestDefinition> tests;
  final TestPageType pageType;
  final Function(Map<String, dynamic>, Function(String, dynamic))?
      buildOptionPanel;
  TestGroup(this.name, this.tests,
      {this.description,
      this.pageType = TestPageType.listview,
      this.buildOptionPanel});

  @override
  String toString() {
    return name;
  }
}
