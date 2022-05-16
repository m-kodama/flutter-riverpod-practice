import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// FutureProvider
///
/// FutureProvider = Provider + FutureBuilder
/// 単一のFutureな値を公開できるProvider

final dummyAsyncFuncProvider = FutureProvider((ref) async {
  final value1 = await dummyAsyncFunc(1);
  final value2 = await dummyAsyncFunc(2);
  return value1 + value2;
});

dummyAsyncFunc(int value) async {
  await Future.delayed(Duration(seconds: value));
  return value * value;
}

class FutureProviderPage extends ConsumerWidget {
  const FutureProviderPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    /// AsyncValue<T>型で読み取れる
    final dummyValue = ref.watch(dummyAsyncFuncProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('FutureProvider'),
      ),
      body: Center(
        /// AsyncValue は .when を使って各状態ごとのハンドリングを行う
        child: dummyValue.when(
          data: (value) => Text('値取得完了: $value'),
          error: (error, stack) => Text('エラー: $error'),
          loading: () => const CircularProgressIndicator(),
        ),
      ),
    );
  }
}
