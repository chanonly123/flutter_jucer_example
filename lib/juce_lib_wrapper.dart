import 'dart:ffi';

import 'package:flutter/foundation.dart';
import 'package:flutter_jucer/juce_lib_gen.dart';

class JuceLibWrapper {
  late JuceLibGen lib;

  JuceLibWrapper() {
    lib = JuceLibGen(
        defaultTargetPlatform == TargetPlatform.iOS ? DynamicLibrary.process() : DynamicLibrary.open("libjuce_jni.so"));
  }
}
