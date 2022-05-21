import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_practice/13/home_screen.dart';

/// StateNotifierProviderでViewModel(のようなStateHolderとして機能するもの）を実装するサンプル

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
        primarySwatch: Colors.purple,
      ),
      home: const HomeScreen(),
    );
  }
}
