# counter_cubit_unit_testing

1. Set up the project by adding bloc_test and flutter_bloc packages in pubspec.yaml. Run the command to install them.

2. Create the CounterCubit, which is a class that extends Cubit and controls a counter with increment and decrement methods. The initial state is zero.

3. In the test directory, create a file to write unit tests for CounterCubit.

4. Declare a CounterCubit variable using the `late` keyword, allowing initialization later in the setup for each test.

5. Use setup and teardown functions to initialize and close CounterCubit before and after each test. In setup, create a new instance of CounterCubit, and in teardown, close the cubit to release resources.

6. Group all tests related to CounterCubit together for readability.

7. Write a test to check if the initial state of CounterCubit is zero, using `expect` to verify that the state is zero at the start.

8. Use blocTest for increment and decrement. Each blocTest has several parts:
   - Specify the cubit and state type (CounterCubit with an integer state)
   - Build: supply the instance of CounterCubit created in setup
   - Act: define the action to perform on CounterCubit, like calling increment
   - Expect: define the expected output state after the action. For example, if calling increment, the expected state would be one; if calling decrement, the expected state would be negative one.

9. Build creates the CounterCubit instance, act performs the action, and expect checks if the resulting state matches the expected value after the action.