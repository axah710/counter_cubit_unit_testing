import 'package:bloc_test/bloc_test.dart';
import 'package:counter_cubit_unit_testing/counter_cubit.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  ////! The group function organizes related tests together under a common
  ////! label, "CounterCubit Test" here, which makes test results easier to
  ////! read and categorize.
  group("CounterCubit Test", () {
    //! Declares counterCubit using the late keyword, which allows for deferred
    //! initialization. This means counterCubit will be assigned a value within
    //! the setUp method before each test starts.
    late CounterCubit counterCubit;
    ////! setUp is a special function that runs before each individual test inside
    ////! the group. Here, it initializes counterCubit as a new instance of
    ////! CounterCubit before each test begins, ensuring a fresh start for each test.
    setUp(() {
      counterCubit = CounterCubit();
    });
    ////! tearDown runs after each test, closing the counterCubit instance to free
    ////! up resources. This ensures that CounterCubit is properly disposed of
    ////! after each test case.
    tearDown(() {
      counterCubit.close();
    });
    ////! This is a test for the increment method of CounterCubit. blocTest is a
    ////! function specifically for testing cubits and blocs.
    blocTest("CounterCubit Increment Test",
        //!  A description of the test, which will be displayed in the test results.
        build: () => counterCubit,
        //! A function that returns the counterCubit instance. This is how
        //! blocTest accesses the cubit for this test.
        act: (bloc) => bloc.increment(),
        //! The action to test, which is calling increment() on counterCubit.
        //! This simulates what would happen in the application when the
        //! increment function is called.
        expect: () => [1],
        //! Specifies the expected state(s) after increment is called.
        verify: (bloc) => counterCubit.increment
        //! Optional parameter for additional verification after the test is
        //! complete. Here, it verifies that increment was indeed called on the
        //! counterCubit.
        );
    blocTest(
      "CounterCubit Decrement Test",
      build: () => counterCubit,
      act: (bloc) {
        bloc.decrement();
        bloc.decrement();
      },
      expect: () => [-1, -2],
      //! The list [-1, -2] indicates that the BLoC is expected to emit two state,
      //! and that state should be -1 and -2.
      verify: (bloc) => counterCubit.decrement,
    );
  });
}

//! Note:-

//! verify: (bloc) => counterCubit.increment

//! In this case, counterCubit.increment is being passed as a reference to the
//! function increment. The absence of parentheses () means we are passing the
//! function itself as a callback or a reference. This allows the verify step
//! to check or validate that the function increment exists or was triggered,
//! but it is not actually executing the function.

//! act: (bloc) => bloc.increment(),

//! Here, bloc.increment() calls the increment function immediately because of
//! the parentheses (). This actually invokes the function during the act step.
