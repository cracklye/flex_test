import 'package:flex_test/src/model/test_definition.dart';
import 'package:flex_test/src/model/test_group.dart';
import 'package:flutter/material.dart';

class TestLog {
  final TestGroup group;
  final TestDefinition test;
  final String message;
  final DateTime? date;
  TestLog(this.message, this.test, this.group, [this.date]);
}
