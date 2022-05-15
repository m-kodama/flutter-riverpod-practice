import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Provider
//
// 外部からは変更できない値を公開できるProvider

final appNameProvider = Provider((_) => 'Riverpod Practice');

class ProviderPage extends ConsumerWidget {
  const ProviderPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Providerを監視・取得するにはwatchを使う
    final appName = ref.watch(appNameProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Provider'),
      ),
      body: Center(
        child: Text(appName),
      ),
    );
  }
}
