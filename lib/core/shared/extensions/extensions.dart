import 'package:riverpod_annotation/riverpod_annotation.dart';

extension AsyncValueX<T> on AsyncValue<T> {
  /// Retrieves the value from an `AsyncValue<T>` or a default value if the value is absent.
  ///
  /// This method checks the state of the `AsyncValue`:
  /// - If the `AsyncValue` contains a value (`asData`), it returns that value.
  /// - If the `AsyncValue` does not contain a value (`asData` is `null` or the value is `null`), it returns the provided fallback value (`defaultValue`).
  ///
  /// Use this method to handle cases where an `AsyncValue` may not have a value and you want to provide a default safe value.
  ///
  /// Example:
  /// ```dart
  /// final asyncValue = ref.watch(someProvider);
  /// final value = asyncValue.asyncDefault(defaultValue);
  /// ```
  ///
  /// [defaultValue] The value to return if the `AsyncValue` does not have a value.
  ///
  /// Returns: The value from the `AsyncValue` if available, otherwise the `defaultValue`.
  T asyncDefault(T defaultValue) {
    return asData?.value ?? defaultValue;
  }
}
