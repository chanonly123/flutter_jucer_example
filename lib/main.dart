import 'package:ffi/ffi.dart';
import 'package:flutter/material.dart';
import 'package:flutter_jucer/asset_helper.dart';
import 'package:flutter_jucer/juce_lib_wrapper.dart';
import 'package:just_audio/just_audio.dart';

Future<void> main() async {
  JuceLibWrapper juce = JuceLibWrapper();
  juce.lib.juce_init();
  runApp(const MyApp());
  int result = juce.lib.juce_add(2, 3);
  print("result: $result");

  var input = await AssetHelper.extractAsset('assets/media/audio.wav');
  var appPath = await AssetHelper.getApplicationDocumentsDirectoryPath();
  var output = "$appPath/output.wav";
  var reverbOutput = juce.lib.juce_apply_reverb_effect(input.toNativeUtf8(), output.toNativeUtf8());
  print("processAudio: $reverbOutput");

  final player = AudioPlayer();
  await player.setFilePath(output);
  // await player.play();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  JuceLibWrapper juce = JuceLibWrapper();

  void _incrementCounter() {
    juce.lib.juce_play_test_sound();
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('You have pushed the button this many times:'),
            Text('$_counter', style: Theme.of(context).textTheme.headlineMedium),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
