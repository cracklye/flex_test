import 'package:flutter/material.dart';
import 'package:woue_components/woue_components.dart';

class TestDefinition {
  final String name;
  final String? description;
  final Widget Function(BuildContext, Map<String, dynamic>, Function(String),
      DesignFramework environment) buildTestWidget;

  TestDefinition(this.name, this.buildTestWidget, {this.description});

  Widget build(BuildContext context, Map<String, dynamic> params,
      Function(String) log, DesignFramework environment) {
    return buildTestWidget(context, params, log, environment);
  }
}
