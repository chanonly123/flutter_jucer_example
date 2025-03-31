// AUTO GENERATED FILE, DO NOT EDIT.
//
// Generated by `package:ffigen`.
// ignore_for_file: type=lint
import 'dart:ffi' as ffi;
import 'package:ffi/ffi.dart' as pkg_ffi;

/// Generate c header to dart bindings
class JuceLibGen {
  /// Holds the symbol lookup function.
  final ffi.Pointer<T> Function<T extends ffi.NativeType>(String symbolName)
      _lookup;

  /// The symbols are looked up in [dynamicLibrary].
  JuceLibGen(ffi.DynamicLibrary dynamicLibrary)
      : _lookup = dynamicLibrary.lookup;

  /// The symbols are looked up with [lookup].
  JuceLibGen.fromLookup(
      ffi.Pointer<T> Function<T extends ffi.NativeType>(String symbolName)
          lookup)
      : _lookup = lookup;

  int juce_add(
    int a,
    int b,
  ) {
    return _juce_add(
      a,
      b,
    );
  }

  late final _juce_addPtr =
      _lookup<ffi.NativeFunction<ffi.Int Function(ffi.Int, ffi.Int)>>(
          'juce_add');
  late final _juce_add = _juce_addPtr.asFunction<int Function(int, int)>();

  int juce_apply_reverb_effect(
    ffi.Pointer<pkg_ffi.Utf8> inputFile,
    ffi.Pointer<pkg_ffi.Utf8> outputFile,
  ) {
    return _juce_apply_reverb_effect(
      inputFile,
      outputFile,
    );
  }

  late final _juce_apply_reverb_effectPtr = _lookup<
      ffi.NativeFunction<
          ffi.Int Function(ffi.Pointer<pkg_ffi.Utf8>,
              ffi.Pointer<pkg_ffi.Utf8>)>>('juce_apply_reverb_effect');
  late final _juce_apply_reverb_effect =
      _juce_apply_reverb_effectPtr.asFunction<
          int Function(ffi.Pointer<pkg_ffi.Utf8>, ffi.Pointer<pkg_ffi.Utf8>)>();
}
