import 'package:flex_test/src/bloc/test_bloc_event.dart';
import 'package:flex_test/src/bloc/test_bloc_state.dart';
import 'package:flex_test/src/model/test_group.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:woue_components/woue_components.dart';

class TestBloc extends Bloc<TestBlocEvent, TestBlocState> {
  TestBloc(List<TestGroup> tests, DesignFramework env)
      : super(TestBlocState(tests, env)) {
    on<TestBlocEventSelectEnvironment>(_onTestBlocEventSelectEnvironment);
    on<TestBlocEventSelectTestCase>(_onTestBlocEventSelectTestCase);
  }

  Future<void> _onTestBlocEventSelectEnvironment(
      TestBlocEventSelectEnvironment event, Emitter<TestBlocState> emit) async {
    emit(state.copy(testEnvironment: event.environment));
    Woue.init(event.environment);
  }

  Future<void> _onTestBlocEventSelectTestCase(
      TestBlocEventSelectTestCase event, Emitter<TestBlocState> emit) async {
    if (state.selectedGroup == null && event.testGroup == null) {
      emit(state.copy(selectedGroup: state.tests[0]));
    }
    if (event.testGroup != null) {
      emit(state.copy(selectedGroup: event.testGroup));
    }
  }
}
