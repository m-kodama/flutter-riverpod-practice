import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_practice/01_provider.dart';
import 'package:riverpod_practice/02_state_provider.dart';
import 'package:riverpod_practice/03_state_notifier_provider.dart';
import 'package:riverpod_practice/04_future_privider.dart';
import 'package:riverpod_practice/05_stream_provider.dart';

class MyValue {
  MyValue(this.value);
  final int value;
}

// Providerの宣言
// ref を使うと他のProviderを読み取ることが可能
final myProvider = Provider((ref) => MyValue(0));

void main() {
  runApp(
    // ProviderScopeで囲んだ範囲でProviderが有効になる
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        useMaterial3: true,
        primarySwatch: Colors.blue,
      ),
      home: const StreamProviderPage(),
    );
  }
}
